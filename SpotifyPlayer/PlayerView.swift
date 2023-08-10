//
//  PlayerView.swift
//  SpotifyPlayer
//
//  Created by Renat Nazyrov


import UIKit

class PlayerView: UIView {
    
    var topAnchorConstraint = NSLayoutConstraint()
    var centerYConstraint = NSLayoutConstraint()
    let buttonHeight: CGFloat = 40
    
    init() {

        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        let trackLabel = makeTrackLabel(withText: "Tom Sawyer")
        let albumLabel = makeAlbumLabel(withText: "Rush • Moving Pictures (2011 Remaster)")

        let playButton = makePlayButton()
        let previewStartLabel = makePreviewLabel(withText: "0:00")
        let previewEndLabel = makePreviewLabel(withText: "0:30")
        let progressView = makeProgressView()

        let spotifyButton = makeSpotifyButton(withText: "PLAY ON SPOTIFY")
        
        addSubview(trackLabel)
        addSubview(albumLabel)
        addSubview(playButton)
        addSubview(previewStartLabel)
        addSubview(progressView)
        addSubview(previewEndLabel)
        addSubview(spotifyButton)
    
        centerYConstraint = progressView.centerYAnchor.constraint(equalTo: centerYAnchor)
        topAnchorConstraint = trackLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        trackLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        trackLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        albumLabel.topAnchor.constraint(equalTo: trackLabel.bottomAnchor, constant: 8).isActive = true
        albumLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        albumLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        playButton.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 8).isActive = true
        playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        previewStartLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        previewStartLabel.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 8).isActive = true
        
        progressView.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: previewStartLabel.trailingAnchor, constant: 8).isActive = true
        
        previewEndLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        previewEndLabel.leadingAnchor.constraint(equalTo: progressView.trailingAnchor, constant: 8).isActive = true
        previewEndLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        spotifyButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spotifyButton.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 32).isActive = true
        spotifyButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 200)
    }
    
    func adjustForOrientiation() {
        if UIDevice.current.orientation.isLandscape {
            topAnchorConstraint.isActive = false
            centerYConstraint.isActive = true
        } else {
            topAnchorConstraint.isActive = true
            centerYConstraint.isActive = false
        }
    }
}
