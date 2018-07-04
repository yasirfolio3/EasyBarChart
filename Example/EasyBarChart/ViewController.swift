//
//  ViewController.swift
//  EasyBarChart
//
//  Created by yasirfolio3 on 07/02/2018.
//  Copyright (c) 2018 yasirfolio3. All rights reserved.
//

import UIKit
import EasyBarChart

class ViewController: UIViewController,UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var items = [BarDataModel]()
    var barDataSource: BarDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.populateTemporaryItems()
        barDataSource = BarDataSource(items: items, cellIdentifier: "cell", collectionView: collectionView, cellHeightToWidthRatio: 5)
        collectionView.dataSource = barDataSource
        collectionView.reloadData()
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        barDataSource.recalculateCellSizes()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        barDataSource.recalculateCellSizes()
    }
    
    func populateTemporaryItems() {
        for n in 0...20{
            let barModel = BarDataModel()
            barModel.showArrow = (n % 2 == 0)
            barModel.barSize = 50
            barModel.backgroundImage = UIImage(named: "paper")!
            barModel.separatorColor = UIColor.red
            barModel.categoryImage = UIImage(named: "png")!
            barModel.topLabelText = "50"
            barModel.topLabelTextColor = UIColor.white
            barModel.topLabelBackgroundColor = UIColor.red
            barModel.bottomLabelText = "Title"
            
            self.items.append(barModel)
        }
    }
}


