//
//	Default.swift
//
//	Create by Waleed Ghalwash on 8/8/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//	The "Swift - Struct - Gloss" support has been made available by CodeEagle
//	More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation 
import Gloss

//MARK: - Default
public struct Default: Glossy {

	public let height : Int!
	public let url : String!
	public let width : Int!



	//MARK: Decodable
	public init?(json: JSON){
		height = "height" <~~ json
		url = "url" <~~ json
		width = "width" <~~ json
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
		"height" ~~> height,
		"url" ~~> url,
		"width" ~~> width,
		])
	}

}
