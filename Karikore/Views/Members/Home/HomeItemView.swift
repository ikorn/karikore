//
//  HomeItemView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/09.
//

import SwiftUI

struct HomeItemView: View {
    var product: ProductData
    
    var body: some View {
        NavigationLink(destination: ProductView(product: self.product)) {
            VStack {
                AsyncImage(
                    url: product.mainImageURL?.toURL(),
                    placeholder: { ProgressView() },
                    image: { Image(uiImage: $0).resizable() })
                .scaledToFit()
                .frame(height: 80)
                Text("\(product.title)")
                    .caption()
            }
            .padding(.vertical, paddingSmall)
            .frame(maxWidth: .infinity, minHeight:96)
            .background(
                ZStack {
                RoundedRectangle(cornerRadius: paddingSmall)
                    .fill(Color.white.opacity(0.8))
                RoundedRectangle(cornerRadius: paddingSmall)
                    .stroke(Color.mint, lineWidth: 1)
                }
            )
            
        }
    }
}
struct HomeItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeItemView(product: ProductData.test(id: 1))
    }
}
