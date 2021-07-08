//
//  HomeView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/07.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
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

                    HomeGridItem(title: "新着", items: self.viewModel.newlyAdded)
                    HomeGridItem(title: "人気", items: self.viewModel.newlyAdded)
                    HomeGridItem(title: "お気に入り", items: self.viewModel.newlyAdded)
                }
                .background(LinearGradient.mintWhite)
                .onAppear {
                    viewModel.fetch()
                }
            }
            .navigationTitle("カリコレ")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeGridItem: View {
    
    var title: String
    var items: [ProductData]
    
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
                ForEach(self.items, id: \.self.id) { product in
                    HomeItemView(product: product)
                }
            }
        }
        .padding(.horizontal, paddingMedium)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
