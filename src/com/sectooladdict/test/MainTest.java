/**
 * 
 */
package com.sectooladdict.test;

import com.sectooladdict.encoders.HtmlEncoder;

/**
 * Test Class
 * @author Shay Chen
 * @since 1.0
 */
public final class MainTest {

    //****************
    //* CONSTRUCTORS *
    //****************
    /**
     * The default constructor is disabled to prevent the creation
     * of class instances.
     * @throws Exception  Default constructor not supported
     * @since 1.0
     */
    private MainTest() throws Exception {
        throw new Exception("Default constructor not supported");
    } //end of constructor


    //***********
    //* METHODS *
    //***********
    /**
     * @param args Command line arguments.
     * @since 1.0
     */
    public static void main(final String[] args) {
        String s = "<script>alert(\"xss\")</script>";
        String s2 = "<script>document.title=\"Exploit\";</script>";
        System.out.println(HtmlEncoder.htmlEncodeAngleBrackets(s));
        System.out.println(HtmlEncoder.htmlEncodeAngleBrackets(s2));

    } //end of method

} //end of class
