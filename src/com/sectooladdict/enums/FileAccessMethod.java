/**
 * 
 */
package com.sectooladdict.enums;

/**
 * This enum defines methods for accessing the target file.
 *
 * @author Shay Chen
 * @since 1.2
 */
public enum FileAccessMethod {
	/*##############*/
	/*## LFI ONLY ##*/
	/*##############*/
	CONTEXT_STREAM, //Access via getServletContext().getResourceAsStream
	FILE_CLASS, //Access via File or FileInputStream
	/*##############*/
	/*## RFI ONLY ##*/
	/*##############*/
	URL_CLASS,//Access via URL
	FTP_CLASS,//Access via FTP - NOT IMPLEMENTED
	/*##################*/
	/*## CODE-FI ONLY ##*/
	/*##################*/
	INCLUDE,//Include via JSP Inclusion
	/*#########################################################*/
	/*## FALSE POSITIVE FILE INCLUSION OR OPEN REDIRECT ONLY ##*/
	/*#########################################################*/
	REDIRECT,//JSP Redirect (302)
	FORWARD; //JSP Forward 
}
