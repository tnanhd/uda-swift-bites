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
    @Relationship var recipe: Recipe?
    
    init(ingredient: Ingredient, quantity: String = "", recipe: Recipe? = nil) {
        self.ingredient = ingredient
        self.quantity = quantity
        self.recipe = recipe
    }
    
    static func == (lhs: RecipeIngredient, rhs: RecipeIngredient) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
