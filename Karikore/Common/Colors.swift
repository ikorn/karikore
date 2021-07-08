//
//  Colors.swift
//  Karikore
//
//  Created by ikorn on 2021/06/27.
//

import SwiftUI

extension Color {
    
    static let mintLight    = Color("MintLight")
    static let mint         = Color("Mint")
    static let earthLight   = Color("EarthLight")
    static let earth        = Color("Earth")
    
    static let inactivce    = Color("Inactive")
    static let active       = Color("Active")
    static let disabled     = Color("Disabled")
    
    static let title        = Color("Title")
    static let body         = Color("Body")
    static let link         = Color("Link")
    
}

extension LinearGradient {
    
    static let mintWhite = LinearGradient(colors: [Color.white, Color.mintLight], startPoint: .top, endPoint: .bottom)
}
