//
//  Navigation.swift
//  Filip Task
//
//  Created by Filip Babic on 04/09/2020.
//  Copyright © 2020 filipbabic. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func drawNavigation(withColor: UIColor, leftImage: UIImage?, rightImage: UIImage?, title: String?, withBorder: Bool){
        
        let nav = self.navigationController?.navigationBar
        
            nav?.barTintColor = withColor
            nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            nav?.isTranslucent = false
        
        let rightButton: UIButton = UIButton(type: .custom)
            rightButton.setImage(rightImage, for: .normal)
            rightButton.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
        
        let rightBarButton = UIBarButtonItem(customView: rightButton)
            rightBarButton.customView?.translatesAutoresizingMaskIntoConstraints = false
            rightBarButton.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
            rightBarButton.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        let leftButton: UIButton = UIButton(type: .custom)
            leftButton.setImage(leftImage, for: .normal)
            leftButton.addTarget(self, action: #selector(leftButtonClicked), for: .touchUpInside)
        
        let leftBarButton = UIBarButtonItem(customView: leftButton)
            leftBarButton.customView?.translatesAutoresizingMaskIntoConstraints = false
            leftBarButton.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
            leftBarButton.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.title = title
        
        let bottomArrow = UIImageView()
            bottomArrow.image = UIImage(named: "BottomArrow")
            bottomArrow.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
            bottomArrow.widthAnchor.constraint(equalToConstant: 16.0),
            bottomArrow.heightAnchor.constraint(equalToConstant: 16.0),
            ])
        
        let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.textColor = UIColor.white
            titleLabel.font = UIFont(name: "Inter-Regular", size: 14.0)
            titleLabel.sizeToFit()
        
        let navigationTitleView = UIStackView(arrangedSubviews: [titleLabel, bottomArrow])
            navigationTitleView.spacing = 6
            navigationTitleView.alignment = .center
        
        let border = CALayer()
            border.frame = CGRect(x: -23,y: -7, width: (titleLabel.frame.width + bottomArrow.frame.width + 60.0), height:30)
            border.borderColor = UIColor.white.cgColor
            border.borderWidth = 1.0
            border.cornerRadius = 15
        
        if withBorder == true {
            navigationTitleView.layer.addSublayer(border)
        }else{
            titleLabel.text = "Task #\(title ?? "")"
            titleLabel.font = UIFont(name: "Inter-Regular", size: 17.0)
            rightBarButton.isEnabled = false
            bottomArrow.removeFromSuperview()
        }
        self.navigationItem.titleView = navigationTitleView
        
    }
    
    @objc func leftButtonClicked(sender:UIButton){
            navigationController?.popViewController(animated: true)
            print("Left Button Clicked")
    }
    
    @objc func rightButtonClicked(sender:UIButton){
            navigationController?.popViewController(animated: true)
            print("Right Button Clicked")
    }
}
