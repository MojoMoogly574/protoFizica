//
//  WorkoutListView.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/10/23.
//

import SwiftUI

struct WorkoutListView: View {
    //MARK:  PROPERTIES
    let workouts: [Workout]
    @Environment(\.modelContext) private var context
    
    private func deleteWorkout(indexSet: IndexSet)  {
        indexSet.forEach { index in
            let workout = workouts[index]
            context.delete(workout)
            do {
                try context.save( )
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    var body: some View {
        List {
            ForEach(workouts) { workout in
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(workout.workoutTitle)
                            .foregroundColor(.primary)
                            .accessibilityAddTraits(.isHeader)
                            .font(.body)
                            .fontWeight(.bold)
                            .padding(5)
                        Text(workout.workoutObjective)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                }
            }
            .onDelete(perform: deleteWorkout)
            .padding(.all)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 4))
        }
    }
}
#Preview {
    NavigationStack {
        WorkoutListView(workouts: [])
            .modelContainer(for: [Workout.self])
    }
}
