//
//  MethodRequest+Payments.swift
//  Pelican
//
//  Created by Takanu Kyriako on 18/12/2017.
//

import Foundation

extension MethodRequestSync {

	/**
	Use this method to send invoices.
	- parameter prices: An array of costs involved in the transaction (eg. product price, taxes, discounts).
	*/
	public func sendInvoice(title: String,
													description: String,
													payload: String,
													providerToken: String,
													startParameter: String,
													currency: String,
													prices: [String: Int],
													chatID: String) {
		
	}
	
	/**
	If you sent an invoice requesting a shipping address and the parameter is_flexible was specified, the Bot API will send an Update with a shipping_query field to the bot.
	Use this method to reply to shipping queries. On success, True is returned.
	*/
	public func answerShippingQuery(shippingQueryID: String,
																	acceptShippingAddress: Bool,
																	shippingOptionsFIXME: [String]?,
																	errorMessage: String?) {
			
		
			
	}
	
	/**
	Once the user has confirmed their payment and shipping details, the Bot API sends the final confirmation in the form of an Update with the field pre_checkout_query. Use this method to respond to such pre-checkout queries. On success, True is returned.
	
	- note: The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent.
	*/
	public func answerPreCheckoutQuery(preCheckoutQueryID: String,
																		 acceptPaymentQuery: Bool,
																		 errorMessage: String?) {
		
	}
	
}
