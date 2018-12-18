//
//  ViewController.swift
//  YTDemo
//
//  Created by apple on 8/8/18.
//  Copyright © 2018 Yasmine. All rights reserved.
//

import UIKit
import Localize_Swift
import YouTubePlayer_Swift

class ChannelVC: UIViewController {
    var channelPresenter: ChannelPresnter!
    var channelGateway: ChannelGateway!
    var channel: ChannelResponse!
    var playlists: [Item] = []
    var playlistID: String = ""
    var videos: [Item] = []
    var totalItemsCount = 0
    var nextPageID = ""
    
    //Video view
    @IBOutlet var videoPlayer: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize Gateway
        channelGateway = ChannelGateway()
        channelPresenter = ChannelPresnter(channelGateway: channelGateway)
        channelPresenter.setView(view: self)
        //initialize Data
        self.videoPlayer.delegate = self
        channelPresenter.getChannelPlaylists(page: "")
        print(playlistID)
        
    }


}

extension ChannelVC: YouTubePlayerDelegate{
    
    func playerStateChanged(_ videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        if playerState == .Ended{
            videoPlayer.stop()
            print("*************videoEnded**************")            
        }
        
    }
    
    func playerQualityChanged(_ videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {
    }
    
    func playerReady(_ videoPlayer: YouTubePlayerView) {
        self.videoPlayer.play()
    }
    
}

extension ChannelVC: ChannelView{
    func showVideosData(response: VideosResponse) {
        let responseItems : [Item] = response.items
        videos.append(contentsOf: responseItems)
        totalItemsCount = response.pageInfo.totalResults
        
        if let page = response.nextPageToken{
           nextPageID = page
            channelPresenter.getVideos(playlistID: playlistID, page: nextPageID)
        }
        else{
            
            for item in videos{
            print(item.snippet.title)
            }
        let videoID : String? = videos[0].snippet.resourceId?.videoId
        videoPlayer.loadVideoID(videoID!)
        //videoPlayer.play()
        //self.playerReady(videoPlayer)
        }
    }
    
    func showLoading() {
    }
    
    func hideLoading() {
    }
    
    func showLoadError(message: String) {
    }
    
    func showLoginError(message: String) {
    }
    
    func showNoInternetConnectionError() {
    }
    
    func showChannelData(response: ChannelResponse){
        
        let responseItems : [Item] = response.items
        playlists.append(contentsOf: responseItems)
        totalItemsCount = response.pageInfo.totalResults
        print(response.nextPageToken)
        if let page = response.nextPageToken{
            nextPageID = page
            print(page)
            channelPresenter.getChannelPlaylists(page: nextPageID)
        }
        else{
            for item in playlists{
                print(item.snippet.title)
                print(item.id)
            }
            playlistID = playlists[0].id
            channelPresenter.getVideos(playlistID: playlistID, page:
                "")
            
        }
    }
    
    
}
