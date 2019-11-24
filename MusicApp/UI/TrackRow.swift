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
    
    var body: some View {
        let navigation = NavigationLink(destination: Text("View"), tag: 1, selection: $selection) { EmptyView() }

         return withAnimation{
            VStack{
                navigation
                HStack{
                    ZStack{
                        Image(uiImage: UIImage(data: image.imageData) ?? UIImage()).frame(width: 100.0, height: 100.0, alignment: .center)
                        Button(action: {
                            self.sound.dispatch(url: self.item.previewUrl)
                        }){
                            Image("play").foregroundColor(Color(.white))
                        }
                    }
                    
                    VStack{
                        Text("\(item.artistName)")
                        Text("\(item.trackName)")
                    }
                }
                }.onAppear(perform: {
                    self.image.dispatch(url: self.item.artworkUrl100)
                })
//                .onTapGesture {
//                    self.selection = 1
//            }
            .padding()
            .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color(.white))
            .cornerRadius(8.0)
            .shadow(radius: 8.0)
         }.animation(Animation.easeInOut)
    }
}
