//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 20.11.2023.
//

import UIKit

final class RMCharacterDetailViewController: UIViewController {
    
    private let vm: RMCharacterDetailViewViewModel

    init(vm: RMCharacterDetailViewViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = vm.title
    }

}
