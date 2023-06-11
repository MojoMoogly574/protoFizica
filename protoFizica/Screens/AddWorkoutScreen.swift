//
//  AddWorkoutScreen.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/10/23.
//

import SwiftUI
import SwiftData

struct AddWorkoutScreen: View {
    //MARK: PROPERTIES
    @Environment (\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var workoutTitle: String = ""
    @State private var workoutObjective: String = ""
    
    private var isFormValid: Bool {
        !workoutTitle.isEmptyOfWhiteSpace && workoutObjective != nil
    }
    var body: some View {
        Form {
            TextField("Workout Title", text: $workoutTitle)
            Section("Workout Description/Objective:"){
                TextEditor(text: $workoutObjective)
                    .frame(width: 350, height: 125, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(5)
                    .padding()
            }
        }
        .navigationTitle("Add Workout")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                            dismiss( )
                }
            }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        //save
                        let workout = Workout(workoutTitle: workoutTitle, workoutObjective: workoutObjective)
                        context.insert(workout)
                        do {
                            try context.save()
                        }catch{
                            print(error.localizedDescription)
                        }
                        dismiss()
                    }
                    .disabled(!isFormValid)//if form is not valid, user will not be able to save
                }
            }
        }
    }

#Preview {
    NavigationStack {
        AddWorkoutScreen()
            .modelContainer(for: [Workout.self])
    }
}
