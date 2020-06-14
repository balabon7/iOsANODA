//
//  HomeViewController.swift
//  ANODA
//
//  Created by mac on 13.06.2020.
//  Copyright © 2020 Aleksandr Balabon. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let data = DataDownloadManager().userData
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(HomePostCell.self, forCellWithReuseIdentifier: cellId)
        
        setupNavigationItems()
        
        for _ in data {
            count += 1
        }
        
    }
    
    func setupNavigationItems(){
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "logo"))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "camera").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "send").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        self.collectionView.showsVerticalScrollIndicator = false
        
        return CGSize(width: view.frame.width, height: view.frame.width + 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomePostCell
        
        cell.photoImageView.image = UIImage(named: data[indexPath.item].post_image ?? "empty_image" )
        cell.userNameLabel.text = data[indexPath.item].user_name ?? ""
        cell.placeNameLabel.text = data[indexPath.item].place_name ?? ""
        cell.profileImageView.image = UIImage(named: data[indexPath.item].profile_image ?? "empty_image" )
        cell.postTimeLabel.text = data[indexPath.item].post_time ?? ""
        return cell
    }
}
