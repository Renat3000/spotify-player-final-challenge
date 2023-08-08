//
//  PlayerView.swift
//  SpotifyPlayer
//
//  Created by Renat Nazyrov


import UIKit

class PlayerView: UIView {
    
    var stackView: UIStackView
    var topAnchorConstraint = NSLayoutConstraint()
    var centerYConstraint = NSLayoutConstraint()
    
    init() {
        stackView = makeStackView(withOrientation: .vertical)
        stackView.distribution = .fillProportionally

        super.init(frame: .zero)

        setupViews()
        setupInitialOrientation()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
    func setupInitialOrientation() {

    }
    
}
