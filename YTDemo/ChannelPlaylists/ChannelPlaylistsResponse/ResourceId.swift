//
//	ResourceId.swift
//
//	Create by Waleed Ghalwash on 9/8/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//	The "Swift - Struct - Gloss" support has been made available by CodeEagle
//	More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation 
import Gloss

//MARK: - ResourceId
public struct ResourceId: Glossy {

	public let kind : String!
	public let videoId : String!



	//MARK: Decodable
	public init?(json: JSON){
		kind = "kind" <~~ json
		videoId = "videoId" <~~ json
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
		"kind" ~~> kind,
		"videoId" ~~> videoId,
		])
	}

}