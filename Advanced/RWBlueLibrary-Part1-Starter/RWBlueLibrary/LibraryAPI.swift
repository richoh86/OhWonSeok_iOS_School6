//
//  LibraryAPI.swift
//  RWBlueLibrary
//
//  Created by richard oh on 05/03/2019.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import Foundation

final class LibraryAPI {
  
  private let persistencyManager = PersistencyManager()
  private let httpClient = HTTPClient()
  // isOnline: determines if the server should be updated with any changes made to the albums list, such as added or deleted albums
  private let isOnline = false
  
  // 1. The shared static constant approach gives other objects access to the singleton object LibraryAPI.
  static let shared = LibraryAPI()
  
  // 2. The private initializer prevents creating new instances of LibraryAPI from outside.
  private init(){
    
  }
  
  func getAlbums() -> [Album] {
    return persistencyManager.getAlbums()
  }
  
  func addAlbums(_ album: Album, at index: Int) {
    persistencyManager.addAlbum(album, at: index)
    if isOnline {
      httpClient.postRequest("/api/addAlbum", body: album.description)
    }
  }
  
  func deleteAlbum(at index: Int){
    persistencyManager.deleteAlbum(at: index)
    if isOnline {
      httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
    }
  }
  
}
