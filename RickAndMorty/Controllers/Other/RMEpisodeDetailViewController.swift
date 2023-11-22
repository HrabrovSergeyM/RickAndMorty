//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 22.11.2023.
//

import UIKit

final class RMEpisodeDetailViewController: UIViewController {
    
    private let vm: RMEpisodeDetailViewViewModel

    init(url: URL?) {
        self.vm = .init(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
    }
}
