//
//  IngredientList.swift
//  SwiftBites
//
//  Created by Tran Nhat Anh on 25/11/24.
//

import SwiftUI
import SwiftData

struct IngredientList: View {
    typealias Selection = (Ingredient) -> Void
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Query private var ingredients: [Ingredient]
    
    let selection: Selection?
    private var searchText: String = ""
    
    init(selection: Selection? = nil, searchText: String = "") {
        self.selection = selection
        self.searchText = searchText
        _ingredients = Query(filter: searchText.isEmpty ? nil : #Predicate<Ingredient> {$0.name.localizedStandardContains(searchText)} )
    }
    
    // MARK: - Body
    var body: some View {
        if (ingredients.isEmpty) {
            ContentUnavailableView(
                label: {
                    Text("Couldn't find \"\(searchText)\"")
                }
            )
            .listRowSeparator(.hidden)
        } else {
            ForEach(ingredients) { ingredient in
                row(for: ingredient)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button("Delete", systemImage: "trash", role: .destructive) {
                            delete(ingredient: ingredient)
                        }
                    }
            }
        }
    }
    
    // MARK: - View
    @ViewBuilder
    private func row(for ingredient: Ingredient) -> some View {
        if let selection {
            Button(
                action: {
                    selection(ingredient)
                    dismiss()
                },
                label: {
                    Text(ingredient.name)
                        .font(.title3)
                }
            )
        } else {
            NavigationLink(value: IngredientForm.Mode.edit(ingredient)) {
                Text(ingredient.name)
                    .font(.title3)
            }	
        }
    }
    
    // MARK: - Data
    private func delete(ingredient: Ingredient) {
        context.delete(ingredient)
    }
}

#Preview {
    List {
        IngredientList()
            .modelContainer(for: Ingredient.self)
    }
}
