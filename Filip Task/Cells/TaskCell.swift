//
//  TaskCell.swift
//  Filip Task
//
//  Created by Filip Babic on 05/09/2020.
//  Copyright © 2020 filipbabic. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.statusButton.clipsToBounds = true
        self.statusButton.layer.cornerRadius = 10.5
        self.statusButton.applyGradient(colours: [secondButtonGradientTop, secondButtonGradientBottom], locations: [0.0,1.1])
        // Configure the view for the selected state
    }

}
