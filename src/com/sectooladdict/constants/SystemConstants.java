/**
 * 
 */
package com.sectooladdict.constants;

/**
 * This class contains constants used in a global application context.
 *
 * @author Shay Chen
 * @since 1.2
 */
public final class SystemConstants {
	
    //*******************
    //* MySQL CONSTANTS *
    //*******************
    /**
     * This constant is used as a global debug flag (development).
     * @since 1.2
     */
    public static final boolean DEBUG_FLAG_DEFAULT_STATE = true;
    
    //****************
    //* CONSTRUCTORS *
    //****************
    /**
     * The default constructor is disabled to prevent the creation
     * of class instances.
     * @throws Exception  Default constructor not supported
     * @since 1.0
     */
    private SystemConstants() throws Exception {
        throw new Exception("Default constructor not supported");
    } //end of constructor

} //end of class
