package com.sectooladdict.constants;

/**
 * This class contains constants used for content related activities.
 *
 * @author Shay Chen
 * @since 1.2
 */
public class ContentConstants {
    //**************************
    //* CONTENT TYPE CONSTANTS *
    //**************************
	/**
     * This constant contains a text/html content type string.
     * @since 1.2
     */
	public static final String CONTENT_TYPE_TEXT_HTML = "text/html";
	/**
     * This constant contains an octet stram content type string (download).
     * @since 1.2
     */
	public static final String CONTENT_TYPE_STREAM = "application/octet-stream";
	
	//****************
    //* CONSTRUCTORS *
    //****************
    /**
     * The default constructor is disabled to prevent the creation
     * of class instances.
     * @throws Exception  Default constructor not supported
     * @since 1.0
     */
    private ContentConstants() throws Exception {
        throw new Exception("Default constructor not supported");
    } //end of constructor
} //end of class
