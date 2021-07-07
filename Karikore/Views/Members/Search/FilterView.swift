//
//  FilterView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/07.
//

import SwiftUI

struct FilterView: View {
    
    var title: String
    var items: Array<String>
    
    var body: some View {
        VStack {
            List {
                ForEach(self.items, id: \.self) { item in
                    NavigationLink(item, destination: EmptyView())
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("\(self.title)で検索")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(title: "カテゴリー", items: ["バック", "ドレス", "アクセサリー"])
    }
}
