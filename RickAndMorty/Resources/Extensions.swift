//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 20.11.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
