//
//  ProductData.swift
//  Karikore
//
//  Created by ikorn on 2021/07/08.
//

import Foundation

struct ProductData: Codable, Hashable {
    
    var id: String
    var title: String
    var description: String
    var imageURLs: Array<String>
    var category: String
    var brand: String
    var keyword: Array<String>
    var price: Int
    var rentalPrice: Int
    
    var mainImageURL: String? {
        return imageURLs.first
    }
    
    static func test(id: Int) -> ProductData {
        return ProductData(
            id: "AA\(id)",
            title: "テスト製品\(id)",
            description: "Handmade by skilled craftsman, 100% genuine cowhide leather with high quality which is soft and durable, smooth polyester interior ensures wonderful touching. Reinforced hardware and meticulous sewing make it more durable.",
            imageURLs: ["https://thevintagebar.imgix.net/SEeEg1JBfhQ4YJTMYfmj4yb3iQO4HxVoOeK57i1r/jpg?h=480&w=480"],
            category: "バック",
            brand: "シャネル",
            keyword: ["フラップバッグ", "レザー"],
            price: 30000,
            rentalPrice: 1000)
    }
}
