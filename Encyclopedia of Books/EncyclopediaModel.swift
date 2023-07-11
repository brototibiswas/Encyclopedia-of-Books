//
//  BooksModel.swift
//  Encyclopedia of Books
//
//  Created by Brototi Biswas on 7/10/23.
//

import Foundation

struct Books: Codable {
    var totalItems: Int?
    var items: [Item]?
    
    struct Item: Codable {
        var volumeInfo: VolumeInfo?

        struct VolumeInfo: Codable {
            let title: String?
            let authors: [String]?
            let publisher: String?
            let publishedDate: String?
            let description: String?
            let categories: [String]?
            let imageLinks: Images?

            struct Images: Codable {
                let smallThumbnail: String?
                let thumbnail: String?
            }
        }
    }
}
