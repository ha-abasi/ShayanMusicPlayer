//
//  MPlayer.swift
//  ShayanMusicPlayer
//
//  Created by Hamed Abasi on 10/28/1403 AP.
//

import Foundation
import AVFoundation

class MPlayer{
    var player : AVPlayer
    
    init(){
        player = AVPlayer()
    }
    func setUrl(urlAddress: String){
        player = AVPlayer(url: URL(string: urlAddress)!)
    }
    func pause(){
        player.pause()
    }
    func play(){
        player.play()
    }
    func stop(){
        player.pause()
        player.seek(to: .zero)
    }
}
