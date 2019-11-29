//
//  TrackImage.swift
//  MusicApp
//
//  Created by Mavericks's iOS Dev on 29-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import SwiftUI

struct TrackImage: View {
    @ObservedObject var image: TrackImageStore = TrackImageStore()

    var body: some View {
        Image(uiImage: UIImage(data: image.imageData) ?? UIImage()).frame(width: 100.0, height: 100.0, alignment: .center)
    }
}
