//
//  BarDataSource.swift
//  Pods
//
//  Created by Yasir Ali on 04/07/2018.
//

import UIKit

public class BarDataSource: NSObject, UICollectionViewDataSource {
    
    private var items = [BarDataModel]()
    private var itemIdentifier: String = ""
    private var cellHeightToWidthRatio: Int = 5
    private var layout = BarFlowLayout()
    private var collectionView: UICollectionView?
    
    private override init() {
        super.init()
    }
    
    public init(items:[BarDataModel], cellIdentifier: String, collectionView: UICollectionView, cellHeightToWidthRatio:Int) {
        super.init()
        
        self.items = items
        self.itemIdentifier = cellIdentifier
        self.cellHeightToWidthRatio = cellHeightToWidthRatio
        self.collectionView = collectionView
    }
    
    public func setItems(items: [BarDataModel]){
        self.items = items
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.itemIdentifier, for: indexPath as IndexPath) as! BarCollectionViewCell
        cell.dataModel = self.items[indexPath.row]
        return cell
    }
    
    public func recalculateCellSizes() {
        
        if let _collectionView = collectionView{
            let width: CGFloat = _collectionView.frame.size.width
            let height: CGFloat = _collectionView.frame.size.height
            let cellWidth: CGFloat = (width/5 - 5)
            let cellHeight: CGFloat = height - 5
            
            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
            _collectionView.collectionViewLayout = layout
            _collectionView.reloadData()
        }
    }
}
