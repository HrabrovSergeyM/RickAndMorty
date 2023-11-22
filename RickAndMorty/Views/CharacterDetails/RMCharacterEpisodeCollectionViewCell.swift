//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 21.11.2023.
//

import UIKit

final class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    static let cellIdenifier = "RMCharacterEpisodeCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setupConstraints() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with vm: RMCharacterEpisodeCollectionViewCellViewModel) {
        
    }
}
