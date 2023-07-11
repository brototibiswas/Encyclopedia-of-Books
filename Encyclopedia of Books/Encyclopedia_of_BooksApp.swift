//
//  Encyclopedia_of_BooksApp.swift
//  Encyclopedia of Books
//
//  Created by Brototi Biswas on 7/10/23.
//

import SwiftUI

@main
struct Encyclopedia_of_BooksApp: App {
    @StateObject var encyclopediaViewModel = EncyclopediaViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(encyclopediaViewModel)
        }
    }
}
