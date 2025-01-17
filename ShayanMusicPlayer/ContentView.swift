//
//  ContentView.swift
//  ShayanMusicPlayer
//
//  Created by Hamed Abasi on 10/28/1403 AP.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext)
    var modelContext : ModelContext
    
    @Query
    var musics : [MusicItem]
    @State
    var selected : MusicItem?
    
    @State
    var isPlaying : Bool = false
    
    var player = MPlayer()
    
    
    
    
    var body: some View {
        NavigationStack {
            List(musics, id:\.self, selection: $selected){ music in
                Text(music.title).swipeActions {
                    Button("Delete", role: .destructive){
                        modelContext.delete(music)
                    }
                }
            }
            .onChange(of: selected){ (old, new) in
                
            }
            VStack{
                Text("\(String(describing: selected?.title ?? "-"))").font(.footnote)
            }
            .toolbar{
                ToolbarItem(placement: .bottomBar){
                    Button{
                        isPlaying.toggle()
                    }label: {
                        Image(systemName: isPlaying ? "pause" : "play")
                    }
                }
            }
        }
        .overlay{
            if(musics.isEmpty){
                Text("No Music Found")
            }
        }
    }
}

#Preview("Sample List") {
    var config = ModelConfiguration()
    var modelContainer = try! ModelContainer(for:MusicItem.self, configurations: config)
    
    modelContainer.mainContext.insert(MusicItem(title: "Siavash Ghomayshi - Tavahom", url: "https://dl.mehrdl.top/Music/A/Q/New/Siavash%20Ghomayshi%20-%20Tavahom%20(320).mp3"))
    
    modelContainer.mainContext.insert(MusicItem(title: "Siavash Ghomayshi - Parandeye Mohajer", url: "https://dl.mehrdl.top/Music/A/B/New/Siavash%20Ghomayshi%20-%20Parandeye%20Mohajer.mp3"))
    
    return ContentView()
        .modelContainer(modelContainer)
}

#Preview("Empty List") {
    ContentView()
}
