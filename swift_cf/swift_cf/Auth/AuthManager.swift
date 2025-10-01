//
//  AuthManager.swift
//  swift_cf
//
//  Created by Сергей Недведский on 29.09.25.
//

import FirebaseAuth
import Foundation

struct AuthDataResultModel {
    let uid: String
    let email: String?
    //    let photoUrl: String?

    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        //        self.photoUrl = user.photoUrl?.absoluteString
    }
}

final class AuthManager {
    static let shared = AuthManager()
    private init() {}

    func getAuthUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResultModel(user: user)
    }

    @discardableResult
    func createUser(email: String, password: String) async throws
        -> AuthDataResultModel
    {
        let authDataResult = try await Auth.auth().createUser(
            withEmail: email,
            password: password
        )
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    @discardableResult
    func signIn(email: String, password: String) async throws
        -> AuthDataResultModel
    {
        let authDataResult = try await Auth.auth().signIn(
            withEmail: email,
            password: password
        )
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func signOut() throws{
        try Auth.auth().signOut()
    }
}
