package com.sectooladdict.encoders;
/**
 * The HtmlEncoder class contains various methods to encode
 * output containing HTML, JS and VBS syntax.
 *
 * The class contains various non-secure methods that are
 * used for the purpose of testing web application scanners,
 * and therefore, most of the methods in this class are NOT
 * suitable for implementing efficient protection against
 * scripting attacks.
 *
 * @author Shay Chen
 * @since 1.0
 */
public final class HtmlEncoder {

    //****************
    //* CONSTRUCTORS *
    //****************
    /**
     * The default constructor is disabled (prevent the creation
     * of class instances).
     * @throws Exception  Default constructor unsupported
     * @since 1.0
     */
    private HtmlEncoder() throws Exception {
        throw new Exception("Default constructor unsupported");
    } //end of constructor


    //***********
    //* METHODS *
    //***********
    /**
     * This method encodes only angle brackets (<,>).
     * @param s Input string.
     * @return Partially encoded version of the string (HTML).
     * @since 1.0
     */
    public static String htmlEncodeAngleBrackets(final String s) {
        StringBuilder buf = new StringBuilder(s.length());
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '<') {
                buf.append("&lt;");
            } else if (c == '>') {
                buf.append("&gt;");
            } else {
                buf.append(c);
            }
        }
        return buf.toString();
    } //end of method


    /**
     * This method encodes only angle brackets (<,>) and single quotes (').
     * @param s Input string.
     * @return Partially encoded version of the string (HTML).
     * @since 1.0
     */
    public static String htmlEncodeAngleBracketsAndSingleQuotes(final String s) {
        StringBuilder buf = new StringBuilder(s.length());
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '<') {
                buf.append("&lt;");
            } else if (c == '>') {
                buf.append("&gt;");
            } else if (c == '\'') {
                buf.append("&#39;");
            } else if (c == '`') {
            	buf.append("&#96;");
            } else {
                buf.append(c);
            }
        }
        return buf.toString();
    } //end of method


    /**
     * This method encodes only angle brackets (<,>) and double quotes (").
     * @param s Input string.
     * @return Partially encoded version of the string (HTML).
     * @since 1.0
     */
    public static String htmlEncodeAngleBracketsAndDoubleQuotes(final String s) {
        StringBuilder buf = new StringBuilder(s.length());
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '<') {
                buf.append("&lt;");
            } else if (c == '>') {
                buf.append("&gt;");
            } else if (c == '"') {
                buf.append("&quot;");
            } else {
                buf.append(c);
            }
        }
        return buf.toString();
    } //end of method


    /**
     * This method encodes only angle brackets (<,>) and quotes (',",`).
     * @param s Input string.
     * @return Partially encoded version of the string (HTML).
     * @since 1.0
     */
    public static String htmlEncodeAngleBracketsAndQuotes(final String s) {
        StringBuilder buf = new StringBuilder(s.length());
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '<') {
                buf.append("&lt;");
            } else if (c == '>') {
                buf.append("&gt;");
            } else if (c == '"') {
                buf.append("&quot;");
            } else if (c == '\'') {
                buf.append("&#39;");
            } else if (c == '`') {
            	buf.append("&#96;");
            } else {
                buf.append(c);
            }
        }
        return buf.toString();
    } //end of method

    
    /**
     * This method encodes only double quotes (").
     * @param s Input string.
     * @return Partially encoded version of the string (HTML).
     * @since 1.0
     */
    public static String htmlEncodeDoubleQuotes(final String s) {
        StringBuilder buf = new StringBuilder(s.length());
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '"') {
                buf.append("&quot;");
            } else {
                buf.append(c);
            }
        }
        return buf.toString();
    } //end of method
    
    /**
     * This method encodes only single quotes (',`).
     * @param s Input string.
     * @return Partially encoded version of the string (HTML).
     * @since 1.0
     */
    public static String htmlEncodeSingleQuotes(final String s) {
        StringBuilder buf = new StringBuilder(s.length());
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '\'') {
            	buf.append("&#39;");
            } else if (c == '`') {
                buf.append("&#96;");
            } else {
                buf.append(c);
            }
        }
        return buf.toString();
    } //end of method
    
    /**
     * This method encodes only CrLf characters (10,13,\n,\r).
     * @param s Input string.
     * @return Partially encoded version of the string (HTML).
     * @since 1.0
     */
    public static String htmlEncodeCrLf(final String s) {
        StringBuilder buf = new StringBuilder(s.length());
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '\n') {
            	//add nothing
            } else if (c == '\r') {
            	//add nothing
            } else if (c == 10) {
            	//add nothing
            } else if (c == 13) {
            	//add nothing
            } else {
                buf.append(c);
            }
        }
        return buf.toString();
    } //end of method
    
    /**
     * This method encodes only the equality sign (=).
     * @param s Input string.
     * @return Partially encoded version of the string (HTML).
     * @since 1.0
     */
    public static String htmlEncodeEqualitySign(final String s) {
        StringBuilder buf = new StringBuilder(s.length());
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '=') {
                buf.append("&#61;");
            } else {
                buf.append(c);
            }
        }
        return buf.toString();
    } //end of method
  
    
    /**
     * This method encodes all the non alphanumeric characters.
     * @param s Input string.
     * @return Partially encoded version of the string (HTML).
     * @since 1.0
     */
    public static String htmlEncode(final String s) {
        StringBuilder buf = new StringBuilder(s.length());
        for (int i = 0; i < s.length(); i++) {
        	char c = s.charAt( i );
            if ( c>='a' && c<='z' || c>='A' && c<='Z' || c>='0' && c<='9' )
            {
                buf.append( c );
            }
            else
            {
                buf.append( "&#" + (int)c + ";" );
            }
        }
        return buf.toString();
        
    } //end of method
   
} //end of class
