//
//  HapticsManager.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/11/23.
//

import SwiftUI


class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
