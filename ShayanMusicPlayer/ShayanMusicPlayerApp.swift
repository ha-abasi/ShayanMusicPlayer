//
//  ShayanMusicPlayerApp.swift
//  ShayanMusicPlayer
//
//  Created by Hamed Abasi on 10/28/1403 AP.
//

import SwiftUI
import SwiftData
@main
struct ShayanMusicPlayerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: MusicItem.self)
        }
    }
}
