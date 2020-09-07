//
//  TaskDetailsViewController.swift
//  Filip Task
//
//  Created by Filip Babic on 04/09/2020.
//  Copyright © 2020 filipbabic. All rights reserved.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    
    var Task:TaskModel?
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var profileIcon: UIImageView!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserInterface()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        drawNavigation(withColor: navigationBackground, leftImage: UIImage(named: "LeftArrow"), rightImage: nil, title: "6742398", withBorder: false)
        
    }
    
    func setUpUserInterface(){
        self.contentView.backgroundColor = backgroundColor
        
        self.saveButton.clipsToBounds = true
        self.saveButton.layer.cornerRadius = 18.0
        self.saveButton.applyGradient(colours: [buttonGradientTop, buttonGradientBottom], locations: [0.0,1.1])
        
        self.profileIcon.layer.cornerRadius = 20.0
        
        self.dataLabel.text = self.Task?.date
        self.nameLabel.text = self.Task?.name
        self.addressLabel.text = self.Task?.address
        self.companyLabel.text = self.Task?.company
        self.typeLabel.text = self.Task?.type
        
        self.statusButton.clipsToBounds = true
        self.statusButton.layer.cornerRadius = 10.5
        self.statusButton.applyGradient(colours: [secondButtonGradientTop, secondButtonGradientBottom], locations: [0.0,1.1])
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notesSegue" {
            let controller = segue.destination as! AddNoteViewController
            controller.objectKey = self.Task?.key
        }
    }

}
