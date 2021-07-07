//
//  ForgotPasswordView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/04.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var email: String = ""
    
    var body: some View {
        VStack(spacing: paddingLarge) {
            Image("1")
            
            Text("カリコレで登録したしたメールアドレスを入力してください。\nパスワード再設定手順を送信します。")
                .body()
            
            TextField("メールアドレス", text: $email)
                .defaultField(content: .emailAddress, keyboard: .emailAddress)
            Button("手順をメールする") {
                self.mode.wrappedValue.dismiss()
            }
            .mainButton()
            
            Spacer()
        }
        .padding(.horizontal, paddingMedium)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
