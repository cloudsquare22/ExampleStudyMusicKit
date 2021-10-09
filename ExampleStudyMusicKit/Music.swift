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
//        self.example6()
        self.example7()
        self.example8()
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
            print(response.debugDescription)
//            print(response)
            if let album = response.albums.first {
                print("album:\(album)")
                print(album.appearsOn)
                print(album.artistName)
                print(album.artistURL)
                print(album.artwork)
                print(album.contentRating)
                print(album.copyright)
                print(album.debugDescription)
                print(album.description)
                print(album.editorialNotes)
                print(album.genreNames)
                print(album.genres)
                print(album.hashValue)
                print(album.id)
                print(album.isCompilation)
                print(album.isComplete)
                print(album.isSingle)
                print(album.otherVersions)
                print(album.playParameters)
                print(album.recordLabelName)
                print(album.recordLabels)
                print(album.relatedAlbums)
                print(album.relatedVideos)
                print(album.releaseDate)
                print(album.title)
                print(album.trackCount)
                print(album.tracks)
                print(album.upc)
                print(album.url)

//                print("album.tracks:\(album.tracks)")
//                let withAlbum = try await album.with([.tracks])
//                print("withAlbum.tracks:\(withAlbum.tracks)")
            }
        }
    }
    
    func example7() {
        Task() {
            print("\nExample 7 --------------------")
            let request = MusicCatalogSearchRequest(term: "布袋寅泰", types: [Artist.self])
            print(request.term.debugDescription)
            let response = try await request.response()
            if let artist = response.artists.first {
//                print(artist.albums)
//                print(artist.fullAlbums)
                let withArtist = try await artist.with([.albums, .fullAlbums, .liveAlbums, .singles, .playlists])
                print("albums")
                print(withArtist.albums?.count)
                print(withArtist.albums?.hasNextBatch)
//                withArtist.albums!.forEach({
//                    print($0)
//                })
                print("fullAlbums")
                print(withArtist.fullAlbums?.count)
                print(withArtist.fullAlbums?.hasNextBatch)
//                withArtist.fullAlbums!.forEach({
//                    print($0)
//                })
//                if let fullAlbumsNext = try await withArtist.fullAlbums!.nextBatch(limit: 25) {
//                    print(fullAlbumsNext.count)
//                    print(fullAlbumsNext.hasNextBatch)
//                    fullAlbumsNext.forEach({
//                        print($0)
//                    })
//                }
                print("liveAlbums")
                print(withArtist.liveAlbums?.count)
                print(withArtist.liveAlbums?.hasNextBatch)
//                withArtist.liveAlbums!.forEach({
//                    print($0)
//                })
                print("singles")
                print(withArtist.singles?.count)
                print(withArtist.singles?.hasNextBatch)
//                withArtist.singles!.forEach({
//                    print($0)
//                })
                print("playlists")
                print(withArtist.playlists?.count)
                print(withArtist.playlists?.hasNextBatch)
//                withArtist.playlists!.forEach({
//                    print($0)
//                })
            }
        }
    }

    func example8() {
        Task() {
            print("\nExample 8 --------------------")
            let request = MusicCatalogSearchRequest(term: "氷室京介", types: [Artist.self])
            print(request.term.debugDescription)
            let response = try await request.response()
            if let artist = response.artists.first {
                print("artist:\(artist.fullAlbums?.count)")
                let withArtist = try await artist.with([.fullAlbums])
                print("withArtist: \(withArtist.fullAlbums?.count)")
            }
        }
    }
        
}
