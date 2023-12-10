//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 06.12.2023.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable, Hashable {
    let id = UUID()
    
    public var image: UIImage? {
        return type.iconImage
    }
    public var title: String {
        return type.displayTitle
    }
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
    private let type: RMSettingsOption
    
    init(type: RMSettingsOption) {
        self.type = type
    }
}
