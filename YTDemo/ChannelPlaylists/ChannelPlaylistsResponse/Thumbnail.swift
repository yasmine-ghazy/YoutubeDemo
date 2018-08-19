//
//	Thumbnail.swift
//
//	Create by Waleed Ghalwash on 9/8/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//	The "Swift - Struct - Gloss" support has been made available by CodeEagle
//	More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation 
import Gloss

//MARK: - Thumbnail
public struct Thumbnail: Glossy {

	public let defaultField : Default!
	public let high : Default!
	public let maxres : Default!
	public let medium : Default!
	public let standard : Default!



	//MARK: Decodable
	public init?(json: JSON){
		defaultField = "default" <~~ json
		high = "high" <~~ json
		maxres = "maxres" <~~ json
		medium = "medium" <~~ json
		standard = "standard" <~~ json
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
		"default" ~~> defaultField,
		"high" ~~> high,
		"maxres" ~~> maxres,
		"medium" ~~> medium,
		"standard" ~~> standard,
		])
	}

}