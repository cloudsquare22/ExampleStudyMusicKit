//
//  ExampleStudyMusicKitApp.swift
//  ExampleStudyMusicKit
//
//  Created by Shin Inaba on 2021/09/29.
//

import SwiftUI
import MusicKit

@main
struct ExampleStudyMusicKitApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Music())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    /// Opens a URL using the appropriate system service.
    @Environment(\.openURL) private var openURL
    
    var status = MusicAuthorization.Status.notDetermined

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        self.status = MusicAuthorization.currentStatus
        print("MusicAuthorization.Status:\(status)")
        switch status {
        case .notDetermined:
            Task {
                let status = await MusicAuthorization.request()
                self.status = status
            }
        case .denied:
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                openURL(settingsURL)
            }
        case .restricted:
            print("No request!!")
        case .authorized:
            print("Authorized!!")
        @unknown default:
            print("Future status!!")
        }
        print("MusicAuthorization.Status:\(self.status)")

        return true
    }
}
