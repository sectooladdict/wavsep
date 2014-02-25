/**
 * 
 */
package com.sectooladdict.enums;

/**
 * This enum defines the types of file access restrictions.
 *
 * @author Shay Chen
 * @since 1.2
 */
public enum FileAccessRestriction {
	NONE, //No restriction
	WHITE_LIST,  //File/Domain/IP/URL white list
	TRAVERSAL_REMOVAL_AND_WHITE_LIST,  //Traversal Removal and File/Domain/IP/URL white list
	ENUMERATION_ONLY,  //Present status instead of content 
	IGNORE_INPUT,  //Don't perform anything with the input (use a constant/server affected value)
	/*################*/
	/*## NOT-IN-USE ##*/
	/*################*/
	PERMISSIONS, //Unprivileged file access
	LOCAL_FOLDER_ONLY, //Access is limited to local folder (traversal characters removed);
	/*##############*/
	/*## LFI ONLY ##*/
	/*##############*/	
	UNIX_TRAVESAL_INPUT_VALIDATION, //Input Validation (../)
	UNIX_TRAVESAL_INPUT_REMOVAL, //Input Removal (/../, ../)
	WINDOWS_TRAVESAL_INPUT_VALIDATION, //Input Validation (../)
	WINDOWS_TRAVESAL_INPUT_REMOVAL, //Input Removal (/../, ../)
	SLASH_INPUT_VALIDATION, //Input Validation (/)
	SLASH_INPUT_REMOVAL, //Input Removal (/)
	BACKSLASH_INPUT_VALIDATION, //Input Validation (\)
	BACKSLASH_INPUT_REMOVAL, //Input Removal (\)
	/*#######################################*/
	/*## RFI AND UNVALIDATED REDIRECT ONLY ##*/
	/*#######################################*/	
	HTTP_INPUT_VALIDATION, //Input Validation (http)
	HTTP_INPUT_REMOVAL, //Input Removal (http)
    CONCAT_DOMAIN_BASE_URL; //Concats the domain base URL to the input
}
