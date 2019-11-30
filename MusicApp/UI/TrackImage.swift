//
//  TrackImage.swift
//  MusicApp
//
//  Created by Mavericks's iOS Dev on 29-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import SwiftUI
import URLImage

struct TrackImage: View {
    var url = ""
    
    var width = 100.0
    var height = 100.0
    
    var body: some View {
        URLImage((URL(string: url) ?? nil)!)
            .frame(width: CGFloat(self.width), height: CGFloat(self.height))
    }
}
