/**
 * 
 */
package com.sectooladdict.enums;

/**
 * This enum defines different types of responses.
 *
 * @author Shay Chen
 * @since 1.2
 */
public enum ResponseType {
	ERROR_500, //Server error response
	ERROR_404, //File not found response
	REDIRECT_302, //Redirect response
	ERROR_200, //Error embedded into a valid response
	VALID_200, //A valid response without erroneous information
	IDENTICAL_200; //A valid response without any response differentiation
}
