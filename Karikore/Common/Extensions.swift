//
//  Extensions.swift
//  Karikore
//
//  Created by ikorn on 2021/06/27.
//

import Foundation

extension NSObject {

    static var className: String {
        return String(describing: self)
    }
}

extension String {
    
    func toURL() -> URL? {
        return URL(string: self)
    }
}
