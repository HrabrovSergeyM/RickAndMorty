//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 21.11.2023.
//

import UIKit

final class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdenifier = "RMCharacterInfoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setupConstraints() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with vm: RMCharacterInfoCollectionViewCellViewModel) {
        
    }
}
