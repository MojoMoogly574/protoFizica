//
//  protoFizicaApp.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/10/23.
//

import SwiftUI
import SwiftData

@main
struct protoFizicaApp: App {

    var body: some Scene {
        
        WindowGroup {
            NavigationStack{
                WorkoutListScreen()
            }
            .modelContainer(for:  [Workout.self])
        }
    }
}
