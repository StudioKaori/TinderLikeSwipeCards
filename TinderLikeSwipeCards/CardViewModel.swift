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
  @Published var color: Color = .black
  
  init(person: String) {
    self.person = person
  }
  
  private func updateCardAppearance() {
    if abs(offset.width) > abs(offset.height) {
      switch offset.width {
      case -500...(-50):
        color = .blue
      case 50...500:
        color = .orange
      default:
        color = .black
      }
    } else {
      switch offset.height {
      case -500...(-50):
        color = .pink
      case 50...500:
        color = .black
      default:
        color = .black
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
      case -500...(-150):
        print("\(person) dislike")
        offset = CGSize(width: -500, height: 0)
      // Swipe to right
      case 150...(500):
        print("\(person) like")
        offset = CGSize(width: 500, height: 0)
      // Reset
      default:
        offset = .zero
      }
    } else {
      switch offset.height {
      case -500...(-300):
        print("\(person) love")
        offset = CGSize(width: -500, height: 0)
      case 150...(500):
        print("\(person) photo")
        offset = .zero
      // Reset
      default:
        offset = .zero
      }
    }
    
    updateCardAppearance()
  }
}
