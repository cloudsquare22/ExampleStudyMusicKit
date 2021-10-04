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
        VStack {
            Text("Hello, MusicKit!")
                .font(.largeTitle)
            HStack {
                Image(systemName: "airpodsmax")
                Image(systemName: "airpodspro")
                Image(systemName: "homepod.and.homepodmini")
                Image(systemName: "beats.powerbeatspro")
            }
            .symbolRenderingMode(.palette)
            .foregroundStyle(.white, .red)
            .font(.largeTitle)
            Button(action: {
                self.music.example()
            }, label: {
                Label("Let's MusicKit!!", systemImage: "music.note")
                    .font(.largeTitle)
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
