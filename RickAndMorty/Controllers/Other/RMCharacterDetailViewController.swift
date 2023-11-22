//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 20.11.2023.
//

import UIKit

final class RMCharacterDetailViewController: UIViewController {
    
    private let vm: RMCharacterDetailViewViewModel
    
    private let detailView: RMCharacterDetailView
    
    init(vm: RMCharacterDetailViewViewModel) {
        self.vm = vm
        self.detailView = RMCharacterDetailView(frame: .zero, vm: vm)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = vm.title
        view.addSubview(detailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(didTapShare))
        addConstraints()
        
        detailView.collectionView?.delegate = self
        detailView.collectionView?.dataSource = self
    }
    
    @objc
    private func didTapShare() {
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

// MARK: - CollectionView

extension RMCharacterDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return vm.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = vm.sections[section]
        
        switch sectionType {
        case .photo:
            return 1
        case .information(let vm):
            return vm.count
        case .episodes(let vm):
            return vm.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = vm.sections[indexPath.section]
        
        switch sectionType {
        case .photo(let vm):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RMCharacterPhotoCollectionViewCell.cellIdenifier,
                for: indexPath) as? RMCharacterPhotoCollectionViewCell else {
                fatalError()
            }
            cell.configure(with: vm)
            
            return cell
        case .information(let vm):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RMCharacterInfoCollectionViewCell.cellIdenifier,
                for: indexPath) as? RMCharacterInfoCollectionViewCell else {
                fatalError()
            }
            cell.configure(with: vm[indexPath.row])
            
            return cell
        case .episodes(let vm):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RMCharacterEpisodeCollectionViewCell.cellIdentifier,
                for: indexPath) as? RMCharacterEpisodeCollectionViewCell else {
                fatalError()
            }
            cell.configure(with: vm[indexPath.row])
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionType = vm.sections[indexPath.section]
        
        switch sectionType {
        case .photo, .information:
            break
        case .episodes:
            let episodes = self.vm.episodes
            let selection = episodes[indexPath.row]
            let vc = RMEpisodeDetailViewController(url: URL(string: selection))
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
