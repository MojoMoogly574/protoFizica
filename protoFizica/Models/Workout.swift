//
//  Item.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/10/23.
//

import SwiftUI
import SwiftData



@Model
final class Workout {
    @Attribute(.unique) var workoutTitle: String
    var workoutObjective: String
    
    
    
    init(workoutTitle: String, workoutObjective: String) {
        self.workoutTitle = workoutTitle
        self.workoutObjective = workoutObjective
    }
    }


