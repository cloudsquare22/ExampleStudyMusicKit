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
//        self.example1()
//        self.example2()
//        self.example3()
//        self.example4()
//        self.example5()
        self.example6()
    }
    
    func example1() {
        Task() {
            print("\nExample 1 --------------------")
            let request = MusicCatalogSearchRequest(term: "氷室", types: [Artist.self])
            let response = try await request.response()
            print(response.debugDescription)
            let artists: MusicItemCollection<Artist> = response.artists
            artists.forEach({
                print($0)
            })
        }
    }

    func example2() {
        Task() {
            print("\nExample 2 --------------------")
            var request2 = MusicCatalogSearchRequest(term: "氷室京介", types: [Song.self])
            request2.limit = 25
            let response2 = try await request2.response()
//            print(response2.debugDescription)
            let songs: MusicItemCollection<Song> = response2.songs
            songs.forEach({
                print($0)
            })
        }
    }

    func example3() {
        Task() {
            print("\nExample 3 --------------------")
            var request3 = MusicCatalogSearchRequest(term: "氷室京介", types: [Song.self])
            request3.limit = 100
            let response3 = try await request3.response()
            print(response3.debugDescription)
        }
    }

    func example4() {
        Task() {
            print("\nExample 4 --------------------")
            let request4 = MusicCatalogSearchRequest(term: "氷室京介", types: [])
            let response4 = try await request4.response()
            print(response4.debugDescription)
        }
    }

    func example5() {
        Task() {
            print("\nExample 5 --------------------")
            var request = MusicCatalogSearchRequest(term: "氷室京介", types: [Song.self])
            request.limit = 25
            let response = try await request.response()
            var songs: MusicItemCollection<Song> = response.songs
            songs.forEach({
                print($0)
            })
            
            var countSongs = songs.count
            
            while songs.hasNextBatch == true {
                if let songsNext = try await songs.nextBatch(limit: 25) {
                    songs = songsNext
                    songs.forEach({
                        print($0)
                    })
                    countSongs = countSongs + songs.count
                }
            }
            
            print("Songs count:\(countSongs)")
        }
    }

    func example6() {
        Task() {
            print("\nExample 6 --------------------")
            let request = MusicCatalogSearchRequest(term: "氷室京介", types: [Album.self])
            let response = try await request.response()
            if let album = response.albums.first {
                print("album.tracks:\(album.tracks)")
                let withAlbum = try await album.with([.tracks])
                print("withAlbum.tracks:\(withAlbum.tracks)")
            }
        }
    }
}
