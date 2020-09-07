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
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var DoneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var noteTextField: UITextField!
        
    @IBAction func CloseScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func AddNote(_ sender: Any) {
        let alert = UIAlertController(title: "Save Note to Realtime Database", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { action in
            self.addNote()
            self.dismiss(animated: true, completion: nil)

        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func addNote(){

        let key = ref.childByAutoId().key
        
        let note: [String:Any] = [
            "noteContent": noteTextField.text! as String
        ]
       
        ref.child("note_\(String(describing: key!))").setValue(note)
    }
    
    //TEXT FIELD DELEGATE
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let length = noteTextField.text?.count ?? 0
        let count = 120 - length
        statusLabel.text =  String(count) + " symbols"

        return length <= 119
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    


}
