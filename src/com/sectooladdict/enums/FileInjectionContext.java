/**
 * 
 */
package com.sectooladdict.enums;

/**
 * This enum defines file inclusion injection contexts.
 *
 * @author Shay Chen
 * @since 1.2
 * */
public enum FileInjectionContext {
	FULL_FILENAME, //The input is injected into filename.extension (nothing appended) 
	FILENAME_ONLY, //The input is injected into filename (fixed extension appended)
	DIRECTORY, //The input is injected into directory (fixed filename & extension appended)
	EXTENSION; //The input is injected into the extension (NOT IMPLEMENTED)
	//Removed: FULL_PATH; //The input is injected into full path start / drive / dirs / file / extension (nothing appended, no prefix)
}
