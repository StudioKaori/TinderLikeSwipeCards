//
//  ContentView.swift
//  TinderLikeSwipeCards
//
//  Created by Kaori Persson on 2023-10-23.
//

import SwiftUI

struct ContentView: View {
  private var people: [String] = ["Mario", "Luigi", "Peach", "Toad", "Daisy"].reversed()
  
  var body: some View {
    VStack {
      ZStack {
        ForEach(people, id: \.self) { person in
          CardView(person: person)
        }
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
