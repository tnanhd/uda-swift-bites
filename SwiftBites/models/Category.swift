//
//  Ingredient.swift
//  SwiftBites
//
//  Created by Tran Nhat Anh on 20/11/24.
//

import Foundation
import SwiftData

@Model
final class Category: Hashable, Identifiable {
    var id: UUID = UUID()
    var name: String

    init(name: String = "") {
      self.name = name
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}