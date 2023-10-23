//
//  CardView.swift
//  TinderLikeSwipeCards
//
//  Created by Kaori Persson on 2023-10-23.
//

import SwiftUI

struct CardView: View {
  var person: String
  @State private var offset = CGSize.zero
  @State private var color: Color = .black
  
  var body: some View {
    ZStack {
      Rectangle()
        .frame(width: 320, height: 420)
        .border(.white, width: 6.0)
        .cornerRadius(4)
        .foregroundColor(color.opacity(0.9))
        .shadow(radius: 4)
      
      HStack {
        Text(person)
          .font(.largeTitle)
          .foregroundColor(.white)
          .bold()
        Image(systemName: "heart.fill")
          .foregroundColor(.red)
      }
    }
    .offset(x: offset.width, y: offset.height * 0.4)
    .rotationEffect(.degrees(Double(offset.width / 40)))
    
  }
}

#Preview {
  CardView(person: "Mario")
}
