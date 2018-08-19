//
//	Snippet.swift
//
//	Create by Waleed Ghalwash on 9/8/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

//	The "Swift - Struct - Gloss" support has been made available by CodeEagle
//	More about him/her can be found at his/her website: https://github.com/CodeEagle

import Foundation 
import Gloss

//MARK: - Snippet
public struct Snippet: Glossy {

	public let channelId : String!
	public let channelTitle : String!
	public let descriptionField : String!
	public let playlistId : String?
	public let position : Int?
	public let publishedAt : String!
	public let resourceId : ResourceId?
    public let localized : Localized?
    public let thumbnails : Thumbnail!
	public let title : String!



	//MARK: Decodable
	public init?(json: JSON){
		channelId = "channelId" <~~ json
		channelTitle = "channelTitle" <~~ json
		descriptionField = "description" <~~ json
		playlistId = "playlistId" <~~ json
		position = "position" <~~ json
		publishedAt = "publishedAt" <~~ json
		resourceId = "resourceId" <~~ json
        localized = "localized" <~~ json
        thumbnails = "thumbnails" <~~ json
		title = "title" <~~ json
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
		"channelId" ~~> channelId,
		"channelTitle" ~~> channelTitle,
		"description" ~~> descriptionField,
        "localized" ~~> localized,
        "playlistId" ~~> playlistId,
		"position" ~~> position,
		"publishedAt" ~~> publishedAt,
		"resourceId" ~~> resourceId,
		"thumbnails" ~~> thumbnails,
		"title" ~~> title,
		])
	}

}
