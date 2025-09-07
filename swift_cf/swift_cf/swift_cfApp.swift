//
//  swift_cfApp.swift
//  swift_cf
//
//  Created by Сергей Недведский on 7.09.25.
//

import SwiftUI
import Firebase

@main
struct swift_FCApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication
            .LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        print("Firebase Configured")
        return true
    }
}

