//
//  ViewController.swift
//  Filip Task
//
//  Created by Filip Babic on 03/09/2020.
//  Copyright © 2020 filipbabic. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TaskViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var ref : DatabaseReference!
    
    var Tasks = [TaskModel]()
    var noteID = [NoteModel]()
    
    @IBOutlet weak var TableVIew: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        drawNavigation(withColor: navigationBackground, leftImage: UIImage(named: "LeftItem")!, rightImage: UIImage(named: "RightItem")!, title: "June 5", withBorder: true)
        setUserInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        LoadTasks()
    }
    
    func setUserInterface(){
        self.view.backgroundColor = backgroundColor
               self.TableVIew.backgroundColor = backgroundColor
               self.TableVIew.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func LoadTasks(){
        
        ref = Database.database().reference()
        let task = ref.child("Tasks")

        task.observe(.value, with: { (DataSnapshot) in
           
            let newItems = DataSnapshot.value as! [String:NSDictionary]
            self.Tasks.removeAll()
            for item in newItems{
                
                let date = item.value.value(forKey: "date")
                let id = item.value.value(forKey: "id")
                let name = item.value.value(forKey: "name")
                let company = item.value.value(forKey: "company")
                let address = item.value.value(forKey: "address")
                let type = item.value.value(forKey: "type")
                let key = item.key
                var notes = [NoteModel]()

                if let noteObject = (item.value.value(forKey: "notes")) as! NSDictionary? {

                    notes.removeAll()
                    for i in noteObject {
                        let note = (i.value) as! NSDictionary
                        let noteId = (i.key) as! String

                        let noteContent = note.value(forKey: "noteContent")! as! String
                        notes.append(NoteModel(id: noteId, noteContent: noteContent))
                     }
                }else {
                        print("EMPTY NOTES")
                }

                self.Tasks.append(TaskModel(id: id as! Int, date: date as! String, name: name as! String, company: company as! String, address: address as! String, type: type as! String, notes: notes, key: key))
                }
            
                self.TableVIew.reloadData()
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Tasks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let task = self.Tasks[indexPath.section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskCell
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 12.0
            cell.layer.borderWidth = 1.0
            cell.layer.backgroundColor = UIColor.white.cgColor
            cell.layer.borderColor = TaskBorderColor.cgColor
            
            cell.dateLabel.text = task.date
            cell.addressLabel.text = task.address
            cell.nameLabel.text = task.name
            cell.companyLabel.text = task.company
            cell.typeLabel.text = task.type
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = Tasks[indexPath.section]
            performSegue(withIdentifier: "detailsSegue", sender: selectedRow)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            if let indexPath = self.TableVIew.indexPathForSelectedRow {
                let controller = segue.destination as! TaskDetailsViewController
                    controller.Task = self.Tasks[indexPath.section]
            }
        }
    }
}

