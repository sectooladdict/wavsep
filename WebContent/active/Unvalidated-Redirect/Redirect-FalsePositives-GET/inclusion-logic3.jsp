<%@page import="com.sectooladdict.enums.PrefixRequirement"%>
<%@page import="com.sectooladdict.enums.VulnerabilityType"%>
<%@page import="com.sectooladdict.constants.FileConstants"%>
<%@page import="com.sectooladdict.validators.InputValidator"%>


	<%
		//First set the prefix according to the path type
		if (pathType == PathType.FTP_URL) { //RFI/FORWARD/REDIRECT
			prefix = (prefixRequired == PrefixRequirement.ANY ? "" : FileConstants.FTP_PREFIX);
		} else if (pathType == PathType.HTTP_URL) { //RFI/FORWARD/REDIRECT
			//refix = request.getContextPath() + "/"; //current application directory
			prefix = (prefixRequired == PrefixRequirement.ANY ? "" : FileConstants.HTTP_PREFIX);
		} else {
			throw new Exception("Unsupported Path Type");
		}

		if(debugMode == true) {
			System.out.println("*****Initial Prefix*****: " + prefix);
		}

		String defaultTargetFile = null;
		String defaultBasePath = null;

		//set the default base path of the default input
		if (defaultInputType == DefaultInputType.FULL_PATH_INPUT
				|| defaultInputType == DefaultInputType.INVALID_INPUT) {

			//###################################################################################################
			//###################################################################################################
			//###################################################################################################
			if (fileAccessMethod == FileAccessMethod.URL_CLASS
					|| fileAccessMethod == FileAccessMethod.REDIRECT
					|| fileAccessMethod == FileAccessMethod.FORWARD) {
				defaultBasePath = (prefixRequired == PrefixRequirement.ANY ? FileConstants.HTTP_PREFIX : "")
				        + request.getServerName() + ":" +
						request.getServerPort() + request.getContextPath() + 
						contextRelativeDirPath + "/";
			} else {
				throw new Exception(
						"Unsupported FileAccessMethod for Default URL Base Path");
			}

		} else if (defaultInputType == DefaultInputType.PARTIAL_PATH_INPUT) {
			//URL without http/s prefix
			defaultBasePath = request.getServerName() + ":" + request.getServerPort() 
				+ request.getContextPath() + contextRelativeDirPath + "/";

		} else if (defaultInputType == DefaultInputType.RELATIVE_INPUT
				|| defaultInputType == DefaultInputType.EMPTY_INPUT) {
			
			defaultBasePath = "";

		} else {
			throw new Exception(
					"Unsupported DefaultInputType for Default URL Base Path");
		}

		//****************************************************************
		//* alter default filename according to the FileInjectionContext *
		//****************************************************************
		defaultTargetFile = FileConstants.DEFAULT_TARGET_FILE;
		
		//************************************************************
		//* alter prefixRequired according to the PrefixRequirement *
		//************************************************************
		switch (prefixRequired) {
		case ANY: //Don't Add Any Prefix
			prefix = FileConstants.EMPTY_PREFIX;
			break;
		case NONE: //Add Full Path Prefix
			//change nothing in FTP, HTTP
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
		case WEBPAGE_ADDRESS_WITHOUT_PROTOCOL: //require domain without protocol
			//leave intact - the prefix was set as either http or ftp before
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

		if (prefixRequired == PrefixRequirement.ANY || prefixRequired == PrefixRequirement.NONE
				|| prefixRequired == PrefixRequirement.WEBPAGE_ADDRESS_WITHOUT_PROTOCOL) {
			//default file: concat with base directory
			defaultTargetFile = defaultBasePath + defaultTargetFile;
		}

		//if default input is empty/invalid,
		//make sure it will be so in post forms as well
		if (defaultInputType == DefaultInputType.INVALID_INPUT) {
			//overrun with invalid input (content not found)
			defaultTargetFile = defaultBasePath + FileConstants.DEFAULT_TARGET_FILE_INVALID;

		} else if (defaultInputType == DefaultInputType.EMPTY_INPUT) {
			//overrun with empty input
			defaultTargetFile = FileConstants.EMPTY_INPUT;
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
		if (validResposeStream.equals(ContentConstants.CONTENT_TYPE_TEXT_HTML)) {
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
		} else if (validResposeStream.equals(ContentConstants.CONTENT_TYPE_STREAM)) {
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

			String targetFile = request.getParameter("target");

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
				//intentional flawed validation - only locates lower case http
				if (InputValidator.validateHttp(targetFile)) {
					inputValidationFailure = true;
				}
			} else if (accessRestriction == FileAccessRestriction.HTTP_INPUT_REMOVAL) {
				//intentional flawed removal - only removes lower case http 
				targetFile = InputValidator.removeHttp(targetFile);
			} else if (accessRestriction == FileAccessRestriction.WHITE_LIST) {
				if (!((targetFile.equals("content.ini") || targetFile.equals("content")
					|| targetFile.equals("content2.ini") || targetFile.equals("content2")
					|| targetFile.equals(defaultBasePath + "content.ini") 
					|| targetFile.equals(defaultBasePath + "content")))) {
					inputValidationFailure = true;
				}
			} else if (accessRestriction == FileAccessRestriction.CONCAT_DOMAIN_BASE_URL) {
				if (!((targetFile.equals("content.ini") || targetFile.equals("content")
						|| targetFile.contains("content2.ini") || targetFile.equals("content2")
						|| targetFile.equals(defaultBasePath + "content.ini") 
						|| targetFile.equals(defaultBasePath + "content")))) {
						targetFile = defaultBasePath + targetFile; //Concat the base URL
						
						System.out.println("yohohoho:" + defaultBasePath);
				}
			}

			if (debugMode == true) {
				//#####Debug#####
				System.out.println("\n\n");
				System.out.println("Final Relative Access:"
						+ contextRelativeDirPath + "/" + targetFile);
				System.out.println("Final Full Access:" + currentDirPath
						+ "/" + targetFile);
				System.out.println("Target File: " + targetFile + "\n");
			}

			//***********************
			//* Vulnerability Logic *
			//***********************
			
			/*
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
			out.flush();*/
			
			try {

				if (inputValidationFailure == true) {
					throw new Exception("Input Validation Failure");
				}

				if (vulnerability == VulnerabilityType.UNVALIDATED_REDIRECT) {
					//False Positive
					if (fileAccessMethod == FileAccessMethod.REDIRECT) {
						if(prefixRequired == PrefixRequirement.WEBPAGE_ADDRESS_WITHOUT_PROTOCOL) {
							targetFile = prefix + targetFile;
						}
										
						if (defaultInputType == DefaultInputType.RELATIVE_INPUT) {
							//relative to current dir path
							defaultBasePath = FileConstants.HTTP_PREFIX
					       		+ request.getServerName() + ":" +
								request.getServerPort() + request.getContextPath() + 
								contextRelativeDirPath + "/";
							targetFile = defaultBasePath + targetFile;
						}
						
						//might be vulnerable to open redirect, but not rfi/lfi
						response.sendRedirect(targetFile);
						return;
					} else {
						//In the future - Forward
						throw new Exception(
								"Unsupported file access method");
					}

					//Implement for File / URL / Stream
				} else if (vulnerability == VulnerabilityType.FALSE_POSITIVE) {
					if(prefixRequired == PrefixRequirement.WEBPAGE_ADDRESS_WITHOUT_PROTOCOL) {
						targetFile = prefix + targetFile;
					}
					//False Positive
					if (fileAccessMethod == FileAccessMethod.FORWARD) {
						getServletConfig().getServletContext()
								.getRequestDispatcher(targetFile)
								.forward(request, response);
						return;
					} else {
						throw new Exception("Unsupported file access method");
					}
				} else {
					throw new Exception("Unsupported vulnerability type");
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
				// do nothings
			}

		} //end of if/else block
	%>


</body>
</html>