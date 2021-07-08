//
//  ProductView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/08.
//

import SwiftUI

struct ProductView: View {
    
    var product: ProductData
    
    @State var isFavourite: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: paddingSmall) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(self.product.imageURLs, id: \.self) { url in
                            AsyncImage(
                               url: url.toURL(),
                               placeholder: { ProgressView() },
                               image: { Image(uiImage: $0).resizable() }
                            )
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width, height: 280)
                        }
                    }
                }
                .frame(height: 280)
                .background(Color.white)

                Text(self.product.description)
                    .caption()
                    .padding(.horizontal, paddingMedium)
                
                Divider()
                
                VStack(alignment: .leading, spacing: paddingSmall) {
                    ProductInfoItemView(label: "ブランド", value: self.product.brand)
                    ProductInfoItemView(label: "カテゴリー", value: self.product.category)
                    ProductInfoItemView(label: "値段", value: "\(self.product.price)")
                    ProductInfoItemView(label: "日割り", value: "\(self.product.rentalPrice)")
                }
                .padding(.horizontal, paddingMedium)
                
                Divider()
                
                NavigationLink(destination: EmptyView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: .infinity)
                            .fill(Color.earthLight)
                        Text("借りる")
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                    }
                    .padding(paddingMedium)
                }
                
                VStack(alignment: .leading, spacing: paddingMedium) {
                    HStack {
                        Text("レビュー")
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        NavigationLink("全部をみる", destination: EmptyView())
                    }
                    .padding()
                    .background(Color.earth)
                    
                    ForEach((0..<5), id: \.self) { index in
                        Text("レビュー内容 \(index)")
                            .body()
                            .padding(.horizontal, paddingMedium)
                        Divider()
                    }
                }
                
            }
        }
        .navigationTitle(self.product.title)
        .navigationBarItems(trailing: Button(action: {
            self.isFavourite = !self.isFavourite
        }) {
            Image(systemName: self.isFavourite ? "heart.fill" : "heart")
        })
    }
}

struct ProductInfoItemView: View {
    
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(self.label)
                .bold()
                .caption()
            Spacer()
            Text(self.value)
                .caption()
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: ProductData.test(id: 1))
    }
}
