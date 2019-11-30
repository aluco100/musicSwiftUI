//
//  TracksView.swift
//  MusicApp
//
//  Created by Alfredo Luco on 03-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import SwiftUI

struct TracksView: View {
    
    @ObservedObject var store = TrackStore()
    @ObservedObject var audioManager = AudioManager()
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(self.store.tracks, id: \.id){ item in
                    TrackRow(item: item, selectedItem: self.$audioManager.selectedItem, isLoading: self.audioManager.isLoading)
                }
            }.onAppear(perform: {
                self.store.dispatch()
            })
        }
    }
}
