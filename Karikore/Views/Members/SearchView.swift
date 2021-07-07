//
//  SearchView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/07.
//

import SwiftUI

enum FilterType: String, CaseIterable {
    case category = "カテゴリー"
    case brand = "ブランド"
    case color = "色"
    case favorite = "お気に入り"
    case history = "履歴"
}

struct SearchView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: .constant(""))
                
                List {
                    ForEach(FilterType.allCases, id: \.self) { type in
                        NavigationLink(type.rawValue, destination: EmptyView())
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("検索")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
