//
//  WorkoutDetailView.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/11/23.
//

import SwiftUI
import SwiftData


struct WorkoutDetailScreen: View {
    //MARK: PROPERTIES
    @State private var workoutTitle: String = ""
    @State private var workoutObjective: String = ""
    
    
    
    let workout: Workout
    var body: some View {
      
            Form {
                Section("Workout Title"){
                    TextField("Workout Title", text: $workoutTitle)
                }
                Section("Workout Description/Objective:"){
                    TextEditor(text: $workoutObjective)
                        .frame(width: 350, height: 125, alignment: .leading)
                        .multilineTextAlignment(.leading)
                        .lineLimit(5)
                        .padding()
                }
                Button("Update") {
                    workout.workoutTitle = workoutTitle
                    workout.workoutObjective = workoutObjective
                }
            }
            .onAppear {
                workoutTitle = workout.workoutTitle
                workoutObjective = workout.workoutObjective
            }
        }
    }

struct WorkoutDetailContainerScreen: View {
    //MARK:  PROPERTIES
    @Environment(\.modelContext) private var context
    @State private var workout: Workout?
    
    var body: some View {
        
        ZStack {
            if let workout {
                WorkoutDetailScreen(workout: workout)
            }
        }
            .onAppear {
                workout = Workout(workoutTitle: "Murph", workoutObjective: "Complete as Rx'd for time.")
                context.insert(workout!)
            }
    }
}
#Preview {
    WorkoutDetailContainerScreen()
        .modelContainer(for: [Workout.self])
      
}
