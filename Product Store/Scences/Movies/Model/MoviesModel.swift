//
//  MoviesModel.swift
//  Product Store
//
//  Created by Ahmed Elmemy on 20/10/2022.
//

import Foundation

// MARK: - MoviesModel
struct MoviesModel: Codable,CodableInit {
    let status: String?
    let status_message: String?
    let data: Movies?
}

// MARK: - DataClass
struct Movies: Codable {
    let movieCount, limit, page_number: Int?
    let movies: [Movie]?
}

// MARK: - Movie
struct Movie: Codable {
    let id: Int?
    let titleEnglish: String?
    let descriptionFull,largeCoverImage: String?
    let rating:Double?
}

