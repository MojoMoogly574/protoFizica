//
//  WorkoutListScreen.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/10/23.
//

import SwiftUI
import SwiftData

struct WorkoutListScreen: View {
    //MARK:  PROPERTIES
    
    
    
    @Query(sort: \.workoutTitle, order: .reverse) private var workouts: [Workout]
    @State private var isAddWorkoutPresented: Bool = false
    
    
    var body: some View {
        WorkoutListView(workouts: workouts)
        .toolbar (content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button ("Add Workout") {
                    isAddWorkoutPresented = true
                       
                }
            }
        })
        .sheet(isPresented: $isAddWorkoutPresented, content: {
            NavigationStack {
                AddWorkoutScreen()
            }
        })
    }
}
#Preview {
    WorkoutListScreen()
        .modelContainer(for: [Workout.self])
}
