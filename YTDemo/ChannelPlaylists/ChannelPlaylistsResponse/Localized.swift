//
//	Localized.swift
//
//	Create by Waleed Ghalwash on 8/8/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//	The "Swift - Struct - Gloss" support has been made available by CodeEagle
//	More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation 
import Gloss

//MARK: - Localized
public struct Localized: Glossy {

	public let descriptionField : String!
	public let title : String!



	//MARK: Decodable
	public init?(json: JSON){
		descriptionField = "description" <~~ json
		title = "title" <~~ json
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
		"description" ~~> descriptionField,
		"title" ~~> title,
		])
	}

}