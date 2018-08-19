//
//  ChannelGateway.swift
//  YTDemo
//
//  Created by apple on 8/8/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Foundation
import Moya
import Moya_Gloss

public enum NetworkReply {
    case success
    case failure
}

public typealias GetChannelHandler = (NetworkReply, Int, ChannelResponse?)-> Void
public typealias GetVideosHandler = (NetworkReply, Int, VideosResponse?)-> Void

protocol channelGateway: class {
    func getChannelPlaylists(pageToken: String, completion: @escaping GetChannelHandler)
    func getVideos(playlistID: String, pageToken: String, completion: @escaping GetVideosHandler)
}

public class ChannelGateway: channelGateway {
    
    private var provider: MoyaProvider<ChannelService>
    
    init(){
        let endpointClosure = { (target: ChannelService) -> Endpoint<ChannelService>
        in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target).adding(newHTTPHeaderFields: ["Content-Type":"application/json"])
            return defaultEndpoint
        }
        provider = MoyaProvider<ChannelService>(endpointClosure: endpointClosure)
    }
    
    func getChannelPlaylists(pageToken: String, completion: @escaping GetChannelHandler){
        provider.request(.getChannelPlaylists(pageToken: pageToken)) { (result) in
            
            switch result {
            case .success(let response):
                do {
                    //print("status code \(result.value?.statusCode)")
                    print(response.data)

                    let apiResponse = try response.mapObject(ChannelResponse.self)
                    if response.statusCode == 200 {
                        completion(.success, response.statusCode, apiResponse)
                    } else{
                        completion(.failure, response.statusCode , nil)
                    }
                } catch {
                    completion(.failure , 400, nil)
                }
            case .failure( _):
                
                completion(.failure , 404, nil)
            }
        }
    }
    
    func getVideos(playlistID: String, pageToken: String, completion: @escaping GetVideosHandler) {
        
        provider.request(.getPlaylistVideos(playlistID: playlistID, pageToken: pageToken)) { (result) in
        switch result {
        case .success(let response):
            do {
                print(response.data)
                
                let apiResponse = try response.mapObject(VideosResponse.self)
                if response.statusCode == 200 {
                    completion(.success, response.statusCode, apiResponse)
                } else{
                    completion(.failure, response.statusCode , nil)
                }
            } catch {
                completion(.failure , 400, nil)
            }
        case .failure( _):
            
            completion(.failure , 404, nil)
        }
    }
}
    
}
