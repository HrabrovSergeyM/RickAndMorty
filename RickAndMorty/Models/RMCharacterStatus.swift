//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 19.11.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "Unknown"
}
