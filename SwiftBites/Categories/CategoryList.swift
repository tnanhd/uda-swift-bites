//
//  CategoryList.swift
//  SwiftBites
//
//  Created by Tran Nhat Anh on 25/11/24.
//

import SwiftUI
import SwiftData

struct CategoryList: View {
    @Query private var categories: [Category]
    private var searchText: String = ""
    
    init(searchText: String = "") {
        self.searchText = searchText
        _categories = Query(filter: searchText.isEmpty ? nil : #Predicate<Category> {$0.name.localizedStandardContains(searchText)} )
    }

    // MARK: - Body
    var body: some View {
        if categories.isEmpty {
            ContentUnavailableView(
                label: {
                    Text("Couldn't find \"\(searchText)\"")
                }
            )
        } else {
            LazyVStack(spacing: 10) {
                ForEach(categories) { category in
                    CategorySection(category: category)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var query: String = ""
    
    NavigationStack {
        ScrollView(.vertical) {
            CategoryList(searchText: query)
                .modelContainer(for: Category.self)
        }
        .searchable(text: $query)
    }
}
