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
    
    @Relationship
    var recipes: [Recipe]
    
    init(name: String = "", recipes: [Recipe] = []) {
        self.name = name
        self.recipes = recipes
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
