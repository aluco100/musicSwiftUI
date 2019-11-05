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
    
    var body: some View {
         withAnimation{
            VStack{
                HStack{
                    Image(uiImage: UIImage(data: image.imageData) ?? UIImage()).frame(width: 100.0, height: 100.0, alignment: .center)
                    VStack{
                        Text("\(item.artistName)")
                        Text("\(item.trackName)")
                    }
                }
                }.onAppear(perform: {
                    self.image.dispatch(url: self.item.artworkUrl100)
                })
            .padding()
            .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color(.white))
            .cornerRadius(8.0)
            .shadow(radius: 8.0)
         }.animation(Animation.easeInOut)
    }
}
