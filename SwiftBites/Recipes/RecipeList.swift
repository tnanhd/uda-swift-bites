//
//  RecipeList.swift
//  SwiftBites
//
//  Created by Tran Nhat Anh on 25/11/24.
//

import SwiftUI
import SwiftData

struct RecipeList: View {
    
    @Query private var recipes: [Recipe]
    private var searchText: String = ""
    
    init(searchText: String = "", sortOrder: SortDescriptor<Recipe>) {
        self.searchText = searchText
        _recipes = Query(filter: searchText.isEmpty ? nil : #Predicate<Recipe> {$0.name.localizedStandardContains(searchText)}, sort: [sortOrder])
    }
    
    // MARK: - Body
    var body: some View {
        if recipes.isEmpty {
            ContentUnavailableView(
                label: {
                    Text("Couldn't find \"\(searchText)\"")
                }
            )
        } else {
            LazyVStack(spacing: 10) {
                ForEach(recipes, content: RecipeCell.init)
            }
        }
    }
}

#Preview {
    @Previewable @State var searchText = ""
    
    NavigationStack {
        ScrollView(.vertical) {
            RecipeList(searchText: searchText, sortOrder: SortDescriptor(\Recipe.name))
        }
        .searchable(text: $searchText)
    }
    .modelContainer(for: Recipe.self)
}
