//
//  ImageReducer.swift
//  MusicApp
//
//  Created by Alfredo Luco on 04-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import Foundation
import Alamofire

struct ImageReducer {
    
    func retrieveImageData(url: String, success: @escaping (_ data: Data)->Void, failure: @escaping (_ error: Error)->Void){
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseData(completionHandler: {
            response in
            
            guard response.error == nil else{
                failure(response.error!)
                return
            }
            
            guard response.result.error == nil else{
                failure(response.result.error!)
                return
            }
            
            guard let data = response.result.value else{
                failure(NSError(domain: "Itunes", code: 400, userInfo: [NSLocalizedDescriptionKey : "No data"]))
                return
            }
            
            success(data)
            
        })
        
    }
    
}
