//
//	Item.swift
//
//	Create by Waleed Ghalwash on 8/8/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//	The "Swift - Struct - Gloss" support has been made available by CodeEagle
//	More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation 
import Gloss

//MARK: - Item
public struct Item: Glossy {

	public let etag : String!
	public let id : String!
	public let kind : String!
	public let snippet : Snippet!



	//MARK: Decodable
	public init?(json: JSON){
		etag = "etag" <~~ json
		id = "id" <~~ json
		kind = "kind" <~~ json
		snippet = "snippet" <~~ json
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
		"etag" ~~> etag,
		"id" ~~> id,
		"kind" ~~> kind,
		"snippet" ~~> snippet,
		])
	}

}