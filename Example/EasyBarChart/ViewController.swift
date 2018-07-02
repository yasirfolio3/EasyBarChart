//
//  ViewController.swift
//  EasyBarChart
//
//  Created by yasirfolio3 on 07/02/2018.
//  Copyright (c) 2018 yasirfolio3. All rights reserved.
//

import UIKit
import EasyBarChart

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var layout = BarFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.updateFlowLayout()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.updateFlowLayout()
    }
    
    @objc func updateFlowLayout() {

        let width: CGFloat = self.collectionView.frame.size.width
        let height: CGFloat = self.collectionView.frame.size.height
        let cellWidth: CGFloat = (width/5 - 5)
        let cellHeight: CGFloat = height - 5
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView!.collectionViewLayout = layout
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : BarCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BarCollectionViewCell", for: indexPath) as! BarCollectionViewCell
        
        cell.showArrow = (indexPath.row % 2 == 0)
        cell.barValue = 50
        cell.barSize = 50
        cell.backgroundImage = UIImage(named: "paper")
        cell.separatorColor = UIColor.darkGray
        cell.categoryImage = UIImage(named: "fruit")
        cell.categoryName = "NUTRITION"
        cell.themeColor = UIColor.purple
        return cell
    }
    
}


