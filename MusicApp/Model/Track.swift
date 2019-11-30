//
//  Track.swift
//  MusicApp
//
//  Created by Alfredo Luco on 03-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

struct TrackObject: Mappable, Identifiable {
    
    //MARK: - Properties
    var id: Int = 0
    var wrapperType: String = ""
    var kind: String = ""
    var artistId: Int = 0
    var collectionId: Int = 0
    var artistName: String = ""
    var collectionName: String = ""
    var trackName: String = ""
    var collectionCensoredName: String = ""
    var trackCensoredName: String = ""
    var artistViewUrl: String = ""
    var trackViewUrl: String = ""
    var artworkUrl100: String = ""
    var previewUrl: String = ""
    
        
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id<-map["trackId"]
        wrapperType<-map["wrapperType"]
        kind<-map["kind"]
        artistId<-map["artistId"]
        collectionId<-map["collectionId"]
        artistName<-map["artistName"]
        collectionName<-map["collectionName"]
        trackName<-map["trackName"]
        collectionCensoredName<-map["collectionCensoredName"]
        trackCensoredName<-map["trackCensoredName"]
        artistViewUrl<-map["artistViewUrl"]
        trackViewUrl<-map["trackViewUrl"]
        artworkUrl100<-map["artworkUrl100"]
        previewUrl<-map["previewUrl"]
        
    }
}

