//
//  MediaPlayerButton.swift
//  MusicApp
//
//  Created by Jorge Acosta on 30-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import SwiftUI


struct MediaPlayerButton: View {
    
    var isPlaying = false
    var isLoading = false
    
    var body: some View {
        ZStack{
            if(isLoading && isPlaying){
                 Image("spinner")
            } else {
                 Image(isPlaying ? "stop" : "play")
            }
        }
    }
}

struct MediaPlayerButton_Previews: PreviewProvider {
    static var previews: some View {
        MediaPlayerButton()
    }
}
