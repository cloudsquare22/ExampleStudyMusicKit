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
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
 
        Task {
            print("MusicAuthorization.currentStatus:\(MusicAuthorization.currentStatus)")
            if MusicAuthorization.currentStatus != .authorized {
                let status = await MusicAuthorization.request()
                print("MusicAuthorization.Status:\(status)")
            }
        }

        return true
    }
}
