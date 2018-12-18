//
//  PlaylistsService.swift
//  YTDemo
//
//  Created by apple on 8/8/18.
//  Copyright © 2018 Yasmine. All rights reserved.
//

import Foundation
import Moya

var apiKey = "AIzaSyBQktbpmZvc7lkJJczudOAH1_VHDU7mKR0"
var userName = "KiaMotorsEG"
var channelID = "UCV2KtJXzKKkqEGxH8BxQXOw"
//var playlistID = "UUV2KtJXzKKkqEGxH8BxQXOw"
//var playlistID = "PLGURpC1mgojnyDpZxuJspjUBgkeR5umTF"

enum ChannelService{
    case getChannelPlaylists(pageToken: String)
    case getPlaylistVideos(playlistID: String, pageToken: String)
}

extension ChannelService : TargetType{
    
    var baseURL: URL {
        return URL(string: "https://www.googleapis.com/youtube/v3/")!
    }
    
    var path: String {
        switch self{
        case .getChannelPlaylists(_):
           return "playlists"
            
        case .getPlaylistVideos(_,_):
            return "playlistItems"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String: Any]? {
        switch self{
        case .getChannelPlaylists(let pageToken):
            return ["part": "snippet", "channelId": channelID, "key": apiKey, "pageToken": pageToken]
        case .getPlaylistVideos(let playlistID, let pageToken):
            return ["part": "snippet", "playlistId": playlistID, "key": apiKey, "pageToken": pageToken]
        }
        
    }
    
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
    var task: Task {
     //   return .requestPlain
        return .requestParameters(parameters: self.parameters!, encoding: self.parameterEncoding)
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/json"]
    }
    
    public var validate: Bool {
        return false
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
}
