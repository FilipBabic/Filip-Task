//
//  Colors.swift
//  Filip Task
//
//  Created by Filip Babic on 04/09/2020.
//  Copyright © 2020 filipbabic. All rights reserved.
//

import UIKit

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}

var backgroundColor = UIColor(rgb: 0xE5E5E5)
var linkColor = UIColor(rgb: 0x0786FE)
var confirmButton = UIColor(rgb: 0x6D5BFF)
var navigationBackground = UIColor(rgb: 0x1E203E)
var buttonGradientTop = UIColor(rgb: 0x027AFF)
var buttonGradientBottom = UIColor(rgb: 0x2BDFF3)
var secondButtonGradientTop = UIColor(rgb: 0x8E57FF)
var secondButtonGradientBottom = UIColor(rgb: 0x6D5BFF)
var TaskBorderColor = UIColor(rgb: 0xE9ECEF)

var counterNotes = 0

