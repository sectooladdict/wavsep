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
public enum PrefixRequirement {
	ANY, //no path prefix - can be used with full, relative or local path
	     //will require "file:/" or "file://" in file directive
	NONE, //There's a full path prefix with slash or backslash
	SLASH_PREFIX, //There's a full path prefix WITHOUT slash
				  //use with File/URL access method
	/*##############*/
	/*## LFI ONLY ##*/
	/*##############*/
	BACKSLASH_PREFIX, //There's a full path prefix WITHOUT backslash
					  //use with File access method (Windows)
	/*##############*/
	/*## RFI ONLY ##*/
	/*##############*/
	FTP_DIRECTIVE, //requires "ftp:/" or "ftp://"
	HTTP_DIRECTIVE, //requires "http://" or "https://"
	/*###############################*/
	/*## UNVALIDATED REDIRECT ONLY ##*/
	/*###############################*/
	WEBPAGE_ADDRESS_WITHOUT_PROTOCOL //requires a web page address *without* "http://" or "https://"
}

