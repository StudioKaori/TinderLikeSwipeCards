//
//  CardView.swift
//  TinderLikeSwipeCards
//
//  Created by Kaori Persson on 2023-10-23.
//

import SwiftUI

struct CardView: View {
  @StateObject var viewModel: CardViewModel
  
  var body: some View {
    ZStack {
      Rectangle()
        .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height - 80)
        .border(.white, width: 3.0)
        .cornerRadius(20)
        .foregroundColor(viewModel.color.opacity(0.9))
        .shadow(radius: 4)
      
      HStack {
        Text(viewModel.person)
          .font(.largeTitle)
          .foregroundColor(.white)
          .bold()
        Image(systemName: "heart.fill")
          .foregroundColor(.red)
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
