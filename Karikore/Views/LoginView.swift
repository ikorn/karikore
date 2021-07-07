//
//  ContentView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/04.
//

import SwiftUI

struct LoginView: View {

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient.mintWhite
                
                LoginForm()
            }
            .edgesIgnoringSafeArea(.vertical)
            .padding(.bottom, paddingLarge)
            .navigationBarHidden(true)
        }
    }
}

struct LoginForm: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isSuccess: Bool = false
    @State private var error: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            AngularGradient(colors: [Color.mintLight, Color.earthLight], center: .top)
            
            VStack(alignment: .leading, spacing: paddingSmall) {
                TextField("メールアドレス", text: $email)
                    .defaultField(content: .emailAddress, keyboard: .emailAddress)
                SecureField("パスワード", text: $password)
                    .defaultField(content: .password, keyboard: .asciiCapable)
                
                NavigationLink(destination: MembersView(), isActive: $isSuccess) {
                    Text("ログイン")
                        .mainButton()
                        .padding(.vertical, paddingMedium)
                }
                .simultaneousGesture(TapGesture().onEnded({
                    self.login()
                }))
                .alert(isPresented: .constant(!self.error.isEmpty)) {
                    Alert(
                        title: Text("エラー"),
                        message: Text(self.error),
                        dismissButton: .default(Text("OK")))
                }

                HStack(alignment: .center, spacing: paddingSmall) {
                    NavigationLink(
                        destination: ForgotPasswordView()) {
                        Text("パスワードお忘れの方")
                            .link(color: .earth)
                    }
                    Divider()
                        .frame(height: paddingMedium)
                    NavigationLink(destination: SignupView()) {
                        Text("新規登録")
                            .link(color: .earth)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, paddingMedium)
            .padding(.top, paddingLarge)
        }
    }
    
    private func login() {
        guard !self.email.isEmpty && !self.password.isEmpty else {
            self.error = "入力してください"
            return
        }
        self.error = ""
        self.isSuccess = true
        NSLog("isSuccess \(isSuccess)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
