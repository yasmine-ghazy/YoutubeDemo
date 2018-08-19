//
//	RootClass.swift
//
//	Create by Waleed Ghalwash on 8/8/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//	The "Swift - Struct - Gloss" support has been made available by CodeEagle
//	More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation 
import Gloss

//MARK: - RootClass
public struct ChannelResponse: Glossy {

	public let etag : String!
	public let items : [Item]!
	public let kind : String!
	public let nextPageToken : String!
	public let pageInfo : PageInfo!



	//MARK: Decodable
	public init?(json: JSON){
		etag = "etag" <~~ json
		items = "items" <~~ json
		kind = "kind" <~~ json
		nextPageToken = "nextPageToken" <~~ json
		pageInfo = "pageInfo" <~~ json
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
		"etag" ~~> etag,
		"items" ~~> items,
		"kind" ~~> kind,
		"nextPageToken" ~~> nextPageToken,
		"pageInfo" ~~> pageInfo,
		])
	}

}
