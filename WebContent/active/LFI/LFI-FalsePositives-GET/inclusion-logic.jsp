<%@page import="com.sectooladdict.enums.FileAccessRestriction"%>
<%@page import="com.sectooladdict.validators.InputValidator"%>

	<%
		//First set the prefix according to the path type
		if (pathType == PathType.OS_PATH) { //LFI-TRAVERSAL
			if (fileAccessMethod == FileAccessMethod.FILE_CLASS) {
				prefix = currentDirPath; //current application directory
			} else {
				prefix = contextRelativeDirPath; //current application directory
			}
		} else if (pathType == PathType.FILE_DIRECTIVE_URL) { //LFI-TRAVERSAL
			prefix = currentDirPath;
			//file:/ will be added later to the URL, according to req
			//support "file:/" in windows by replacing \ to / 
			if (fileDelimiter.equals("\\")) {
				try {
					prefix = prefix.replaceAll("\\", "/");
				} catch (Exception e) {
				}
			}
		} else if (pathType == PathType.FTP_URL) { //RFI
			prefix = FileConstants.FTP_PREFIX + request.getServerName()
					+ ":" + FileConstants.FTP_PORT/*21*/+ "/"
					+ contextRelativeDirPath;
		} else if (pathType == PathType.HTTP_URL) { //RFI
			//refix = request.getContextPath() + "/"; //current application directory
			prefix = FileConstants.HTTP_PREFIX + request.getServerName() + ":" +
				request.getServerPort() + request.getContextPath() + 
				contextRelativeDirPath; // + "/";
		}

		if(debugMode == true) {
			System.out.println("*****Initial Prefix*****: " + prefix);
		}

		String defaultTargetFile = null;
		String defaultBasePath = null;

		//set the default base path of the default input
		if (defaultInputType == DefaultInputType.FULL_PATH_INPUT
				|| defaultInputType == DefaultInputType.INVALID_INPUT) {

			if (fileAccessMethod == FileAccessMethod.FILE_CLASS) {
				//current eclipse/web server directory
				defaultBasePath = currentDirPath /*directory.getCanonicalPath()*/
						+ fileDelimiter;
				if (pathType == PathType.FILE_DIRECTIVE_URL) {
					defaultBasePath = FileConstants.FILE_PREFIX
							+ defaultBasePath;
				}
			} else if (fileAccessMethod == FileAccessMethod.INCLUDE) {
				//current application directory
				defaultBasePath = currentDirPath + fileDelimiter;
			} else if (fileAccessMethod == FileAccessMethod.CONTEXT_STREAM) {
				//current application directory
				defaultBasePath = contextRelativeDirPath + "/";
			} else if (fileAccessMethod == FileAccessMethod.URL_CLASS
					|| fileAccessMethod == FileAccessMethod.REDIRECT
					|| fileAccessMethod == FileAccessMethod.FORWARD) {
				defaultBasePath =
					FileConstants.HTTP_PREFIX + request.getServerName() + ":" +
						request.getServerPort() + request.getContextPath() + 
						contextRelativeDirPath + "/";
					//request.getContextPath() + "/"; //current application directory
			} else if (fileAccessMethod == FileAccessMethod.FTP_CLASS) {
				defaultBasePath = FileConstants.FTP_PREFIX
						+ request.getServerName() + ":"
						+ FileConstants.FTP_PORT/*21*/+ "/"
						+ contextRelativeDirPath;
			} else {
				throw new Exception(
						"Unsupported FileAccessMethod for Default URL Base Path");
			}

		} else if (defaultInputType == DefaultInputType.RELATIVE_INPUT
				|| defaultInputType == DefaultInputType.EMPTY_INPUT) {

			//relative to current dir path
			defaultBasePath = FileConstants.EMPTY_PREFIX;

		} else {
			throw new Exception(
					"Unsupported DefaultInputType for Default URL Base Path");
		}

		//****************************************************************
		//* alter default filename according to the FileInjectionContext *
		//****************************************************************
		switch (injectionContext) {
		case FULL_FILENAME:
			if (defaultInputType == DefaultInputType.FULL_PATH_INPUT) {
				//file in web application directory
				defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE;
			} else if (defaultInputType == DefaultInputType.RELATIVE_INPUT) {
				//file in eclipse directory
				defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_NOT_LOCAL;
				if (pathType == PathType.FILE_DIRECTIVE_URL) {
					defaultTargetFile = FileConstants.FILE_PREFIX
							+ FileConstants.DEFAULT_TARGET_FILE_ROOT_DIR;
				} //no ftp/http support for relative 
			} else {
				//empty or invalid default input types: override at the end for all cases
				defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_ROOT_DIR;
			}
			/*
			if(fileAccessMethod == FileAccessMethod.FILE_CLASS && 
			   pathType == PathType.OS_PATH && prefixRequired != PrefixRequirement.ANY) {
			    
			} else if (pathType == PathType.FILE_DIRECTIVE_URL){
				defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_ROOT_DIR;
			} else {
				defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_NOT_LOCAL;
			}*/

			if (prefixRequired == PrefixRequirement.BACKSLASH_PREFIX) {
				defaultTargetFile = "\\" + defaultTargetFile; //serve as a directory
			} else if (prefixRequired == PrefixRequirement.SLASH_PREFIX) {
				defaultTargetFile = "/" + defaultTargetFile; //serve as a directory
			}

			break;

		case FILENAME_ONLY:
			if (defaultInputType == DefaultInputType.FULL_PATH_INPUT) {
				//file in web application directory
				defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_NAME_ONLY;
			} else if (defaultInputType == DefaultInputType.RELATIVE_INPUT) {
				//file in eclipse directory
				defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_NAME_ONLY_NOT_LOCAL;
				if (pathType == PathType.FILE_DIRECTIVE_URL) {
					defaultTargetFile = FileConstants.FILE_PREFIX
							+ FileConstants.DEFAULT_TARGET_FILE_NAME_ONLY_ROOT_DIR;
				}
			} else {
				//empty or invalid default input types: override at the end for all cases
				defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_NAME_ONLY_ROOT_DIR;
			}
			/*
			if(fileAccessMethod == FileAccessMethod.FILE_CLASS && 
			   pathType == PathType.OS_PATH && prefixRequired != PrefixRequirement.ANY) {
			} else if (pathType == PathType.FILE_DIRECTIVE_URL){
				defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_NAME_ONLY_ROOT_DIR;
			} else {
				defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_NAME_ONLY_NOT_LOCAL;
			}*/

			if (prefixRequired == PrefixRequirement.BACKSLASH_PREFIX) {
				defaultTargetFile = "\\" + defaultTargetFile; //serve as a directory
			} else if (prefixRequired == PrefixRequirement.SLASH_PREFIX) {
				defaultTargetFile = "/" + defaultTargetFile; //serve as a directory
			}

			break;

		case EXTENSION:
			defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_EXTENSION;
			break;

		case DIRECTORY:
			//only test cases for directories in app are supported (so far)
			defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_DIRECTORY;

			if (prefixRequired == PrefixRequirement.BACKSLASH_PREFIX) {
				defaultTargetFile = "\\" + defaultTargetFile + "\\"; //serve as a directory
			} else if (prefixRequired == PrefixRequirement.SLASH_PREFIX) {
				defaultTargetFile = "/" + defaultTargetFile + "/"; //serve as a directory
			} else if (pathType == PathType.OS_PATH
					&& fileDelimiter.equals("\\")
					&& fileAccessMethod == FileAccessMethod.FILE_CLASS) {
				defaultTargetFile = defaultTargetFile + "\\"; //serve as a directory
			} else {
				defaultTargetFile = defaultTargetFile + "/"; //serve as a directory;
			}
			break;

		default:
			break;
		}

		//************************************************************
		//* alter prefixRequired according to the PrefixRequirement *
		//************************************************************
		switch (prefixRequired) {
		case ANY: //Don't Add Any Prefix
			prefix = FileConstants.EMPTY_PREFIX;
			break;
		case NONE: //Add Full Path Prefix
			if (pathType == PathType.OS_PATH) {
				prefix = prefix + fileDelimiter; //OS specific
			} else if (pathType == PathType.FILE_DIRECTIVE_URL) { //File Directive
				prefix = prefix + "/";
			}
			//add nothing in FTP, HTTP
			break;
		case SLASH_PREFIX: //leave prefix intact, already missing /
			break;
		case BACKSLASH_PREFIX: //leave prefix intact, already missing \
			break;
		case FTP_DIRECTIVE: //require ftp:// and optional fullpath
			prefix = FileConstants.EMPTY_PREFIX;
			if (pathType != PathType.FTP_URL) {
				throw new Exception(
						"Requirement Mismatch - FTP directive can only be used with FTP URL");
			}
			break;
		case HTTP_DIRECTIVE: //require http:// and optional fullpath
			prefix = FileConstants.EMPTY_PREFIX;
			if (pathType != PathType.HTTP_URL) {
				throw new Exception(
						"Requirement Mismatch - HTTP directive can only be used with HTTP URL");
			}
			break;
		default:
			break;
		}

		if (debugMode == true) {
			//#####Debug#####
			System.out.println("\n");
			System.out.println("Default Target File (Prior to Concat): "
					+ defaultTargetFile);
			System.out.println("Default Base Path (Prior to Concat): "
					+ defaultBasePath);
		}

		if (prefixRequired == PrefixRequirement.ANY) {
			//default file: concat with base directory
			defaultTargetFile = defaultBasePath + defaultTargetFile;
		}

		//if default input is empty/invalid,
		//make sure it will be so in post forms as well
		if (defaultInputType == DefaultInputType.INVALID_INPUT) {
			//overrun with invalid input (content not found)
			switch (injectionContext) {
			case FULL_FILENAME:
				defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_INVALID;
				break;
			case FILENAME_ONLY:
				defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE_NAME_ONLY_INVALID;
			case EXTENSION:
				defaultTargetFile = FileConstants.DEFAULT_EXTENSION_INVALID;
			case DIRECTORY: //same as default
			default:
				defaultTargetFile = FileConstants.DEFAULT_DIRECTORY_INVALID
						+ fileDelimiter;
				break;
			}
			defaultTargetFile = defaultBasePath + defaultTargetFile;//concat with base directory

		} else if (defaultInputType == DefaultInputType.EMPTY_INPUT) {
			//overrun with empty input
			defaultTargetFile = FileConstants.EMPTY_INPUT;
		}

		if (pathType == PathType.FILE_DIRECTIVE_URL) {
			defaultTargetFile = defaultTargetFile.replace("\\", "/");
		}

		if (debugMode == true) {
			//#####Debug#####
			System.out.println("Default Target File: " + defaultTargetFile);
			System.out.println("Default Base Path: " + defaultBasePath);
		}
	%>
	
	<%
		if (request.getParameter("target") == null) {
	%>
	<%
		if (validResposeStream
					.equals(ContentConstants.CONTENT_TYPE_TEXT_HTML)) {
	%>

	Show Log:
	<br>
	<br>
	<form name="frmInput" id="frmInput" method="POST">
		<input type="text" name="target" id="target"
			value="<%=defaultTargetFile%>"><br> <input type=submit
			value="Get It!">
	</form>

	<%
		} else if (validResposeStream
					.equals(ContentConstants.CONTENT_TYPE_STREAM)) {
	%>

	Get Content:
	<br>
	<br>
	<form name="frmInput" id="frmInput" method="POST">
		<input type="text" name="target" id="target"
			value="<%=defaultTargetFile%>"><br> <input type=submit
			value="Get It!">
	</form>

	<%
		} else {
	%>

	Get Content:
	<br>
	<br>
	<form name="frmInput" id="frmInput" method="POST">
		<input type="text" name="target" id="target"
			value="<%=defaultTargetFile%>"><br> <input type=submit
			value="Get It!">
	</form>

	<%
		}
	%>
	<%
		} else {

			String targetFile = null;
			
			if(accessRestriction != FileAccessRestriction.IGNORE_INPUT) {
				targetFile = request.getParameter("target");
			} else {
				targetFile = defaultTargetFile;
			}
			
			boolean inputValidationFailure = false;

			//Potential Input Validation / Removal
			if (accessRestriction == FileAccessRestriction.UNIX_TRAVESAL_INPUT_VALIDATION) {
				if (InputValidator.validateUnixTraversal(targetFile)) {
					inputValidationFailure = true;
				}
			} else if (accessRestriction == FileAccessRestriction.UNIX_TRAVESAL_INPUT_REMOVAL) {
				targetFile = InputValidator.removeUnixTraversal(targetFile);
			} else if (accessRestriction == FileAccessRestriction.WINDOWS_TRAVESAL_INPUT_VALIDATION) {
				if (InputValidator.validateWindowsTraversal(targetFile)) {
					inputValidationFailure = true;
				}
			} else if (accessRestriction == FileAccessRestriction.WINDOWS_TRAVESAL_INPUT_REMOVAL) {
				targetFile = InputValidator
						.removeWindowsTraversal(targetFile);
			} else if (accessRestriction == FileAccessRestriction.SLASH_INPUT_VALIDATION) {
				if (InputValidator.validateSlash(targetFile)) {
					inputValidationFailure = true;
				}
			} else if (accessRestriction == FileAccessRestriction.SLASH_INPUT_REMOVAL) {
				targetFile = InputValidator.removeSlash(targetFile);
				System.out.println("alskjalsdkjalsdkjalsdkj file: " + targetFile);
			} else if (accessRestriction == FileAccessRestriction.BACKSLASH_INPUT_VALIDATION) {
				if (InputValidator.validateBackSlash(targetFile)) {
					inputValidationFailure = true;
				}
			} else if (accessRestriction == FileAccessRestriction.BACKSLASH_INPUT_REMOVAL) {
				targetFile = InputValidator.removeBackSlash(targetFile);
			} else if (accessRestriction == FileAccessRestriction.HTTP_INPUT_VALIDATION) {
				if (InputValidator.validateHttp(targetFile)) {
					inputValidationFailure = true;
				}
			} else if (accessRestriction == FileAccessRestriction.HTTP_INPUT_REMOVAL) {
				targetFile = InputValidator.removeHttp(targetFile);
			} else if (accessRestriction == FileAccessRestriction.WHITE_LIST) {
				if (!(targetFile.equals("validfile1.jsp") || targetFile.equals("validfile1")
					|| targetFile.equals("validfile2.jsp") || targetFile.equals("validfile2")
					|| targetFile.equals(defaultBasePath + "validfile1.jsp") 
					|| targetFile.equals(defaultBasePath + "validfile1") 
					|| targetFile.equals(defaultBasePath + "validfile2.jsp") 
					|| targetFile.equals(defaultBasePath + "validfile2"))) {
					inputValidationFailure = true;
				}
			} else if (accessRestriction == FileAccessRestriction.TRAVERSAL_REMOVAL_AND_WHITE_LIST) {
				//remove traversal to create the illusion of working ./, ../ chars
				targetFile = InputValidator.removeUnixTraversal(targetFile);
				targetFile = InputValidator.removeWindowsTraversal(targetFile);
				targetFile = InputValidator.removeUnixLocalTraversal(targetFile);
				targetFile = InputValidator.removeWindowsLocalTraversal(targetFile);
				
				if (!(targetFile.equals("validfile1.jsp") || targetFile.equals("validfile1")
						|| targetFile.equals("validfile2.jsp") || targetFile.equals("validfile2")
						|| targetFile.equals(defaultBasePath + "validfile1.jsp") 
						|| targetFile.equals(defaultBasePath + "validfile1") 
						|| targetFile.equals(defaultBasePath + "validfile2.jsp") 
						|| targetFile.equals(defaultBasePath + "validfile2"))) {
						inputValidationFailure = true;
			    }
			}
			

			//add initial prefix to target file
			//targetFile = prefix + targetFile; 

			if (debugMode == true) {
				//#####Debug#####
				System.out.println("\n\n");
				System.out.println("Final Relative Access:"
						+ contextRelativeDirPath + "/" + targetFile);
				System.out.println("Final Full Access:" + currentDirPath
						+ "/" + targetFile);
				System.out.println("Target File: " + targetFile + "\n");
			}

			//*********************************************************
			//* alter targeFile according to the FileInjectionContext *
			//*********************************************************
			switch (injectionContext) {
			case FULL_FILENAME:
				//leave intact - full control over the filename 
				break;
			case FILENAME_ONLY:
				//add the default extension to the file
				//(limit control to name and not the extention)
				targetFile = targetFile + "."
						+ FileConstants.DEFAULT_TARGET_FILE_EXTENSION;
				break;
			case EXTENSION:
				//###NOT implemented in mainstream tests###
				throw new Exception(
						"EXTENSION injection context not implemented");
			case DIRECTORY:
				//input should include slash/backslash suffix
				//to simplify the test cases, all dir cases must be fullpath
				targetFile = targetFile /*serve as a directory*/
						+ FileConstants.DEFAULT_TARGET_FILE;
				break;
			default:
				break;
			}

			//***********************
			//* Vulnerability Logic *
			//***********************
			InputStream is = null;
			File file = null; //Unnecessary

			try {

				if (inputValidationFailure == true) {
					throw new Exception("Input Validation Failure");
				}

				if (vulnerability == VulnerabilityType.LFI
						|| vulnerability == VulnerabilityType.DIRECTORY_TRAVERSAL) {
					//Local File Inclusion / Directory Traversal

					//choose file access method
					if (fileAccessMethod == FileAccessMethod.CONTEXT_STREAM
							&& pathType == PathType.OS_PATH) {
						//Vulnerable to LFI / Traversal

						is = getServletContext().getResourceAsStream(
								prefix /*contextPathDir*/+ targetFile);

						//FileInjectionContext
					} else if (fileAccessMethod == FileAccessMethod.FILE_CLASS
							&& pathType == PathType.FILE_DIRECTIVE_URL) {
						//Vulnerable to LFI / Traversal					
						if (prefixRequired == PrefixRequirement.ANY) {
							//Effectively Requires FILE_DIRECTIVE
							//Do nothing - leave file intact
							//Represents input in the format of file:/file.ext
							//without any real restriction
						} else if (prefixRequired == PrefixRequirement.NONE) {
							targetFile = FileConstants.FILE_PREFIX
									+ currentDirPath + "/" + targetFile; //should work even with full path since file:// works
						} else if (prefixRequired == PrefixRequirement.SLASH_PREFIX) {
							//targetFile = (FileConstants.FILE_PREFIX).substring(0,FileConstants.FILE_PREFIX.length()-1)
							//+ targetFile; //should work even with full path since file:// works
							targetFile = FileConstants.FILE_PREFIX
									+ currentDirPath + targetFile; // without / between path & file 
						} else if (prefixRequired == PrefixRequirement.BACKSLASH_PREFIX) {
							targetFile = FileConstants.FILE_PREFIX
									+ currentDirPath + targetFile; // without / between path & file 
						} else {
							targetFile = FileConstants.FILE_PREFIX
									+ targetFile; //should work even with full path since file:// works
						}
						if (debugMode == true) {
							System.out.println("File:" + targetFile);
							System.out.println("prefix:" + prefix);
							System.out.println("File to access:" + prefix
									+ targetFile);
							File f = new File(".");
							System.out
									.println("Current Absultoe File Path: "
											+ f.getAbsolutePath());
							System.out
									.println("Current Canonical Dir Path: "
											+ f.getCanonicalPath());
						}
						URL url = new URL(targetFile);
						try {
							file = new File(url.toURI());
						} catch (URISyntaxException e) {
							file = new File(url.getPath());
						}
						is = new FileInputStream(file);

					} else if (fileAccessMethod == FileAccessMethod.FILE_CLASS
							&& pathType == PathType.OS_PATH) {
						//file = new File(currentDirPath + targetFile);
						//is = new FileInputStream(file);
						if (debugMode == true) {
							System.out.println("File to access:" + prefix
									+ targetFile);
							File f = new File(".");
							System.out
									.println("Current Absultoe File Path: "
											+ f.getAbsolutePath());
							System.out
									.println("Current Canonical Dir Path: "
											+ f.getCanonicalPath());
						}
						//f = new File(prefix + targetFile);
						//is = new FileInputStream(f);
						is = new FileInputStream(prefix + targetFile);
					} else {
						//In the future - Forward
						throw new Exception(
								"Unsupported file access method");
					}

				} else if (vulnerability == VulnerabilityType.RFI) {
					//Remote File Inclusion (Not Including Code Inclusion)

					//choose file access method
					if (fileAccessMethod == FileAccessMethod.FTP_CLASS
							&& pathType == PathType.FTP_URL) {
						//NOT Implemented
						throw new Exception(
								"Unsupported file access method");
						//code sample: http://www.kodejava.org/examples/357.html
						//is = new FileInputStream(targetFile);
					} else if (fileAccessMethod == FileAccessMethod.URL_CLASS
							&& pathType == PathType.HTTP_URL) {
						//$$$$$For RFI or unauthorized localhost access$$$$$
						URL url = null;
						URLConnection urlconn = null;
						if(prefixRequired == PrefixRequirement.ANY) {
							url = new URL(targetFile);
							urlconn = url.openConnection();
						} else if(prefixRequired == PrefixRequirement.NONE) {
							url = new URL(prefix + targetFile);
							urlconn = url.openConnection();
						} else {
							throw new Exception(
								"Unsupported prefix in RFI test case");
						}
						is = urlconn.getInputStream();
					} else {
						throw new Exception(
								"Unsupported file access method");
					}

				} else if (vulnerability == VulnerabilityType.CODE_RFI
						|| vulnerability == VulnerabilityType.CODE_LFI) {
					//Code Inclusion
					throw new Exception("Unsupported vulnerability type");

				} else if (vulnerability == VulnerabilityType.FALSE_POSITIVE) {
					//False Positive
					if (fileAccessMethod == FileAccessMethod.FORWARD) {
						getServletConfig().getServletContext()
								.getRequestDispatcher(targetFile)
								.forward(request, response);
						return;
					} else if (fileAccessMethod == FileAccessMethod.REDIRECT) {
						//might be vulnerable to open redirect, but not rfi/lfi
						response.sendRedirect(targetFile);
						return;
					} else {
						//In the future - Forward
						throw new Exception(
								"Unsupported file access method");
					}

					//Implement for File / URL / Stream
				} else {
					throw new Exception("Unsupported vulnerability type");
				}

				//access the file
				if (is != null) {

					//$$$set valid response content type$$$
					response.setContentType(validResposeStream);

					if (accessRestriction != FileAccessRestriction.ENUMERATION_ONLY) {
						BufferedInputStream bis = new BufferedInputStream(is);
						ServletOutputStream ouputStream = response
								.getOutputStream();
						byte byteBuffer[] = new byte[8192];
						while (true) {
							int bytesRead = is.read(byteBuffer);
							if (bytesRead < 0)
								break;
							ouputStream.write(byteBuffer, 0, bytesRead);
							ouputStream.flush();
							ouputStream.close();
							
							byteBuffer = null;
						}
					} else { //enumeration only
						out.println("Valid File Name");
						out.flush();
					}

				} else {
					//set errorneous response content type
					//response.setContentType(validResposeStream);

					if (invalidResponseType == ResponseType.ERROR_500) {
						response.sendError(500, "Invalid File Name");
					} else if (invalidResponseType == ResponseType.ERROR_404) {
						response.sendError(404, "File Not Found");
					} else if (invalidResponseType == ResponseType.REDIRECT_302) {
						response.sendRedirect("MissingResource.html");
					} else if (invalidResponseType == ResponseType.ERROR_200) {
						out.println("Invalid File Name");
					} else if (invalidResponseType == ResponseType.VALID_200) {
						out.println("The information is unavailable at this time.<BR>"
								+ "Please try again later.");
					} else if (invalidResponseType == ResponseType.IDENTICAL_200) {
						//return a default empty value (found in the default file)
						//if(validResposeStream.equals(ContentConstants.CONTENT_TYPE_TEXT_HTML) ) {
						out.println("<xml><fileContent><user>Kuekuatsu</user><role>manager</role></fileContent></xml>");
					}
					out.flush();
				}

			} catch (Exception e) {
				//set errorneous response content type
				//response.setContentType(validResposeStream);
				
				if (invalidResponseType == ResponseType.ERROR_500) {
					response.sendError(500, "Exception details: " + e);
				} else if (invalidResponseType == ResponseType.ERROR_404) {
					response.sendError(404, "File Not Found");
				} else if (invalidResponseType == ResponseType.REDIRECT_302) {
					response.sendRedirect("MissingResource.html");
				} else if (invalidResponseType == ResponseType.ERROR_200) {
					out.println("Exception details: " + e);
				} else if (invalidResponseType == ResponseType.VALID_200) {
					out.println("The information is unavailable at this time.<BR>"
							+ "Please try again later.");
				} else if (invalidResponseType == ResponseType.IDENTICAL_200) {
					//return a default empty value (found in the default file)
					//if(validResposeStream.equals(ContentConstants.CONTENT_TYPE_TEXT_HTML) ) {
					out.println("<xml><fileContent><user>Kuekuatsu</user><role>manager</role></fileContent></xml>");
				}
				out.flush();
			} finally {
				if (is != null)
					try {
						is.close();
					} catch (Exception ignored) {
						//do nothing
					}
			}

		} //end of if/else block
	%>

</body>
</html>