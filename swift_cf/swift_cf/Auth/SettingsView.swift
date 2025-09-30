//
//  SettingsView.swift
//  swift_cf
//
//  Created by Сергей Недведский on 30.09.25.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    func signOut() throws {
        try AuthManager.shared.signOut()
    }
}

struct SettingsView: View {

    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool

    var body: some View {
        List{
            Button("Log out"){
                Task{
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print("Error signing out: \(error)")
                    }
                }
            }
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(showSignInView: .constant(false))
        }
    }
}
