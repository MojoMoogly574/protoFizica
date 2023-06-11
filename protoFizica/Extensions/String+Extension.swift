//
//  String+Extension.swift
//  protoFizica
//
//  Created by Joseph DeWeese on 6/10/23.
//

import Foundation

extension String {
    
    var isEmptyOfWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
