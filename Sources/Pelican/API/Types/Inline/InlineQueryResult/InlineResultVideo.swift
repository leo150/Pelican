//
//  InlineResultVideo.swift
//  Pelican
//
//  Created by Takanu Kyriako on 20/12/2017.
//

import Foundation


/**
Represents either a link to a video file that's stored on the Telegram servers, or an external URL link to one.  Can also be a link to a page containing an embedded video player.

By default, this video will be sent by the user with an optional caption. Alternatively, you can use the `content` property to send a message with the specified content instead of the file.

- note: If an InlineQueryResultVideo message contains an embedded video (e.g., YouTube), you must replace its content using the `content` property.
*/
public struct InlineResultVideo: InlineResult {
	
	/// A metatype, used to Encode and Decode itself as part of the InlineResult protocol.
	public var metatype: InlineResultType = .video
	
	/// Type of the result being given.
	public var type: String = "video"
	
	/// Unique Identifier for the result, 1-64 bytes.
	public var id: String
	
	/// Content of the message to be sent.
	public var content: InputMessageContent?
	
	/// Inline keyboard attached to the message
	public var markup: MarkupInline?
	
	
	
	/// A valid URL for the embedded video player or video file.
	public var url: String?
	
	/// A valid file identifier for the video file.
	public var fileID: String?
	
	/// The title of the inline result.
	public var title: String?
	
	/// A short description of the inline result.
	public var description: String?
	
	/// A caption for the photo to be sent, 200 characters maximum.
	public var caption: String?
	
	/// Video width.
	public var width: Int?
	
	/// Video height.
	public var height: Int?
	
	/// Video duration.
	public var duration: Int?
	
	/// Mime type of the content of the file, either “text/html" or "video/mp4".
	var mimeType: String
	
	/// URL of the thumbbail for the result.
	var thumbURL: String?
	
	/// Coding keys to map values when Encoding and Decoding.
	enum CodingKeys: String, CodingKey {
		case type
		case id
		case content = "input_message_content"
		case markup = "reply_markup"
		
		case url = "video_url"
		case fileID = "video_file_id"
		case title
		case description
		case caption
		
		case width = "video_width"
		case height = "video_height"
		case duration = "video_duration"
		case mimeType = "mime_type"
		case thumbURL = "thumb_url"
	}
	
	
}
