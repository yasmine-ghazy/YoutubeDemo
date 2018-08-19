//
//  VideoVC.swift
//  YTDemo
//
//  Created by apple on 8/12/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import UIKit
import YoutubeKit

class VideoVC: UIViewController {
    
    private var player: YTSwiftyPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = YTSwiftyPlayer(
            frame: CGRect(x: 0, y: 0, width: 640, height: 480),
            playerVars: [.videoID("zUV9NSvQyGM")])
        
        // Enable auto playback when video is loaded
        player.autoplay = true
        
        // Set player view.
        view = player
        
        // Set delegate for detect callback information from the player.
        //player.delegate = self
        
        // Load the video.
        player.loadPlayer()
        
    }

}

extension VideoVC: YTSwiftyPlayerDelegate{
    func playerReady(_ player: YTSwiftyPlayer){
        
    }
    func player(_ player: YTSwiftyPlayer, didUpdateCurrentTime currentTime: Double){
        
    }
    func player(_ player: YTSwiftyPlayer, didChangeState state: YTSwiftyPlayerState){
        if state == .ended{
            player.stopVideo()
            player.clearVideo()
        }
    }
    func player(_ player: YTSwiftyPlayer, didChangePlaybackRate playbackRate: Double){
        
    }
    func player(_ player: YTSwiftyPlayer, didReceiveError error: YTSwiftyPlayerError){
        
    }
    func player(_ player: YTSwiftyPlayer, didChangeQuality quality: YTSwiftyVideoQuality){
        
    }
    func apiDidChange(_ player: YTSwiftyPlayer){
        
    }
    func youtubeIframeAPIReady(_ player: YTSwiftyPlayer){
        
    }
    func youtubeIframeAPIFailedToLoad(_ player: YTSwiftyPlayer){
        
    }
}
