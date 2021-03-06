
import Foundation
import Dispatch     // Required on Linux platforms.


/**
The king-daddy of Pelican, Sessions encapsulates communication between you and a type of
interaction point on Telegram such as a chat or user.

The protocol is a shell that defines the minimum amount of content required in order to function.
Extend it's functionality by adding modules to your own custom sessions.  Alternatively, use
`ChatSession` and `UserSession` which cover most common bot use cases.
*/
public protocol Session {
	
	// CORE DATA
	/** The "tag" of a session, holding key identifying details that allow it to be identified by
	Pelican, and is also passed to delegates for both identification and callback events. */
	var tag: SessionTag { get }
	
	
	// DISPATCH QUEUE
	/**  The queue that Pelican will use to asynchronously dispatch update handling to, if the update should be handled by this session.
	The queue is serialised which means that updates given to a specific session will be processed in a First In, First Out (FIFO)
	order, but that update handling across different Sessions can be processed at the same time.
	
	If your code enables more than one session to modify properties on any given session, ensure that those properties are thread-safe. */
	var dispatchQueue: SessionDispatchQueue { get }
	
	
	// DELEGATES AND CONTROLLERS
	/** The initial route that all updates to this session will be sent to.  Routes are used to
	handle and match user requests to available bot functions based on defined patterns and behaviours. */
	var baseRoute: Route { get }
	
	
	// TIME AND ACTIVITY
	/// The time the session was first created.
	var timeStarted: Date { get }
	
	
	/**
	A standard initialiser for a Session, which includes all the required information to setup any delegates it might have.
	*/
	init?(bot: PelicanBot, tag: SessionTag)
	
	/**
	Performs any post-initialiser setup, like setting initial routes.
	*/
	func postInit()
	
	/**
	TEMP NAME, PLEASE CHANGE ME.
	Performs any functions required to prepare the Session for removal from the Builder, which can occur when a Session or one
	of it's delegates requests Pelican to remove it.  This function should never send the closure event itself, use this
	to clean up any custom types before the Session is removed.
	*/
	func cleanup()
	
	/**
	Receives updates from Pelican to be used to find matching Routes and Prompts (in ChatSessions only).  Returns MethodRequest which
	Pelican uses to make requests to Telegram with.
	*/
	func update(_ update: Update)
	
}

extension Session {
	
	/** Closes the session, deinitialising all modules and removing itself from the associated SessionBuilder. */
	public func close() {
		self.tag.sendEvent(type: .other, action: .remove)
	}
	
	// Receives a message from the TelegramBot to check whether in the current state anything can be done with it
	public func update(_ update: Update) {
		
		// This needs revising, whatever...
		_ = baseRoute.handle(update)
		
	}
	
	/**
	The equatable implementation for Session only uses the tag, as it is designed to be completely unique between
	any two sessions.
	*/
	public static func ==(lhs: Self, rhs: Self) -> Bool {
		if lhs.tag == rhs.tag { return true }
		
		return false
	}
}





