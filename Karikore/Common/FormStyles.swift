//
//  FormStyles.swift
//  Karikore
//
//  Created by ikorn on 2021/07/04.
//

import SwiftUI
import UIKit

extension TextField {
    
    func defaultField(content: UITextContentType? = nil, keyboard: UIKeyboardType = .default) -> some View {
        self.textFieldStyle(.roundedBorder)
            .textContentType(content)
            .keyboardType(keyboard)
            .foregroundColor(.body)
            .accentColor(.active)
    }
}

extension SecureField {
    
    func defaultField(content: UITextContentType? = nil, keyboard: UIKeyboardType = .default) -> some View {
        self.textFieldStyle(.roundedBorder)
            .textContentType(content)
            .keyboardType(keyboard)
            .foregroundColor(.body)
            .accentColor(.active)
    }
}

extension Button {
    
    func mainButton() -> some View {
        self.font(.body.bold())
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(paddingSmall)
            .background(Color.mint)
            .cornerRadius(paddingMedium)
    }
    
    func textButton(color: Color) -> some View {
        self.font(.caption.bold())
            .frame(maxWidth: .infinity)
            .foregroundColor(color)
            .padding(paddingSmall)
    }
}

extension Text {
    
    func title() -> some View {
        self.font(.headline.bold())
            .foregroundColor(.title)
            .lineSpacing(paddingSmall)
    }
    
    func body() -> some View {
        self.font(.body)
            .foregroundColor(.body)
            .lineSpacing(paddingSmall)
    }
    
    func link(color: Color) -> some View {
        self.font(.caption.bold())
            .foregroundColor(color)
            .padding(paddingSmall)
    }
    
    func mainButton() -> some View {
        self.font(.body.bold())
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(paddingSmall)
            .background(Color.mint)
            .cornerRadius(paddingMedium)
    }
}
