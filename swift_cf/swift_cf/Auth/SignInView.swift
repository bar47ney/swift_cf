//
//  SignInView.swift
//  swift_FC
//
//  Created by Сергей Недведский on 7.09.25.
//

import SwiftUI

final class SignInViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
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
    NavigationStack{
        SignInView()
    }
}
