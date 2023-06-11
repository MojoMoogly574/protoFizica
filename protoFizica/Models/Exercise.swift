//
//  Exercise.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/11/23.
//

import Foundation
import SwiftData

@Model
final class Exercise {
    var exerciseName: String
    var workout: Workout?
    
    init(exerciseName: String) {
        self.exerciseName = exerciseName
       
    }
}
