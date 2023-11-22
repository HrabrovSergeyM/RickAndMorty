//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 21.11.2023.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {

    public let value: String
    public let title: String
    
    init(value: String, title: String) {
        self.value = value
        self.title = title
    }
}
