//
//  Card.swift
//  MusicApp
//
//  Created by Jorge Acosta on 30-11-19.
//  Copyright © 2019 Alfredo Luco. All rights reserved.
//

import SwiftUI

struct Card<Content>: View where Content: View {

    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack{
          HStack(alignment: .top){
            content()
          }
          .padding(5)
          .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
          .background(Color(.white))
          .cornerRadius(8.0)
          .shadow(radius: 4.0)
      }
      .padding(5)
        
    }

}

    

