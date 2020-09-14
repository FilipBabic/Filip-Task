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
    var notes = [NoteModel]()
    
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
    @IBOutlet weak var notesButton: UIButton!
    @IBOutlet weak var SignatureButton: UIButton!
    @IBOutlet weak var scrollViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var verticalSpacingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawNavigation(withColor: navigationBackground, leftImage: UIImage(named: "LeftArrow"), rightImage: nil, title: "6742398", withBorder: false)
        setUserInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addNotesToUI()
    }

    @IBAction func unwindToTaskDetails(segue: UIStoryboardSegue) {
        if let AddNoteViewController = segue.source as? AddNoteViewController {
             self.Task = AddNoteViewController.Task
             addNotesToUI()
        }
    }
    
    func setUserInterface(){
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
    
    func addNotesToUI() {
        
        if Task?.notes.count ?? 0 > 0 {
            
            var scrollHeight:CGFloat = 784
            var verticalSpacing:CGFloat = 68
            var topSpace:CGFloat = 8
            
            for index in 0...Task!.notes.count - 1 {
                
                let notesView = UIView()
                notesView.backgroundColor = UIColor.white
                
                let notesLabel = UILabel(frame: CGRect(x: 8, y: 0, width: 100, height: 48))
                notesLabel.text = Task?.notes[index].noteContent
                notesLabel.textAlignment = .natural
                notesLabel.font = UIFont.init(name: "Inter-Regular", size: 11.0)
                notesLabel.textColor = TextColor
                notesLabel.backgroundColor = UIColor.white
                notesLabel.adjustsFontSizeToFitWidth = true
                notesView.addSubview(notesLabel)

                self.contentView.addSubview(notesView)

                notesView.translatesAutoresizingMaskIntoConstraints = false
                
                self.scrollViewHeightConstraint.constant = scrollHeight
                self.verticalSpacingConstraint.constant = verticalSpacing
                
                NSLayoutConstraint.activate([
    
                notesView.topAnchor.constraint(equalTo: notesButton.bottomAnchor, constant: topSpace),
                notesView.heightAnchor.constraint(equalToConstant: 52),
                notesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                notesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                ])
                
                scrollHeight += 60
                verticalSpacing += 60
                topSpace += 60
            }
        }else{
                print("EMPTY NOTES")
                self.scrollViewHeightConstraint.constant = 724
                self.verticalSpacingConstraint.constant = 8
            }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notesSegue" {
            let controller = segue.destination as! AddNoteViewController
            controller.objectKey = self.Task?.key
            controller.Task = self.Task
        }
    }
}

