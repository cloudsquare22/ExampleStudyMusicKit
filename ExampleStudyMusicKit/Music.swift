//
//  Music.swift
//  ExampleStudyMusicKit
//
//  Created by Shin Inaba on 2021/09/29.
//

import Foundation

import SwiftUI
import MusicKit

class Music: ObservableObject {
    var status: MusicAuthorization.Status = MusicAuthorization.Status.notDetermined

    init() {
//        print(#function + " - MusicAuthorization.Status:\(self.status)")
        Task() {
//            await self.authotizationRequest()
        }
    }

    func authotizationRequest() async {
        self.status = await MusicAuthorization.request()
        print(#function + " - MusicAuthorization.Status:\(self.status)")
    }
    
    func example() {
        Task() {
            let request = MusicCatalogSearchRequest(term: "氷室", types: [Artist.self])
            let response = try await request.response()
            print(response.debugDescription)
            let artists: MusicItemCollection<Artist> = response.artists
            artists.forEach({
                print($0)
            })
        }
    }
}
