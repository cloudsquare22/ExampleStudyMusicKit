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
            
            print("\nExample 1 --------------------")
            let request = MusicCatalogSearchRequest(term: "氷室", types: [Artist.self])
            let response = try await request.response()
            print(response.debugDescription)
            let artists: MusicItemCollection<Artist> = response.artists
            artists.forEach({
                print($0)
            })

            print("\nExample 2 --------------------")
            var request2 = MusicCatalogSearchRequest(term: "氷室京介", types: [Song.self])
            request2.limit = 25
            let response2 = try await request2.response()
//            print(response2.debugDescription)
            let songs: MusicItemCollection<Song> = response2.songs
            songs.forEach({
                print($0)
            })

            print("\nExample 3 --------------------")
            var request3 = MusicCatalogSearchRequest(term: "氷室京介", types: [Song.self])
            request3.limit = 100
            let response3 = try await request3.response()
            print(response3.debugDescription)

            print("\nExample 4 --------------------")
            let request4 = MusicCatalogSearchRequest(term: "氷室京介", types: [])
            let response4 = try await request4.response()
            print(response4.debugDescription)
        }
    }
}
