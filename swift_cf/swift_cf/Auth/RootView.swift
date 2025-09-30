//
//  RootView.swift
//  swift_cf
//
//  Created by Сергей Недведский on 30.09.25.
//

import SwiftUI

struct RootView: View {

    @State private var isPresented: Bool = false

    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSignInView: $isPresented)
            }
        }
        .onAppear {
            let authUser = try? AuthManager.shared.getAuthUser()
            self.isPresented = authUser == nil
        }
        .fullScreenCover(isPresented: $isPresented) {
            NavigationStack {
                AuthView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
