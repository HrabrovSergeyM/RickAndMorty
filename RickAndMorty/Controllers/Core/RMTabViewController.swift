//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 19.11.2023.
//

import UIKit

final class RMTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let characterVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let episodeVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        for vc in [characterVC, locationVC, episodeVC, settingsVC] {
            vc.navigationItem.largeTitleDisplayMode = .automatic
        }
        
//        characterVC.navigationItem.largeTitleDisplayMode = .automatic
//        locationVC.navigationItem.largeTitleDisplayMode = .automatic
//        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
//        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let navCharacter = UINavigationController(rootViewController: characterVC)
        let navLocation = UINavigationController(rootViewController: locationVC)
        let navEpisode = UINavigationController(rootViewController: episodeVC)
        let navSettings = UINavigationController(rootViewController: settingsVC)
        
        navCharacter.tabBarItem = UITabBarItem(title: "Characters",
                                               image: UIImage(systemName: "person"),
                                               tag: 1)
        navLocation.tabBarItem = UITabBarItem(title: "Locations",
                                               image: UIImage(systemName: "globe"),
                                               tag: 2)
        navEpisode.tabBarItem = UITabBarItem(title: "Episodes",
                                               image: UIImage(systemName: "tv"),
                                               tag: 3)
        navSettings.tabBarItem = UITabBarItem(title: "Settings",
                                               image: UIImage(systemName: "gear"),
                                               tag: 4)
        
        for nav in [navCharacter, navLocation, navEpisode, navSettings] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers(
            [navCharacter, navLocation, navEpisode, navSettings],
            animated: true
        )
    }
    
}

