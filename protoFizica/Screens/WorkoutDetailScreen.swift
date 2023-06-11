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
    @State private var showExerciseScreen: Bool = false
    @Environment (\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    
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
            //MARK:  ADD EXERCISE
            Section(header: Text("Exercises")) {
                Button(action:   {
                    HapticManager.notification(type: .success)
                    withAnimation{
                        showExerciseScreen = true
                    }
                })
                {
                    Image(systemName: "plus.circle.fill")
                    
                }
                if let exercises = workout.exercises {
                    if exercises.isEmpty {
                        ContentUnavailableView {
                            Text("Add Exercises to Routine")
                        }
                    }
                    else {
                       ExerciseListView(exercises: exercises)
                    }
                }
            
                //MARK:  UPDATE BUTTON
            
            }
               
                Button("Update") {
                    workout.workoutTitle = workoutTitle
                    workout.workoutObjective = workoutObjective
                    dismiss( )
                    do {
                        try context.save( )
                    }catch{
                        print(error.localizedDescription)
                    }
                }
                .buttonStyle(.borderless)
            }
            .onAppear {
                workoutTitle = workout.workoutTitle
                workoutObjective = workout.workoutObjective
            }
            .sheet(isPresented: $showExerciseScreen, content: {
                NavigationStack {
                    AddExerciseScreen(workout: workout)
                }
            })
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
