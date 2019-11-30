//
//  TrackRow.swift
//  MusicApp
//
//  Created by Alfredo Luco on 04-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import SwiftUI

struct TrackRow: View {
    
    @State var item: TrackObject
    @ObservedObject var sound: TrackAudioStore
    @State var selection: Int? = nil
    
    var button: some View{
        Button(action: {
            self.sound.dispatch(url: self.item.previewUrl)
        }){
            Image("play").foregroundColor(Color(.white))
        }
    }
    
    var image: some View {
        TrackImage(url:item.artworkUrl100)
    }
    
    var body: some View {
      
         return withAnimation{
            Card{
                self.image
                VStack(alignment: .leading){
                    Text(self.item.artistName)
                        .bold()
                    Text(self.item.trackName)
                }
            }
         }.animation(Animation.easeInOut)
    }
}
