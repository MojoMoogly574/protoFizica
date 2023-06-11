//
//  ContentView.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    
    var body: some View {
        Text("Hello")
    }
}
#Preview {
    ContentView()
        .modelContainer(for: Workout.self, inMemory: true)
}
