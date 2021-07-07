//
//  HomeView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/07.
//

import SwiftUI

struct HomeView: View {
    
    @State private var index = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    TabView(selection: $index) {
                        ForEach((0..<3), id: \.self) { index in
                            RoundedRectangle(cornerRadius: 16)
                                .fill(index % 2 == 0 ? Color.earthLight : Color.mintLight)
                            .padding(.horizontal, paddingSmall)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 144)

                    HomeGridItem(title: "新着")
                    HomeGridItem(title: "人気")
                    HomeGridItem(title: "お気に入り")
                }
            }
            .navigationTitle("カリコレ")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeGridItem: View {
    
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(self.title)
                    .font(.headline)
                    .foregroundColor(.title)
                Spacer()
                NavigationLink("すべてを見る", destination: EmptyView())
                    .font(.caption.bold())
                    .foregroundColor(Color.link)
            }
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) { // カラム数の指定
                ForEach((1...4), id: \.self) { index in
                    ZStack {
                        RoundedRectangle(cornerRadius: paddingMedium)
                            .fill(Color.mintLight)
                        Text("\(index)")
                    }
                    .frame(maxWidth: .infinity, minHeight:96)
                }
            }
        }
        .padding(.horizontal, paddingMedium)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
