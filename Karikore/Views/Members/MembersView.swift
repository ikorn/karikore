//
//  HomeView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/04.
//

import SwiftUI

struct MembersView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem { TabItemView(title: "Home", imageName: "home") }
            Text("Search")
                .tabItem { TabItemView(title: "Search", imageName: "search") }
            Text("Account")
                .tabItem{ TabItemView(title: "Account", imageName: "account") }
            SettingsView()
                .environmentObject(SettingsStore())
                .tabItem{ TabItemView(title: "Setting", imageName: "settings") }
        }
        .accentColor(.active)
        .navigationBarBackButtonHidden(true)
    }
}

struct TabItemView: View {
    
    private var title: String = ""
    private var imageName: String = ""
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    
    var body: some View {
        Image(self.imageName)
        Text(self.title)
    }
}

struct MemebersView_Previews: PreviewProvider {
    static var previews: some View {
        MembersView()
    }
}
