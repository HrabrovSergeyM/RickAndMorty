//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 22.11.2023.
//

import UIKit

final class RMEpisodeDetailViewController: UIViewController {
    
    private let detailView = RMEpisodeDetailView()
    
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
        view.addSubview(detailView)
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        title = "Episode"
    }
}
