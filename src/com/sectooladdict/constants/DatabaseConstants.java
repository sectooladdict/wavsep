/**
 * 
 */
package com.sectooladdict.constants;

/**
 * This class contains constants used for database
 * related activities.
 *
 * The class contains various non-secure fields that are
 * used for the purpose of testing web application scanners,
 * and therefore, most of the fields in this class are NOT
 * suitable for implementing applications.
 *
 * @author Shay Chen
 * @since 1.0
 */
public final class DatabaseConstants {
	
    //*******************
    //* MySQL CONSTANTS *
    //*******************
    /**
     * This constant is used as the global database driver string.
     * @since 1.0
     */
    public static final String DATABASE_DRIVER =
        "com.mysql.jdbc.Driver";
    /**
     * This constant is used as the global wavsep database name string.
     * @since 1.0
     */
    public static final String DATABASE_NAME =
    	"wavsepDB";
    /**
     * This constant is used as the global database connection string (dynamic).
     * @since 1.0.2
     */
    public static String CONNECTION_STRING_WITHOUT_CREDENTIALS =
        "jdbc:mysql://localhost:3306/wavsepDB";
    /**
     * This constant is used to store the database account user name (dynamic).
     * @since 1.0.2
     */
    public static String USERNAME = "wavsep";
    //original: wavsep, not final
    /**
     * This constant is used to store the database account password (dynamic).
     * @since 1.0.2
     */
    public static String PASSWORD = "wavsepPass782";
    //original: wavsepPass782, not final
    /**
     * This constant is used to store the connection pool name.
     * @since 1.0.2
     */
    public static final String CONNECTION_POOL_NAME = "WavsepConnectionPool";
    //*******************
    //* DERBY CONSTANTS *
    //*******************
    /**
     * This constant is used to store the derby database name.
     * @since 1.1.0
     */
    public static final String DERBY_DATABASE_NAME = "db/WavsepConfigDB";
    /**
     * This constant is used to store the derby database connection string.
     * @since 1.1.0
     */
	public static final String DERBY_CONNECTION_STRING = 
		"jdbc:derby:" + DERBY_DATABASE_NAME + ";";
	/**
     * This constant is used to store the derby database driver string.
     * @since 1.1.0
     */
	public static final String DERBY_DATABASE_DRIVER = 
		"org.apache.derby.jdbc.EmbeddedDriver";
	/**
     * This constant is used to store the configuration row identifier.
     * @since 1.1.0
     */
	public static final int DERBY_DATABASE_CONFIGURATION_ID = 2;

    //****************
    //* CONSTRUCTORS *
    //****************
    /**
     * The default constructor is disabled to prevent the creation
     * of class instances.
     * @throws Exception  Default constructor not supported
     * @since 1.0
     */
    private DatabaseConstants() throws Exception {
        throw new Exception("Default constructor not supported");
    } //end of constructor

} //end of class
