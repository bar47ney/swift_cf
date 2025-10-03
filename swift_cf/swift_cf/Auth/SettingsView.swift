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

    func resetPassword() async throws {
        let authUser = try AuthManager.shared.getAuthUser()

        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }

        try await AuthManager.shared.resetPassword(email: email)
    }

    func updateEmail() async throws {
        let newEmail = "123@gmail.com"
        try await AuthManager.shared.updateEmail(email: newEmail)
    }

    func updatePassword() async throws {
        let newPassword = "123@gmail.com"
        try await AuthManager.shared.updatePassword(password: newPassword)
    }
}

struct SettingsView: View {

    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool

    var body: some View {
        List {
            Button("Log out") {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print("Error signing out: \(error)")
                    }
                }
            }
            emaiSection

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

extension SettingsView {
    private var emaiSection: some View {
        Section {

            Button("Reset password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("Reset password")
                    } catch {
                        print("Error signing out: \(error)")
                    }
                }
            }
            Button("Update password") {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("Update password")
                    } catch {
                        print("Error signing out: \(error)")
                    }
                }
            }
            Button("Update email") {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("Update email")
                    } catch {
                        print("Error signing out: \(error)")
                    }
                }
            }
        } header: {
            Text("Email fuctions")
        }
    }
}
