//
//  AuthView.swift
//  swift_FC
//
//  Created by Сергей Недведский on 7.09.25.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack{
            NavigationLink{
                SignInView()
            } label: {
                Text("Sign In with Email")
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
        .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack{
        AuthView()
    }
}
