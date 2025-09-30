//
//  SignInView.swift
//  swift_FC
//
//  Created by Сергей Недведский on 7.09.25.
//

import SwiftUI

@MainActor
final class SignInViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""

    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }

        Task {
            do {
                let returnedUsrdata = try await AuthManager.shared.createUser(
                    email: email,
                    password: password
                )
                print("Successfully signed in: \(returnedUsrdata)")

            } catch {
                print("Error signing in: \(error.localizedDescription)")
            }
        }

    }
}

struct SignInView: View {

    @StateObject private var viewModel = SignInViewModel()

    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)

            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            Button {
                viewModel.signIn()
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Sign In With Email")
    }
}

#Preview {
    NavigationStack {
        SignInView()
    }
}
