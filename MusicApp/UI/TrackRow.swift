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
    @ObservedObject var image: TrackImageStore
    @ObservedObject var sound: TrackAudioStore
    @State var selection: Int? = nil
    
    var button: some View{
        Button(action: {
            self.sound.dispatch(url: self.item.previewUrl)
        }){
            Image("play").foregroundColor(Color(.white))
        }
    }
    
    var body: some View {
      
         return withAnimation{
            Card{
                HStack{
                   ZStack{
                    Image(uiImage: UIImage(data: self.image.imageData) ?? UIImage()).frame(width: 100.0, height: 100.0, alignment: .center)
                    self.button
                   }
                   
                   VStack{
                    Text(self.item.artistName)
                    Text(self.item.trackName)
                   }
               }
            }
         }.animation(Animation.easeInOut)
    }
}
