//
//  TracksView.swift
//  MusicApp
//
//  Created by Alfredo Luco on 03-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import SwiftUI

struct TracksView: View {
    
    @ObservedObject var store: TrackStore
    
    var body: some View {
        return
            NavigationView{
                List{
                    ForEach(self.store.state, id: \.id){
                        item in
                        TrackRow(item: item, image: TrackImageStore(), sound: TrackAudioStore())
                    }
                }.onAppear(perform: {
                    self.store.dispatch()
                })
        }
    }
}
