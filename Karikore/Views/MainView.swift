//
//  MainView.swift
//  Karikore
//
//  Created by ikorn on 2021/07/07.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false
    
    var body: some View {
        if isAuthenticated {
            MembersView().environmentObject(MembersData())
        } else {
            LoginView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
