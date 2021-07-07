//
//  SignupView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/04.
//

import SwiftUI

struct SignupView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(spacing: paddingLarge) {
            Image("1")
            VStack(spacing: paddingSmall) {
                TextField("メールアドレス", text: $email)
                    .defaultField(content: .emailAddress, keyboard: .emailAddress)
                SecureField("パスワード", text: $password)
                    .defaultField(content: .password, keyboard: .asciiCapable)
                SecureField("パスワード再入力", text: $confirmPassword)
                    .defaultField(content: .password, keyboard: .asciiCapable)
            }
            Button("アカウント作成") {
                self.mode.wrappedValue.dismiss()
            }
            .mainButton()
            
            Spacer()
        }
        .padding(.horizontal, paddingMedium)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
