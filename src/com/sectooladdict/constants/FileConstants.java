package com.sectooladdict.constants;

/**
 * This class contains constants used for file prefix/suffix
 * concatenation related activities.
 *
 * @author Shay Chen
 * @since 1.2
 */
public class FileConstants {
    //*************************
    //* FILE PREFIX CONSTANTS *
    //*************************
	/**
     * This constant is used to signify an empty file/dir input.
     * @since 1.2
     */
	public static final String EMPTY_INPUT = "";
	/**
     * This constant is used to signify an empty prefix.
     * @since 1.2
     */
	public static final String EMPTY_PREFIX = "";
	/**
     * This constant is used for HTTP protocol enforcement.
     * Designed to be used with the URL class.
     * @since 1.2
     */
	public static final String HTTP_PREFIX = "http://";
	/**
     * This constant is used for FTP protocol enforcement.
     * Designed to be used with the URL class.
     * @since 1.2
     */
	public static final String FTP_PREFIX = "ftp://";
	/**
     * This constant is used for FTP protocol port enforcement.
     * Designed to be used with the URL class.
     * @since 1.2
     */
	public static final String FTP_PORT = "21";
	/**
     * This constant is used for file directive enforcement.
     * Designed to be used with the File/FileInputStream class.
     * Using only a single slash enables using the prefix with
     * path that begin with or without a slash
     * (both file:/ and file:// are valid) 
     * @since 1.2
     */
	public static final String FILE_PREFIX = "file:/"; //remove / for linux
	
	
	//*************************
    //* FILE SUFFIX CONSTANTS *
    //*************************
	/**
     * This constant is used to store the default target filename. 
     * @since 1.2
     */
	public static final String DEFAULT_TARGET_FILE = "content.ini";
	/**
     * This constant is used to store the default target filename,
     * when the default location is not in the jsp directory. 
     * @since 1.2
     */
	public static final String DEFAULT_TARGET_FILE_NOT_LOCAL = "eclipse.ini";
	/**
     * This constant is used to store the default target filename. 
     * @since 1.2
     */
	public static final String DEFAULT_TARGET_FILE_INVALID = "none892j3kd.txt";
	/**
    * This constant is used to store the default invalid target destination for
    * Unvalidated Redirect vulnerabilities. 
    * @since 1.2
    */
	public static final String DEFAULT_TARGET_URL_INVALID_REDIRECT = "httk://google.com";
	/**
     * This constant is used to store an invalid file name,
     * @since 1.2
     */
	public static final String DEFAULT_TARGET_FILE_ROOT_DIR = "boot.ini";
	
    //********************************
    //* FILE SUFFIX/PREFIX CONSTANTS *
    //********************************
	/**
     * This constant is used to store the default target file extension. 
     * @since 1.2
     */
	public static final String DEFAULT_TARGET_FILE_EXTENSION = "ini";
	/**
     * This constant is used to store the default target file directory. 
     * @since 1.2
     */
	public static final String DEFAULT_TARGET_FILE_DIRECTORY = "files";
	//Filename only
	/**
     * This constant is used to store the default target file name (no extension). 
     * @since 1.2
     */
	public static final String DEFAULT_TARGET_FILE_NAME_ONLY = "content";
	/**
     * This constant is used to store the default target file name (no extension). 
     * @since 1.2
     */
	public static final String DEFAULT_TARGET_FILE_NAME_ONLY_NOT_LOCAL = "eclipse";
	/**
     * This constant is used to store the default target file name (no extension). 
     * @since 1.2
     */
	public static final String DEFAULT_TARGET_FILE_NAME_ONLY_ROOT_DIR = "boot";
	//Invalid
	/**
     * This constant is used to store an invalid target filename (only). 
     * @since 1.2
     */
	public static final String DEFAULT_TARGET_FILE_NAME_ONLY_INVALID = "none892j3kd";
	/**
     * This constant is used to store an invalid target extension (only). 
     * @since 1.2
     */
	public static final String DEFAULT_EXTENSION_INVALID = "blabla";
	/**
     * This constant is used to store an invalid target directory (only). 
     * @since 1.2
     */
	public static final String DEFAULT_DIRECTORY_INVALID = "fdkj3jds7";
	
	
	//****************
    //* CONSTRUCTORS *
    //****************
    /**
     * The default constructor is disabled to prevent the creation
     * of class instances.
     * @throws Exception  Default constructor not supported
     * @since 1.0
     */
    private FileConstants() throws Exception {
        throw new Exception("Default constructor not supported");
    } //end of constructor
} //end of class
