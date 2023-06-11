//
//  ExerciseListView.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/11/23.
//

import SwiftUI

struct ExerciseListView: View {
    //MARK:  PROPERTIES
    let exercises: [Exercise]
    
    private func deleteExercise(indexSet: IndexSet)  {
        indexSet.forEach { index in
            let exercise = exercises[index]
        }
    }
    
    var body: some View {
        List {
            ForEach(exercises) { exercise in
                VStack (alignment: .leading){
                    Text(exercise.exerciseName)
                }
            }
            .onDelete(perform: deleteExercise)
            .padding(2)
       

        }
    }
}
#Preview {
    ExerciseListView(exercises: [ ])
        .modelContainer(for: [ ])
}
