/**
 * 
 */
package com.sectooladdict.validators;

/**
 * The InputValidator class contains various methods for validating
 * input containing malicious characters.
 *
 * The class contains various non-secure methods that are
 * used for the purpose of testing web application scanners,
 * and therefore, most of the methods in this class are NOT
 * suitable for implementing efficient protection against
 * injection / scripting attacks.
 *
 * @author Shay Chen
 * @since 1.0
 */
public final class InputValidator {

    //****************
    //* CONSTRUCTORS *
    //****************
    /**
     * The default constructor is disabled (prevent the creation
     * of class instances).
     * @throws Exception  Default constructor not supported
     * @since 1.0
     */
    private InputValidator() throws Exception {
        throw new Exception("Default constructor not supported");
    } //end of constructor


    //***********
    //* METHODS *
    //***********
    /**
     * This method attempts to verify that the input does not
     * contain a semicolon character (;).
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.0
     */
    public static boolean validateSemicolon(final String s) {
        if (s.contains(";")) {
            return true;
        } else {
            return false;
        }
    } //end of method

    
    /**
     * This method attempts to verify that the input does not
     * contain quotes (',",`).
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.0
     */
    public static boolean validateQuotes(final String s) {
        if (s.contains("'") || s.contains("\"") || s.contains("`")) {
            return true;
        } else {
            return false;
        }
    } //end of method
    
    
    /**
     * This method attempts to verify that the input does not
     * contain characters that can compose SQL comments (--,#,/*).
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.0
     */
    public static boolean validatePotentialComments(final String s) {
        if (s.contains("-") || s.contains("#") || s.contains("/")
        		|| s.contains("*")) {
            return true;
        } else {
            return false;
        }
    } //end of method
    
    
    /**
     * This method attempts to verify that the input does not
     * contain quotes, comments and semicolons (',",`,--,#,/*,;).
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.0
     */
    public static boolean validateAll(final String s) {
        if (validateQuotes(s) || 
        	  validatePotentialComments(s) ||
        	  validateSemicolon(s)) {
            return true;
        } else {
            return false;
        }
    } //end of method
    
    
    /**
     * This method attempts to verify that the input does not
     * contain Unix directory traversal characters (../).
     * Windows traversal characters were left out on purpose. 
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.2
     */
    public static boolean validateUnixTraversal(final String s) {
    	if (s.contains("../")) {
            return true;
        } else {
            return false;
        }
    } //end of method
    
    
    /**
     * This method attempts to remove instances of 
     * Unix directory traversal characters (/../,../) from the input.
     * Windows traversal characters were left out on purpose. 
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.2
     */
    public static String removeUnixTraversal(final String s) {
    	//intentionally ignore parsing flaw exploits
    	String temp = null;
    	temp = s.replace("/../", "");
    	temp = temp.replace("../", "");
    	return temp;
    } //end of method
    
    
    /**
     * This method attempts to verify that the input does not
     * contain Windows directory traversal characters (..\).
     * Unix traversal characters were left out on purpose. 
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.2
     */
    public static boolean validateWindowsTraversal(final String s) {
    	if (s.contains("..\\")) {
            return true;
        } else {
            return false;
        }
    } //end of method
    
    
    /**
     * This method attempts to remove instances of 
     * Windows directory traversal characters (/../,../) from the input.
     * Unix traversal characters were left out on purpose. 
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.2
     */
    public static String removeWindowsTraversal(final String s) {
    	//intentionally ignore parsing flaw exploits
    	String temp = null;
    	temp = s.replace("\\..\\", "");
    	temp = temp.replace("..\\", "");
    	return temp;
    } //end of method
    
    
    /**
     * This method attempts to verify that the input does not
     * contain slash characters (/).
     * backslash characters were left out on purpose. 
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.0
     */
    public static boolean validateSlash(final String s) {
    	if (s.contains("/")) {
            return true;
        } else {
            return false;
        }
    } //end of method
    
    
    /**
     * This method attempts to remove instances of 
     * slash characters (/) from the input.
     * backslash characters were left out on purpose. 
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.2
     */
    public static String removeSlash(final String s) {
    	//intentionally ignore parsing flaw exploits
    	return s.replace("/", "");
    } //end of method
    
    
    /**
     * This method attempts to verify that the input does not
     * contain backslash characters (\).
     * slash characters were left out on purpose. 
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.0
     */
    public static boolean validateBackSlash(final String s) {
    	if (s.contains("\\")) {
            return true;
        } else {
            return false;
        }
    } //end of method
    
    
    /**
     * This method attempts to remove instances of 
     * backslash characters (\) from the input.
     * slash characters were left out on purpose. 
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.2
     */
    public static String removeBackSlash(final String s) {
    	//intentionally ignore parsing flaw exploits
    	return s.replace("\\", "");
    } //end of method
    
    
    /**
     * This method attempts to verify that the input does not
     * contain HTTP references.
     * The inefficient validation is intentional
     * (the input is not transformed to lower-case prior to validation,
     *  and there's no https/other protocol or evasion prevention)
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.0
     */
    public static boolean validateHttp(final String s) {
    	//String tmp = s.toLowerCase();
    	//intentionally ignore upper/lower case issues, so evasion can be used
    	if (s.contains("http:/")  ) {
            return true;
        } else {
            return false;
        }
    } //end of method
    
    
    /**
     * This method attempts to remove instances of 
     * HTTP references from the input.
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.2
     */
    public static String removeHttp(final String s) {
    	//intentionally ignore upper/lower case issues, so evasion can be used
    	return s.replace("http://", "");
    } //end of method
    
    
    /**
     * This method attempts to remove instances of 
     * Unix local directory traversal characters (/./,./) from the input.
     * Windows traversal characters were left out on purpose. 
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.2
     */
    public static String removeUnixLocalTraversal(final String s) {
    	//intentionally ignore parsing flaw exploits
    	String temp = null;
    	temp = s.replace("/./", "");
    	temp = temp.replace("./", "");
    	return temp;
    } //end of method
    
    
    /**
     * This method attempts to remove instances of 
     * Windows local directory traversal characters (\.\,.\) from the input.
     * Windows traversal characters were left out on purpose. 
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.2
     */
    public static String removeWindowsLocalTraversal(final String s) {
    	//intentionally ignore parsing flaw exploits
    	String temp = null;
    	temp = s.replace("\\.\\", "");
    	temp = temp.replace(".\\", "");
    	return temp;
    } //end of method

    /**
     * This method attempts to remove various delimiters and tags from the input.
     * @param s Input string.
     * @return True to signify invalid input, or False for valid.
     * @since 1.2
     */
    public static String removeDelimitersAndTags(final String s) {
    	//intentionally ignore parsing flaw exploits
    	String temp = null;
    	temp = s.replace(";", "");
    	temp = temp.replace("\n", "");
    	temp = temp.replace("\r", "");
    	temp = temp.replace("\t", "");
    	temp = temp.replace("\\", "");
    	temp = temp.replace("\"", "");
    	temp = temp.replace("\'", "");
    	temp = temp.replace("*", "");
    	temp = temp.replace("<", "");
    	temp = temp.replace(">", "");
    	temp = temp.replace("(", "");
    	temp = temp.replace(")", "");
    	temp = temp.replace("]", "");
    	temp = temp.replace("[", "");
    	return temp;
    } //end of method
    
} //end of class