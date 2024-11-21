//
//  Ingredient.swift
//  SwiftBites
//
//  Created by Tran Nhat Anh on 20/11/24.
//

import Foundation
import SwiftData

@Model
final class RecipeIngredient: Hashable, Identifiable {
    var id: UUID = UUID()
    var ingredient: Ingredient
    var quantity: String

    init(ingredient: Ingredient = Ingredient(), quantity: String = "") {
      self.ingredient = ingredient
      self.quantity = quantity
    }
    
    static func == (lhs: RecipeIngredient, rhs: RecipeIngredient) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
