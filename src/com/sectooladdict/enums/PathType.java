/**
 * 
 */
package com.sectooladdict.enums;

/**
 * This enum defines the path requirement for the injection.
 *
 * @author Shay Chen
 * @since 1.2
 * */
public enum PathType {
	/*##############*/
	/*## LFI ONLY ##*/
	/*##############*/
	OS_PATH, //current os file path
	FILE_DIRECTIVE_URL, //"file:/" or "file://"
	/*##############*/
	/*## RFI ONLY ##*/
	/*##############*/
	FTP_URL, //"ftp:/" or "ftp://"
	HTTP_URL, //"http://" or "https://"
}
