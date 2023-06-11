//
//  ExerciseListView.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/11/23.
//

import SwiftUI

struct ExerciseListView: View {
    //MARK:  PROPERTIES
    @Environment(\.modelContext) private var context
    let workout: Workout
    
    private func deleteExercise(indexSet: IndexSet)  {
        indexSet.forEach { index in
            let exercise = workout.exercises [index]
            context.delete(exercise)
            
            do {
                workout.exercises.remove(at: index)
                try context.save( )
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(workout.exercises) { exercise in
                VStack (alignment: .leading){
                    Text(exercise.exerciseName)
                }
            }
            .onDelete(perform: deleteExercise)
            .padding(2)
       

        }
    }
}
