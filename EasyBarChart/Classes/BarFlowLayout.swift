//
//  CustomFlowLayout.swift
//  EasyBarChart
//
//  Created by Yasir Ali on 26/06/2018.
//  Copyright © 2018 Yasir Ali. All rights reserved.
//

import UIKit

class BarFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
    }
    
    override func prepare() {
        super.prepare()
        
        self.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 0
        self.scrollDirection = .horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
