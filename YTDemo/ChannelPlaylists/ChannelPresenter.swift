//
//  ChannelPresenter.swift
//  YTDemo
//
//  Created by apple on 8/8/18.
//  Copyright © 2018 Hesham. All rights reserved.
//

import Foundation

public protocol ChannelView: class{
    
    func showLoading() // show loader
    func hideLoading() // hide loader
    func showLoadError(message: String)  // show  error loading message
    func showLoginError(message: String) // show  login error message
    func showNoInternetConnectionError() // to show internet toast if there is no internet connection    func
    func showChannelData(response: ChannelResponse)
    func showVideosData(response: VideosResponse)
    
}

public class ChannelPresnter{
    
    fileprivate weak var channelView: ChannelView?
    fileprivate let channelGateway: channelGateway
    
    init(channelGateway: channelGateway){
        self.channelGateway = channelGateway
    }
    
    func setView(view: ChannelView){
        channelView = view
    }
}

extension ChannelPresnter {
    public func getChannelPlaylists(page: String){
        channelGateway.getChannelPlaylists(pageToken: page){ [weak self] (networkReply, statusCode, response) in
            print(statusCode)
            switch(networkReply) {
            case .success:
                switch statusCode {
                case 200:
                    self?.channelView?.hideLoading()
                    self?.channelView?.showChannelData(response: response!)
                    
                default:
                    self?.channelView?.hideLoading()
                    self?.channelView?.showLoginError(message: "Something went wrong, Please try again")
                    break
                }
            case .failure:
                self?.channelView?.hideLoading()
                self?.channelView?.showLoadError(message: "Something went wrong, Please try again")
                break
            }
        }
    }
    
    public func getVideos(playlistID: String, page: String){
        channelGateway.getVideos(playlistID: playlistID, pageToken: page){ [weak self] (networkReply, statusCode, response) in
            print(statusCode)
            switch(networkReply) {
            case .success:
                switch statusCode {
                case 200:
                    self?.channelView?.hideLoading()
                    self?.channelView?.showVideosData(response: response!)
                    
                default:
                    self?.channelView?.hideLoading()
                    self?.channelView?.showLoginError(message: "Something went wrong, Please try again")
                    break
                }
            case .failure:
                self?.channelView?.hideLoading()
                self?.channelView?.showLoadError(message: "Something went wrong, Please try again")
                break
            }
        }
    }
}
