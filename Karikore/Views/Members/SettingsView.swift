//
//  SettingsView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/07.
//

import SwiftUI

enum AuthenticationMethod: String, CaseIterable {
    case biometric = "生体認証"
    case login = "アップリパスワード"
}

class SettingsStore: ObservableObject {
    var authenticationMethod: AuthenticationMethod = .login
    var notification: Bool = false
}

struct SettingsView: View {
    
    @EnvironmentObject var settings: SettingsStore
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("アプリの設定")) {
                    Picker(
                        selection: $settings.authenticationMethod,
                        label: Text("認証方法")) {
                        ForEach(AuthenticationMethod.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                    Toggle(isOn: $settings.notification) {
                        Text("通知:")
                    }
                }
                Section(header: Text("アプリ情報")) {
                    HStack {
                        Text("アプリバージョン")
                        Spacer()
                        Text("1.0")
                    }
                    NavigationLink("利用規約", destination: EmptyView())
                    NavigationLink("個人情報", destination: EmptyView())
                    NavigationLink("よくある質問", destination: EmptyView())
                    NavigationLink("ヘルプ", destination: EmptyView())
                }
                Section {
                    Button("ログアウト") {
                        UserDefaults.standard.removeObject(forKey: "isAuthenticated")
                    }
                }
            }
            .navigationTitle(Text("設定"))
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
