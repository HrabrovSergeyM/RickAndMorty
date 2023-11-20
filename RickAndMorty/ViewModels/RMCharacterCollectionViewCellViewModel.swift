//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 20.11.2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel {
    let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageUrl: URL?
    
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(comletion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = characterImageUrl else {
            comletion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error == nil else {
                comletion(.failure(error ?? URLError(.badServerResponse)))
                print("RMCharacterCollectionViewCellViewModel, data")
                return
            }
            
            comletion(.success(data))
        }
        task.resume()
    }
}
