//
//  BarCollectionViewCell.swift
//  EasyBarChart
//
//  Created by Yasir Ali on 25/06/2018.
//  Copyright © 2018 Yasir Ali. All rights reserved.
//

import UIKit

class BarCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Private Properties
    private var mainContentView: UIView!
    private var topView: UIView!
    private var mainBarView: UIView!
    private var barHeightConstraint : NSLayoutConstraint?
    private var barValueLabel: CircularLabel!
    private var barView: RoundedTopView!
    private var barCircularSwitchView: CircleBackgroundView!
    private var topArrowImageView : UIImageView!
    private var backgroundImageView: UIImageView!
    private var separatorView: UIView!
    private var bottomView: UIView!
    private var categoryLbl: UILabel!
    private var categoryImageView: UIImageView!
    private let barHeightRange = 0..<101
    
    //MARK:- Exposed Properties
    var backgroundImage : UIImage? {
        didSet{
            if let image = backgroundImage{
                backgroundImageView.image = image
            }
        }
    }
    
    var themeColor: UIColor = UIColor.purple {
        didSet{
            barView.backgroundColor = themeColor
            categoryLbl.textColor = themeColor
            barValueLabel.backgroundColor = themeColor
        }
    }
    
    var separatorColor: UIColor = UIColor.purple {
        didSet{
            separatorView.backgroundColor = separatorColor
        }
    }
    
    //Min Value:- 0
    //Max Value:- 100
    var barSize : Int = 0 {
        didSet{
            if(barHeightRange.contains(barSize)){
                self.updateUIForValue(value: barSize)
            }
        }
    }
    
    var barValue : Int = 0 {
        didSet{
            self.barValueLabel.text = "\(barValue)"
        }
    }
    
    var categoryName : String = "" {
        didSet{
            self.categoryLbl.text = categoryName
        }
    }
    
    var categoryImage : UIImage? {
        didSet{
            if let image = categoryImage{
                categoryImageView.image = image
            }
        }
    }
    
    var showArrow: Bool = false{
        didSet{
            topArrowImageView.isHidden = !showArrow
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initializeUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateUIForValue(value: barSize)
    }
    
    private func initializeUI() {
        
        mainContentView = UIView.init()
        mainContentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(mainContentView!)
        
        mainContentView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        mainContentView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        mainContentView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        mainContentView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
        
        self.setupBottomView()
        self.setupTopView()
        self.contentView.layoutIfNeeded()
    }
    
    private func setupTopView() {
        self.contentView.layoutIfNeeded()
        
        if(topView == nil){
            topView = UIView.init()
            topView.translatesAutoresizingMaskIntoConstraints = false
            self.mainContentView.addSubview(topView!)
            
            topView.topAnchor.constraint(equalTo: self.mainContentView.topAnchor, constant: 0).isActive = true
            topView.widthAnchor.constraint(equalTo: self.mainContentView.widthAnchor, multiplier: 0.75).isActive = true
            topView.trailingAnchor.constraint(equalTo: self.mainContentView.trailingAnchor, constant: 0).isActive = true
            
            let bottomConstraint: NSLayoutConstraint = topView.bottomAnchor.constraint(equalTo: self.separatorView.topAnchor, constant: 0)
            bottomConstraint.priority = UILayoutPriority(rawValue: 999)
            bottomConstraint.isActive = true
        }
        
        if(backgroundImageView == nil){
            backgroundImageView = UIImageView.init()
            backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
            topView.addSubview(backgroundImageView)
            
            backgroundImageView.contentMode = .scaleAspectFill
            topView.clipsToBounds = true
            
            backgroundImageView.trailingAnchor.constraint(equalTo: self.topView.trailingAnchor, constant: 0).isActive = true
            backgroundImageView.leadingAnchor.constraint(equalTo: self.topView.leadingAnchor, constant: 0).isActive = true
            backgroundImageView.topAnchor.constraint(equalTo: self.topView.topAnchor, constant: 0).isActive = true
            backgroundImageView.heightAnchor.constraint(equalTo: self.topView.heightAnchor, multiplier: 1, constant: 0).isActive = true
        }
        
        if(mainBarView == nil){
            mainBarView = UIView.init()
            mainBarView.translatesAutoresizingMaskIntoConstraints = false
            self.topView.addSubview(mainBarView!)
            
            barHeightConstraint = mainBarView.heightAnchor.constraint(equalToConstant: 100)
            barHeightConstraint?.isActive = true
            
            mainBarView.bottomAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: 0).isActive = true
            mainBarView.widthAnchor.constraint(equalTo: self.topView.widthAnchor, multiplier: 0.5).isActive = true
            mainBarView.centerXAnchor.constraint(equalTo: self.topView.centerXAnchor, constant: 0).isActive = true
        }
        
        if(barValueLabel == nil){
            barValueLabel = CircularLabel.init()
            barValueLabel.translatesAutoresizingMaskIntoConstraints = false
            self.mainBarView.addSubview(barValueLabel!)
            
            barValueLabel.backgroundColor = themeColor
            barValueLabel.font = UIFont.boldSystemFont(ofSize: 15)
            barValueLabel.minimumScaleFactor = 0.5
            barValueLabel.adjustsFontSizeToFitWidth = true
            barValueLabel.textAlignment = .center
            barValueLabel.textColor = UIColor.white
            
            barValueLabel.topAnchor.constraint(equalTo: mainBarView.topAnchor, constant: 5).isActive = true
            barValueLabel.centerXAnchor.constraint(equalTo: mainBarView.centerXAnchor).isActive = true
            barValueLabel.heightAnchor.constraint(equalTo: barValueLabel.widthAnchor, constant: 0).isActive = true
        }
        
        if(barView == nil){
            barView = RoundedTopView.init()
            barView.translatesAutoresizingMaskIntoConstraints = false
            self.mainBarView.addSubview(barView!)
            
            barView.backgroundColor = themeColor
            barView.leadingAnchor.constraint(equalTo: mainBarView.leadingAnchor, constant: 0).isActive = true
            barView.trailingAnchor.constraint(equalTo: mainBarView.trailingAnchor, constant: 0).isActive = true
            barView.bottomAnchor.constraint(equalTo: mainBarView.bottomAnchor, constant: 0).isActive = true
            
            let topConstraint: NSLayoutConstraint = barView.topAnchor.constraint(equalTo: barValueLabel.bottomAnchor, constant: 10)
            topConstraint.priority = UILayoutPriority(rawValue: 999)
            topConstraint.isActive = true
        }
        
        if(barCircularSwitchView == nil){
            barCircularSwitchView = CircleBackgroundView.init()
            barCircularSwitchView.translatesAutoresizingMaskIntoConstraints = false
            self.barView.addSubview(barCircularSwitchView!)
            
            barCircularSwitchView.backgroundColor = UIColor.white
            
            barCircularSwitchView.topAnchor.constraint(equalTo: barView.topAnchor, constant: 8).isActive = true
            barCircularSwitchView.centerXAnchor.constraint(equalTo: self.barView.centerXAnchor, constant: 0).isActive = true
            barCircularSwitchView.widthAnchor.constraint(equalTo: barView.widthAnchor, multiplier: 0.5).isActive = true
            barCircularSwitchView.heightAnchor.constraint(equalTo: barCircularSwitchView.widthAnchor, constant: 0).isActive = true
        }
        
        if(topArrowImageView == nil){
            topArrowImageView = UIImageView.init()
            topArrowImageView.translatesAutoresizingMaskIntoConstraints = false
            self.barView.addSubview(topArrowImageView)
            
            topArrowImageView.contentMode = .scaleAspectFit
            topArrowImageView.clipsToBounds = true
            topArrowImageView.image = UIImage(named: "toparrow")
            topArrowImageView.isHidden = true
            
            topArrowImageView.topAnchor.constraint(equalTo: self.barCircularSwitchView.bottomAnchor, constant: 10).isActive = true
            topArrowImageView.centerXAnchor.constraint(equalTo: self.barCircularSwitchView.centerXAnchor, constant: 0).isActive = true
            topArrowImageView.widthAnchor.constraint(equalTo: barCircularSwitchView.widthAnchor, multiplier: 1).isActive = true
            topArrowImageView.heightAnchor.constraint(equalTo: barCircularSwitchView.heightAnchor, multiplier: 1).isActive = true
        }
    }
    
    private func setupBottomView() {
        self.contentView.layoutIfNeeded()
        
        if(bottomView == nil){
            bottomView = UIView.init()
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            self.mainContentView.addSubview(bottomView!)
            
            bottomView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            bottomView.widthAnchor.constraint(equalTo: self.mainContentView.widthAnchor, multiplier: 0.75).isActive = true
            bottomView.bottomAnchor.constraint(equalTo: self.mainContentView.bottomAnchor, constant: 0).isActive = true
            bottomView.trailingAnchor.constraint(equalTo: self.mainContentView.trailingAnchor, constant: 0).isActive = true
        }
        
        if(categoryImageView == nil){
            categoryImageView = UIImageView.init()
            categoryImageView.translatesAutoresizingMaskIntoConstraints = false
            bottomView.addSubview(categoryImageView)
            
            categoryImageView.contentMode = .scaleAspectFit
            categoryImageView.clipsToBounds = true
            categoryImageView.heightAnchor.constraint(equalTo: self.bottomView.heightAnchor, multiplier: 0.5).isActive = true
            categoryImageView.widthAnchor.constraint(equalTo: self.categoryImageView.widthAnchor, multiplier: 1.0).isActive = true
            categoryImageView.topAnchor.constraint(equalTo: self.bottomView.topAnchor, constant: 5).isActive = true
            categoryImageView.centerXAnchor.constraint(equalTo: self.bottomView.centerXAnchor, constant: 0).isActive = true
        }
        
        if(categoryLbl == nil){
            categoryLbl = UILabel.init()
            categoryLbl.translatesAutoresizingMaskIntoConstraints = false
            bottomView.addSubview(categoryLbl)
            
            categoryLbl.font = UIFont.systemFont(ofSize: 10)
            categoryLbl.minimumScaleFactor = 0.5
            categoryLbl.adjustsFontSizeToFitWidth = true
            categoryLbl.textAlignment = .center
            categoryLbl.textColor = themeColor
            
            categoryLbl.topAnchor.constraint(equalTo: self.categoryImageView.bottomAnchor, constant: 0).isActive = true
            categoryLbl.leadingAnchor.constraint(equalTo: self.bottomView.leadingAnchor, constant: 0).isActive = true
            categoryLbl.trailingAnchor.constraint(equalTo: self.bottomView.trailingAnchor, constant: 0).isActive = true
            categoryLbl.bottomAnchor.constraint(equalTo: self.bottomView.bottomAnchor, constant: 0).isActive = true
        }
        
        if(separatorView == nil){
            separatorView = UIView.init()
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            self.mainContentView.addSubview(separatorView!)
            
            separatorView.bottomAnchor.constraint(equalTo: self.bottomView.topAnchor, constant: 0).isActive = true
            separatorView.heightAnchor.constraint(equalToConstant: 5).isActive = true
            separatorView.trailingAnchor.constraint(equalTo: self.mainContentView.trailingAnchor, constant: 0).isActive = true
            separatorView.leadingAnchor.constraint(equalTo: self.mainContentView.leadingAnchor, constant: 0).isActive = true
        }
    }
    
    private func updateUIForValue(value:Int){
        self.contentView.layoutIfNeeded()
        
        let minimumHeight = Int(33 + barCircularSwitchView.bounds.height + barValueLabel.bounds.height + topArrowImageView.bounds.height)
        let maxBarHeight = topView.frame.size.height - CGFloat(minimumHeight)
        
        let newHeight = Int(maxBarHeight * CGFloat(value)/CGFloat(100)) + minimumHeight
        weak var weakSelf = self
        UIView.animate(withDuration: 0.5) {
            weakSelf?.barHeightConstraint?.constant = CGFloat(newHeight)
        }
    }
}

extension UIView{
    
    func setRounded() {
        layer.cornerRadius = bounds.size.width / 2
        layer.masksToBounds = true
    }
    
    func setRoundedTopCorners() {
        if #available(iOS 11.0, *) {
            self.clipsToBounds = true
            layer.cornerRadius = bounds.size.width / 2
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            self.clipsToBounds = true
            let path = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: [.topRight, .topLeft],
                                    cornerRadii: CGSize(width: bounds.size.width / 2, height: bounds.size.width / 2))
            
            let maskLayer = CAShapeLayer()
            
            maskLayer.path = path.cgPath
            layer.mask = maskLayer
        }
    }
}

class CircleBackgroundView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setRounded()
    }
}

class RoundedTopView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setRoundedTopCorners()
    }
}

class CircularLabel: UILabel {
    
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 5.0
    @IBInspectable var rightInset: CGFloat = 5.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setRounded()
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }
}
