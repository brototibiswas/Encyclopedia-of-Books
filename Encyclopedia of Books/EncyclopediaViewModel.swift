//
//  BooksViewModel.swift
//  Encyclopedia of Books
//
//  Created by Brototi Biswas on 7/10/23.
//

import Foundation
import Combine

final class EncyclopediaViewModel: ObservableObject {
    
    @Published var books: Books = Books()
    private var cancellables =  Set<AnyCancellable>()
    
    let apiKey = "AIzaSyD_MikXnK0MbiRfklphydVllklo2GKA23I"
    
    init() {
        getBooks(for: "flower")
    }
    
    func getBooks(for searchTerm: String) {
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(searchTerm)&key=\(apiKey)") else {
            print("Invalid url")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data: Data, response: URLResponse) -> Data in
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
        
            .decode(type: Books.self, decoder: JSONDecoder())
        
            .receive(on: DispatchQueue.main)
        
            .sink { completion in
                switch(completion) {
                case .failure(let error) :
                    print("Error fetching books", error.localizedDescription)
                case .finished:
                    print("Success fetching")
                }
            } receiveValue: { [weak self] result in
                self?.books = result
            }
        
            .store(in: &cancellables)

    }
}
