//
//  TrackImageStore.swift
//  MusicApp
//
//  Created by Alfredo Luco on 04-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class TrackImageStore: ObservableObject {
    
    
    @Published var imageData: Data
    @Published var reducer: ImageReducer
    var url: String?{
        didSet{
            self.dispatch(url: url ?? "")
        }
    }
    
    
    init() {
        imageData = Data()
        reducer = ImageReducer()
    }
    
    func dispatch(url: String){
        reducer.retrieveImageData(url: url, success: {
            self.imageData = $0
        }, failure: {
            print($0)
        })
    }
    
}
