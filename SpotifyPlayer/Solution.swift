//
//  Solution.swift
//  SpotifyPlayer
//
//  Created by Renat Nazyrov
//

import UIKit

class Solution: UIViewController {

    var stackView: UIStackView
    var playerView: PlayerView
    
    init() {
        stackView = makeStackView(withOrientation: .vertical)
        playerView = PlayerView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForOrientationChanges()
        setupViews()
    }
    func registerForOrientationChanges() {
        NotificationCenter.default.addObserver(self, selector: #selector(Solution.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    func setupViews() {
        let albumImage = makeImageView(named: "rush")
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)

        stackView.addArrangedSubview(albumImage)
        stackView.addArrangedSubview(playerView)
        view.addSubview(stackView)
        
        albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
        playerView.adjustForOrientiation()
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

