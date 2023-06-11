//
//  AddExerciseScreen.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/11/23.
//

import SwiftUI
import SwiftData


struct AddExerciseScreen: View {
    //MARK:  PROPERTIES
    @Environment(\.modelContext) private var context
    @Environment (\.dismiss) private var dismiss
    
    let workout: Workout
    
    @State private var exerciseName: String = ""
    
    private var isFormValid: Bool {
        !exerciseName.isEmptyOfWhiteSpace
    }
    
    var body: some View {
        Form {
            Section("Exercise Details:"){
                TextField("Add Exercise", text: $exerciseName)
            }
            }
        .navigationTitle("Add Exercise")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss( )
                }
            }
            ToolbarItem(placement: .topBarTrailing)  {
                Button ("Save") {
                    let exercise = Exercise(exerciseName: exerciseName)
                    exercise.workout = workout
                    context.insert(exercise)
                    
                    do {
                        try context.save( )
                        workout.exercises.append(exercise)
                    }catch{
                        print(error.localizedDescription)
                    }
                    dismiss( )
                }
                .disabled(!isFormValid)
            }
           
        }
    }
}

//#Preview {
//    AddExerciseScreen()
//}
