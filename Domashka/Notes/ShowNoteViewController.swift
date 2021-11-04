//
//  ShowNoteViewController.swift
//  Domashka
//
//  Created by Алан Ахмадуллин on 12.10.2021.
//

import UIKit
import RealmSwift
class ShowNoteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var bData:Results<NotesModel>!
    var notesModel = NotesModel()
    let idCell = "customCell"
    
    @IBOutlet weak var tableView: UITableView!
    lazy var realm = try! Realm()
    var textlabel = String()
    var detailsText = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        bData = realm.objects(NotesModel.self)
    
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = bData[indexPath.row].noteName
        cell.detailTextLabel?.text = bData[indexPath.row].noteText
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            func pressed() {
                Realmmanager.shared.deleteNote(model: bData[indexPath.row])
                tableView.reloadData()
            }
            let alert = UIAlertController(title: "Warning", message: "Are you sure you want to delete this note?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler:{action in pressed()}))
                            
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            present(alert,animated: true, completion: nil)
    
        
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let edit = storyboard?.instantiateViewController(withIdentifier: "create") as? CreateNoteViewController
        
        else { return }
        
        edit.notesModel = bData[indexPath.row]
        edit.editModel = true
        show(edit, sender: nil)
        }
    }


