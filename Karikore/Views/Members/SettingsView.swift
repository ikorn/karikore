//
//  SettingsView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/07.
//

import SwiftUI

enum AuthenticationMethod: String, CaseIterable {
    case biometric
    case login
}

class SettingsStore: ObservableObject {
    var authenticationMethod: AuthenticationMethod = .login
    var notification: Bool = false
}

struct SettingsView: View {
    
    @EnvironmentObject var settings: SettingsStore
    
    var body: some View {
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
            Section(header: Text("アプリの設定")) {
                
            }
        }
        .navigationTitle("設定")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
