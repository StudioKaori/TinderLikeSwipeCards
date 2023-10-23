//
//  CardViewModel.swift
//  TinderLikeSwipeCards
//
//  Created by Kaori Persson on 2023-10-23.
//

import SwiftUI

class CardViewModel: ObservableObject {
  let person: String
  @Published var offset = CGSize.zero
  @Published var color: Color = .black.opacity(0)
  @Published var cardSymbol: CardSymbol = .none
  
  enum CardSymbol: String {
    case none = ""
    case like = "hand.thumbsup.fill"
    case dislike = "hand.thumbsdown.fill"
    case love = "heart.fill"
  }
  
  init(person: String) {
    self.person = person
  }
  
  private func updateCardAppearance() {
    if abs(offset.width) > abs(offset.height) {
      switch offset.width {
      case -500...(-50):
        color = .blue.opacity(0.9)
        cardSymbol = .dislike
      case 50...500:
        color = .orange.opacity(0.9)
        cardSymbol = .like
      default:
        color = .black.opacity(0)
        cardSymbol = .none
      }
    } else {
      switch offset.height {
      case -500...(-50):
        color = .pink.opacity(0.9)
        cardSymbol = .love
      case 50...500:
        color = .black.opacity(0)
        cardSymbol = .none
      default:
        color = .black.opacity(0)
        cardSymbol = .none
      }
    }
  }
  
  func swipeCard(gesture: DragGesture.Value) {
    updateCardAppearance()
    
    if abs(offset.width) < abs(offset.height) {
      if offset.height >= 0 {
        return
      }
    }
    offset = gesture.translation
    
  }
  
  func didSwipeCard() {
    if abs(offset.width) > abs(offset.height) {
      switch offset.width {
      // Swipe to left, take away the card
      case -500...(-200):
        print("\(person) dislike")
        offset = CGSize(width: -500, height: 0)
      // Swipe to right
      case 200...(500):
        print("\(person) like")
        offset = CGSize(width: 500, height: 0)
      // Reset
      default:
        offset = .zero
        color = .black.opacity(0)
        cardSymbol = .none
      }
    } else {
      switch offset.height {
      case -500...(-180):
        print("\(person) love")
        offset = CGSize(width: -500, height: 0)
      case 150...(500):
        print("\(person) photo")
        offset = .zero
      // Reset
      default:
        offset = .zero
        color = .black.opacity(0)
        cardSymbol = .none
      }
    }
    
    updateCardAppearance()
  }
}
