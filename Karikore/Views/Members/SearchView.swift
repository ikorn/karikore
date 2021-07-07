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
    @State var items: Array<String> = ["Test", "test2"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: paddingSmall) {
                SearchBar(text: .constant(""))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(FilterType.allCases, id: \.self) { type in
                            FilterItem(type: type)
                        }
                    }
                    .padding(.horizontal, paddingSmall)
                }
                
                if !self.items.isEmpty {
                    Divider()
                    
                    HStack {
                        Text("検索結果")
                            .body()
                        Spacer()
                        Text("\(self.items.count)件")
                            .body()
                    }.padding(.horizontal, paddingMedium)
                    
                    List {
                        ForEach(items, id: \.self) { item in
                            ProductSearchItem(title: item, image: Image("1"), destination: EmptyView())
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("検索")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FilterItem: View {
    
    var type: FilterType
    
    var body: some View {
        NavigationLink(destination: FilterView(title: self.type.rawValue, items: ["バック", "シューズ", "アクセサリー"])) {
            Text(self.type.rawValue)
                .body()
                .padding(paddingSmall)
                .background(RoundedRectangle(cornerRadius: paddingSmall).fill(Color.mintLight))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
