//
//  TrackRow.swift
//  MusicApp
//
//  Created by Alfredo Luco on 04-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import SwiftUI

struct TrackRow: View {
    
    var item: TrackObject
    @Binding var selectedItem : TrackObject?
    
    var isLoading = false
    
    var isPlaying :  Bool {
         selectedItem?.id == item.id
    }
    
    var image: some View {
        TrackImage(url:item.artworkUrl100)
    }
    
    var content: some View {
        VStack(alignment: .leading){
            Text(self.item.artistName)
                .bold()
            Text(self.item.trackName)
        }
    }
    
    var body: some View {
      
         return withAnimation{
            Card{
                self.image
                self.content
            }
         }.animation(Animation.easeInOut)
    }
}
