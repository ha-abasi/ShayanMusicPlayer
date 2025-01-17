//
//  MusicItem.swift
//  ShayanMusicPlayer
//
//  Created by Hamed Abasi on 10/28/1403 AP.
//

import Foundation
import SwiftData

@Model
class MusicItem{
    var title: String
    var url: String
    
    init(title: String, url: String) {
        self.title = title
        self.url = url
    }
}
