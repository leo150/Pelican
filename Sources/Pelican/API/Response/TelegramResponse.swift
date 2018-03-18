//
//  TelegramResponse.swift
//  PelicanTests
//
//  Created by Takanu Kyriako on 11/07/2017.
//
//

import Foundation
import SwiftyJSON

/**
Represents a response from Telegram servers once a request has been made.
*/
public class TelegramResponse {

	// HTTP CORE
	/// The HTTP Version.
	public var version: Version
	
	/// The status of the request.
	public var status: Status
	
	/// HTTP response headers.
	public var headers: [String: String]

	/// The date the response was received.
	var date = Date()
	
	
	// TELEGRAM INFO
	/// If true, the request was a success.
	var success: Bool
	
	/// The Telegram code sent back.
	var responseCode: String?
	
	/// The error description, if the request was unsuccessful.
	var responseStatus: String?
	
	/// The result of the request, if successful.
	public var result: JSON?
	

	/**
	Converts a response received from a Telegram Request to a response type.
	- parameter response: The Vapor.Response type returned from a Telegram API request.  Failing
	to provide the correct response will result in a runtime error.
	*/
	init(data: Data, urlResponse: HTTPURLResponse) throws	{
		
		//self.version = urlResponse.something
		self.status = Status(statusCode: urlResponse.statusCode)
		urlResponse.allHeaderFields.forEach { tuple in
			self.headers["\(tuple.key)"] = "\(tuple.value)"
		}
		
		var json = try JSON(data: data)
		
		self.success = json["ok"].bool ?? false
		self.responseCode = json["status"].string
		self.responseStatus = json["error_code"].string
		self.result = json["result"]
		
	}
}
