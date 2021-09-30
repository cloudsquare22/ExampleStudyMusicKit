//
//  ContentView.swift
//  ExampleStudyMusicKit
//
//  Created by Shin Inaba on 2021/09/29.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var music: Music

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
