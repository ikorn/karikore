//
//  HomeView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/04.
//

import SwiftUI

class MembersData: ObservableObject {
    var tabIndex: Int = 0
}

struct MembersView: View {
    
    @EnvironmentObject var data: MembersData
    
    var body: some View {
        TabView(selection: $data.tabIndex) {
            HomeView()
                .tabItem { TabItemView(title: "Home", image: Image(systemName: "house")) }
            SearchView()
                .tabItem { TabItemView(title: "Search", image: Image(systemName: "magnifyingglass")) }
            AccountView()
                .tabItem{ TabItemView(title: "Account", image: Image(systemName: "person.fill")) }
            SettingsView()
                .environmentObject(SettingsStore())
                .tabItem{ TabItemView(title: "Setting", image: Image(systemName: "gearshape.fill")) }
        }
        .accentColor(.active)
        .navigationBarBackButtonHidden(true)
    }
}

struct TabItemView: View {
    
    var title: String
    var image: Image

    
    var body: some View {
        self.image
        Text(self.title)
    }
}

struct MemebersView_Previews: PreviewProvider {
    static var previews: some View {
        MembersView()
    }
}
