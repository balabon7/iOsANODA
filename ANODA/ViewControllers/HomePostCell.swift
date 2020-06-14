//
//  HomePostCell.swift
//  ANODA
//
//  Created by mac on 13.06.2020.
//  Copyright © 2020 Aleksandr Balabon. All rights reserved.
//

import UIKit
import SnapKit

class HomePostCell: UICollectionViewCell {
    
     private(set) var top = 0
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40 / 2
        image.clipsToBounds = true
        return image
    }()
    
    let imageSegmentIndicatorLabel: UILabel = {
        let label = UILabel ()
        let attributedText = NSMutableAttributedString(string: "•", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemBlue, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
        
        attributedText.append(NSAttributedString(string: "•", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]))
        label.attributedText = attributedText
        
        return label
    }()
    
    let photoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel ()
        label.font = .boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    let placeNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        
        return label
    }()
    
    let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("•••", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage( #imageLiteral(resourceName: "heart_unselected").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage( #imageLiteral(resourceName: "comment").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage( #imageLiteral(resourceName: "send").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "bookmark").withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    let taggedLike: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Liked by", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)])
        
        let attributedStringFontColor = [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
        
        attributedText.append(NSAttributedString(string: " milena_trump, lenka_taranets_tensnailkitchen", attributes: attributedStringFontColor))
        
        attributedText.append(NSAttributedString(string: " and", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]))
        
        attributedText.append(NSAttributedString(string: " 94 others", attributes: attributedStringFontColor))
        
        label.attributedText = attributedText
        label.numberOfLines = 0
        
        return label
    }()
    
    
    let captionLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "milena_thebrowbar", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)])
        
        attributedText.append(NSAttributedString(string: " Beauty", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)] ))
        
        let attributedStringFontColor = [NSAttributedString.Key.foregroundColor : UIColor(red: 0.0/255.0, green: 55.0/255.0, blue: 107.0/255.0, alpha:1.0), NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]
        
        attributedText.append(NSAttributedString(string: " @anna_zavadskaya 💙🌍💫 @covernumberone #thebrowbarkharkov  #makeup  #inlove #thebrowbarkharkov", attributes: attributedStringFontColor))
        
        label.attributedText = attributedText
        label.numberOfLines = 0
        
        return label
    }()
    
    let postTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        addSubview(userNameLabel)
        addSubview(placeNameLabel)
        addSubview(optionsButton)
        addSubview(photoImageView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(sendButton)
        addSubview(imageSegmentIndicatorLabel)
        addSubview(bookmarkButton)
        addSubview(taggedLike)
        addSubview(captionLabel)
        addSubview(postTimeLabel)
        
        
        //choose AutoLayout
        runSnapKitAutoLayout()
        // or
        //runStandardAutoLayout()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SnapKit AutoLayout
extension HomePostCell {
    
    fileprivate func runSnapKitAutoLayout() {
        
        //Profile image
        setupSnpNameLabels(topAmount: 8, leftAmount: 8, widthAmount: 40, heightAmount: 40)
    
        //Username And Place Name
        setupSnpNameLabels()
        
        
        //OptionsButton
        optionsButton.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.right.equalTo(contentView.snp.right).offset(-8)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        //Photo image
        photoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.bottom).offset(8)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.height.equalTo(contentView.snp.width)
            
        }
        //Action buttons
        setupSnpActionButtons()
        
        //Segment Indicator
        imageSegmentIndicatorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(photoImageView.snp.bottom).offset(8)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        //Bookmark button
        bookmarkButton.snp.makeConstraints { (make) in
            make.top.equalTo(photoImageView.snp.bottom)
            make.right.equalTo(contentView.snp.right).offset(-8)
            make.width.equalTo(30)
            make.height.equalTo(40)
        }
        
        //TaggedLike
        taggedLike.snp.makeConstraints { (make) in
            make.top.equalTo(likeButton.snp.bottom)
            make.left.equalTo(contentView.snp.left).offset(12)
            make.height.equalTo(35)
            make.trailing.equalTo(contentView.snp.trailing).offset(-12)
            
        }
        
        //Caption
        captionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(taggedLike.snp.bottom)
            make.left.equalTo(contentView.snp.left).offset(12)
            make.height.equalTo(55)
            make.trailing.equalTo(contentView.snp.trailing).offset(-12)
        }
        
        //Post Time
        postTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(captionLabel.snp.bottom).offset(4)
            make.left.equalTo(contentView.snp.left).offset(12)
            make.height.equalTo(10)
            make.trailing.equalTo(contentView.snp.trailing).offset(-12)
            
        }
    }
    
    public func setupSnpNameLabels(topAmount: Int, leftAmount: Int, widthAmount: Int, heightAmount: Int){
        
        profileImageView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(topAmount)
            make.left.equalTo(contentView.snp.left).offset(leftAmount)
            make.width.equalTo(widthAmount)
            make.height.equalTo(heightAmount)
        }

        self.top = topAmount
    }
    
    fileprivate func setupSnpNameLabels() {
        let stackView = UIStackView(arrangedSubviews: [userNameLabel, placeNameLabel])
        stackView.distribution = .fillEqually
        
        stackView.axis = .vertical
        addSubview(stackView)
        
        stackView.snp.makeConstraints { (make) in
            stackView.translatesAutoresizingMaskIntoConstraints = false
            make.top.equalTo(contentView.snp.top).offset(8)
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.trailing.equalTo(optionsButton.snp.leading)
            make.height.equalTo(40)
        }
    }
    
    fileprivate func setupSnpActionButtons(){
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, sendButton])
        stackView.distribution = .fillEqually
        addSubview(stackView)
 
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(photoImageView.snp.bottom)
            make.left.equalTo(contentView.snp.left).offset(4)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }
    
}

// MARK: - Standard AutoLayout
extension HomePostCell {
    
    fileprivate func runStandardAutoLayout() {
        
        //Profile image
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //Name User and Place
        setupNameLabels()
        
        //OptionsButton
        optionsButton.translatesAutoresizingMaskIntoConstraints = false
        optionsButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        optionsButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        optionsButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        optionsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //Photo
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        photoImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        //Actions
        setupActionButtons()
        
        //Segment Indicator
        imageSegmentIndicatorLabel.translatesAutoresizingMaskIntoConstraints = false
        imageSegmentIndicatorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageSegmentIndicatorLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant:  8).isActive = true
        imageSegmentIndicatorLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageSegmentIndicatorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //Bookmark
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        bookmarkButton.topAnchor.constraint(equalTo: photoImageView.bottomAnchor).isActive = true
        bookmarkButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        bookmarkButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        bookmarkButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //TaggedLike
        taggedLike.translatesAutoresizingMaskIntoConstraints = false
        taggedLike.topAnchor.constraint(equalTo: likeButton.bottomAnchor).isActive = true
        taggedLike.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        taggedLike.heightAnchor.constraint(equalToConstant: 35).isActive = true
        taggedLike.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
        //Caption
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.topAnchor.constraint(equalTo: taggedLike.bottomAnchor).isActive = true
        captionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        captionLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        captionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
        //Post Time
        postTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        postTimeLabel.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: 4).isActive = true
        postTimeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        postTimeLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        postTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    fileprivate func setupNameLabels() {
        let stackView = UIStackView(arrangedSubviews: [userNameLabel, placeNameLabel])
        stackView.distribution = .fillEqually
        
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stackView.trailingAnchor.constraint(equalTo: optionsButton.leadingAnchor).isActive = true
    }
    
    fileprivate func setupActionButtons(){
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, sendButton])
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
