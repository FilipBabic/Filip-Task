//
//  Gradient.swift
//  Filip Task
//
//  Created by Filip Babic on 05/09/2020.
//  Copyright © 2020 filipbabic. All rights reserved.
//

import UIKit

extension UIView {
@discardableResult
func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.frame = self.bounds
    gradient.colors = colours.map { $0.cgColor }
    gradient.locations = locations
    self.layer.insertSublayer(gradient, at: 0)
    return gradient
}
}
