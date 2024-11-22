import SwiftUI

@main
struct SwiftBitesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Recipe.self, Category.self, Ingredient.self, RecipeIngredient.self])
        }
    }
}
