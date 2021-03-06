//
//  FTPopOverMenuCell.swift
//  FTPopOverMenu_Swift
//
//  Created by Abdullah Selek on 28/07/2017.
//  Copyright © 2016 LiuFengting (https://github.com/liufengting) . All rights reserved.
//

import UIKit

class FTPopOverMenuCell: UITableViewCell {

    fileprivate lazy var configuration : FTConfiguration = {
        return FTConfiguration.shared
    }()

    fileprivate lazy var iconImageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        self.contentView.addSubview(imageView)
        return imageView
    }()

    fileprivate lazy var nameLabel : UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = UIColor.clear
        self.contentView.addSubview(label)
        return label
    }()

    func setupCellWith(menuName: String, menuImage: AnyObject?) {
        self.backgroundColor = UIColor.clear
        
        // Configure cell text
        nameLabel.font = configuration.textFont
        nameLabel.textColor = configuration.textColor
        nameLabel.textAlignment = configuration.textAlignment
        nameLabel.text = menuName
        nameLabel.frame = CGRect(x: FT.DefaultCellMargin, y: 0, width: configuration.menuWidth - FT.DefaultCellMargin*2, height: configuration.menuRowHeight)
        
        // Configure cell icon if available
        var iconImage: AnyObject? = nil
        if let menuImage = menuImage {
            if menuImage is String {
                iconImage = UIImage(named: menuImage as! String)
            } else {
                if menuImage is UIImage {
                    iconImage = menuImage
                }
            }
            if iconImage != nil {
                if  configuration.ignoreImageOriginalColor {
                    iconImage = iconImage?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
                }
                iconImageView.tintColor = configuration.textColor
                iconImageView.frame =  CGRect(x: FT.DefaultCellMargin, y: (configuration.menuRowHeight - configuration.menuIconSize)/2, width: configuration.menuIconSize, height: configuration.menuIconSize)
                iconImageView.image = iconImage as? UIImage
                nameLabel.frame = CGRect(x: FT.DefaultCellMargin*2 + configuration.menuIconSize, y: (configuration.menuRowHeight - configuration.menuIconSize)/2, width: (configuration.menuWidth - configuration.menuIconSize - FT.DefaultCellMargin*3), height: configuration.menuIconSize)
            }
        }
    }
}
