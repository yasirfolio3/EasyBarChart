//
//  CustomFlowLayout.swift
//  EasyBarChart
//
//  Created by Yasir Ali on 26/06/2018.
//  Copyright © 2018 Yasir Ali. All rights reserved.
//

import UIKit

public class BarFlowLayout: UICollectionViewFlowLayout {
    
    public override init() {
        super.init()
    }
    
    public override func prepare() {
        super.prepare()
        
        self.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 0
        self.scrollDirection = .horizontal
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
