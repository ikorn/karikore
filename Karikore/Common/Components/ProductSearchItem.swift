//
//  ProductSearchItem.swift
//  Karikore
//
//  Created by ikorn on 2021/07/07.
//

import SwiftUI

struct ProductSearchItem<TartgetView: View>: View {
    
    var title: String
    var image: Image
    var destination: TartgetView
    
    var body: some View {
        NavigationLink(destination: self.destination) {
            HStack(alignment: .top, spacing: paddingSmall) {
                self.image
                    .resizable()
                    .frame(width: 88, height: 88)
                
                VStack(alignment: .leading, spacing: paddingSmall) {
                    Text(self.title)
                        .bold()
                        .body()
                    Text("category")
                        .bold()
                }
            }
        }
    }
}

struct ProductSearchItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductSearchItem(title: "コーチレザートートバッグ", image: Image("1"), destination: EmptyView())
    }
}
