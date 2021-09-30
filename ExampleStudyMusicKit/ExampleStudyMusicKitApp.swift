//
//  ExampleStudyMusicKitApp.swift
//  ExampleStudyMusicKit
//
//  Created by Shin Inaba on 2021/09/29.
//

import SwiftUI

@main
struct ExampleStudyMusicKitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Music())
        }
    }
}
