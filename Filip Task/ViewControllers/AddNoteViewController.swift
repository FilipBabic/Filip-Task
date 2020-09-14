//
//  AddNoteViewController.swift
//  Filip Task
//
//  Created by Filip Babic on 05/09/2020.
//  Copyright © 2020 filipbabic. All rights reserved.
//

import UIKit
import Firebase

class AddNoteViewController: UIViewController,UITextFieldDelegate {
    
    var ref : DatabaseReference!
    
    var objectKey: String?
    var Task: TaskModel?
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var DoneButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var noteTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserInterface()
    }
    
    func setUpUserInterface(){
        
        noteTextField.delegate = self
        self.closeButton.layer.cornerRadius = 15.0
        self.DoneButton.clipsToBounds = true
        self.DoneButton.layer.cornerRadius = 18.0
        self.DoneButton.applyGradient(colours: [buttonGradientTop, buttonGradientBottom], locations: [0.0,1.1])
        
        ref = Database.database().reference().child("Tasks/\(objectKey ?? "emptyKey")/notes")
    }
    
    @IBAction func CloseScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func AddNote(_ sender: Any) {
        let alert = UIAlertController(title: "Save Note to Realtime Database", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { action in
            self.addNote()
            self.performSegue(withIdentifier: "backToDetails", sender: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
        self.present(alert, animated: true, completion: nil)
    }
    
    func addNote(){

        let key = ref.childByAutoId().key
        
        let note: [String:Any] = [
            "noteContent": noteTextField.text! as String
        ]
       
        ref.child("note\(String(describing: key!))").setValue(note)
        Task!.notes.append(NoteModel(id: (String(describing: key!)), noteContent: noteTextField.text!))
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let currentCharacterCount = textField.text?.count ?? 0
        
        if range.length + range.location > currentCharacterCount {
            return false
        }else{
            let newLength = currentCharacterCount + string.count - range.length
            statusLabel.text =  String(120 - newLength) + " symbols"
            return newLength < 120
        }
    }
}
