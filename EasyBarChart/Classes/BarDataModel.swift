//
//  BarDataModel.swift
//  Pods
//
//  Created by Yasir Ali on 04/07/2018.
//

import UIKit

public class BarDataModel:NSObject{
    
    public var showArrow: Bool = false
    public var barSize: Int = 0
    public var backgroundImage: UIImage = UIImage()
    public var separatorColor: UIColor = UIColor.red
    public var categoryImage: UIImage = UIImage()
    public var topLabelText: String = ""
    public var topLabelTextColor: UIColor = UIColor.white
    public var topLabelBackgroundColor: UIColor = UIColor.red
    public var topLabelFont: UIFont?
    public var bottomLabelText: String = ""
    public var bottomLabelTextColor: UIColor = UIColor.red
    public var bottomLabelBackgroundColor: UIColor = UIColor.white
    public var bottomLabelFont: UIFont?
    public var barBackgroundColor: UIColor = UIColor.darkGray
}
