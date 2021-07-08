//
//  HomeViewModel.swift
//  Karikore
//
//  Created by ikorn on 2021/07/09.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var newlyAdded = [ProductData]()
    
    init() {
        fetch()
    }
    
    func fetch() {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://run.mocky.io/v3/ed67fc00-a03c-4d81-86bf-afdbfe3840c6")!)
            .map { $0.data }
            .decode(type: [ProductData].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: &$newlyAdded)
    }
}

/*
[
  {
    "id": "id_1",
    "title": "チェーンショルダーバッグ",
    "description": "Handmade by skilled craftsman, 100% genuine cowhide leather with high quality which is soft and durable, smooth polyester interior ensures wonderful touching. Reinforced hardware and meticulous sewing make it more durable.",
    "imageURLs": [
      "https://laxus.co/app/img/product/1002046/1002046a.jpg",
      "https://laxus.co/app/img/product/1002046/1002046b.jpg",
      "https://laxus.co/app/img/product/1002046/1002046c.jpg",
      "https://laxus.co/app/img/product/1002046/1002046i.jpg"],
    "category": "ショルダーバッグ",
    "brand": "シャネル",
    "keyword": ["フラップバッグ", "レザー"],
    "price": 30000,
    "rentalPrice": 1000
  },
  {
    "id": "id_2",
    "title": "チェーントートバッグ",
    "description": "Handmade by skilled craftsman, 100% genuine cowhide leather with high quality which is soft and durable, smooth polyester interior ensures wonderful touching. Reinforced hardware and meticulous sewing make it more durable.",
    "imageURLs": [
      "https://laxus.co/app/img/product/14503/14503a.jpg",
      "https://laxus.co/app/img/product/14503/14503b.jpg",
      "https://laxus.co/app/img/product/14503/14503c.jpg",
      "https://laxus.co/app/img/product/14503/14503i.jpg"],
    "category": "バック",
    "brand": "シャネル",
    "keyword": ["トートバッグ", "レザー"],
    "price": 40000,
    "rentalPrice": 1000
  },
  {
    "id": "id_3",
    "title": "ミニショッパー",
    "description": "Handmade by skilled craftsman, 100% genuine cowhide leather with high quality which is soft and durable, smooth polyester interior ensures wonderful touching. Reinforced hardware and meticulous sewing make it more durable.",
    "imageURLs": [
      "https://laxus.co/app/img/product/90001586/90001586a.jpg",
      "https://laxus.co/app/img/product/90001586/90001586b.jpg",
      "https://laxus.co/app/img/product/90001586/90001586c.jpg",
      "https://laxus.co/app/img/product/90001586/90001586i.jpg"],
    "category": "バック",
    "brand": "セリーヌ",
    "keyword": ["ハンドバッグ", "レザー"],
    "price": 30000,
    "rentalPrice": 1000
  },
  {
    "id": "id_4",
    "title": "パナレア",
    "description": "Handmade by skilled craftsman, 100% genuine cowhide leather with high quality which is soft and durable, smooth polyester interior ensures wonderful touching. Reinforced hardware and meticulous sewing make it more durable.",
    "imageURLs": [
      "https://laxus.co/app/img/product/2177/2177a.jpg",
      "https://laxus.co/app/img/product/2177/2177b.jpg",
      "https://laxus.co/app/img/product/2177/2177c.jpg",
      "https://laxus.co/app/img/product/2177/2177i.jpg"],
    "category": "バック",
    "brand": "ディオール",
    "keyword": ["トートバッグ", "レザー"],
    "price": 30000,
    "rentalPrice": 1000
  },
  {
    "id": "id_5",
    "title": "スピーディ40",
    "description": "Handmade by skilled craftsman, 100% genuine cowhide leather with high quality which is soft and durable, smooth polyester interior ensures wonderful touching. Reinforced hardware and meticulous sewing make it more durable.",
    "imageURLs": [
      "https://laxus.co/app/img/product/1002668/1002668a.jpg",
      "https://laxus.co/app/img/product/1002668/1002668b.jpg",
      "https://laxus.co/app/img/product/1002668/1002668c.jpg",
      "https://laxus.co/app/img/product/1002668/1002668i.jpg"],
    "category": "バック",
    "brand": "ルイ・ヴィトン",
    "keyword": ["ハンドバッグ", "キャンバス"],
    "price": 30000,
    "rentalPrice": 1000
  },  {
    "id": "id_6",
    "title": "ソーホー",
    "description": "Handmade by skilled craftsman, 100% genuine cowhide leather with high quality which is soft and durable, smooth polyester interior ensures wonderful touching. Reinforced hardware and meticulous sewing make it more durable.",
    "imageURLs": [
      "https://laxus.co/app/img/product/30234/30234a.jpg",
      "https://laxus.co/app/img/product/30234/30234b.jpg",
      "https://laxus.co/app/img/product/30234/30234c.jpg",
      "https://laxus.co/app/img/product/30234/30234i.jpg"],
    "category": "バック",
    "brand": "グッチ",
    "keyword": ["トートバッグ", "キャンバス"],
    "price": 30000,
    "rentalPrice": 1000
  },
]
*/
