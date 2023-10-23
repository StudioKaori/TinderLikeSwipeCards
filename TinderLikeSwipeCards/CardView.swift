//
//  CardView.swift
//  TinderLikeSwipeCards
//
//  Created by Kaori Persson on 2023-10-23.
//

import SwiftUI

struct CardView: View {
  @StateObject var viewModel: CardViewModel
  let cardWidth = UIScreen.main.bounds.width - 20
  let cardHeight = UIScreen.main.bounds.height - 80
  
  var body: some View {
    ZStack {
      Rectangle()
        .frame(width: cardWidth, height: cardHeight)
        .cornerRadius(20)
        .border(.white, width: 3.0)
        .foregroundColor(.black)
        .shadow(radius: 4)
      
      HStack {
        Text(viewModel.person)
          .font(.largeTitle)
          .foregroundColor(.white)
          .bold()
        Image(systemName: "heart.fill")
          .foregroundColor(.red)
      }
      
      Rectangle()
        .frame(width: cardWidth, height: cardHeight)
        .border(.white, width: 3.0)
        .cornerRadius(20)
        .foregroundColor(viewModel.color)
        .shadow(radius: 4)
      
      if viewModel.cardSymbol != .none {
        Image(systemName: viewModel.cardSymbol.rawValue)
          .font(.system(size: 70))
          .foregroundColor(.white)
      }
    }
    .offset(x: viewModel.offset.width, y: viewModel.offset.height)
    .rotationEffect(.degrees(Double(viewModel.offset.width / 40)))
    .gesture(
      DragGesture()
        .onChanged({ gesture in
          withAnimation {
            viewModel.swipeCard(gesture: gesture)
          }
        })
        .onEnded({ _ in
          viewModel.didSwipeCard()
        })
    )
  }
  

}

#Preview {
  CardView(viewModel: CardViewModel(person: "Mario"))
}
