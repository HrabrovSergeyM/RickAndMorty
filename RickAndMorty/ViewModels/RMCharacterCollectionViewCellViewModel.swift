//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 20.11.2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel: Hashable, Equatable {
   
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
        RMImageLoader.shared.downloadImage(url, completion: comletion)
    }
    
    // MARK: - Hashable
    
    static func == (lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageUrl)
    }
    
}
