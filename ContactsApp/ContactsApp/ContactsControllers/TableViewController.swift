//
//  TableViewController.swift
//  ContactsApp
//
//  Created by Apple Macbook Pro 13 on 12.08.22.
//

import UIKit

protocol UpdateCellDelegate {
    func updateCellDelegate(person: Person)
}

final class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        DataPersons.fillPersonArray()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataPersons.personArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = DataPersons.personArray[indexPath.row]
        cell.textLabel?.text = user.name + " " + user.surname
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        return cell
    }
        
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataPersons.personArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let currentPerson = DataPersons.personArray.remove(at: fromIndexPath.row)
        DataPersons.personArray.insert(currentPerson, at: to.row)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
            let contactVC = segue.destination as? ContactViewController {
            contactVC.model = DataPersons.personArray[indexPath.row]
            contactVC.delegate = self
        }
    }
}

extension TableViewController: UpdateCellDelegate {
    func updateCellDelegate(person: Person) {
        guard let indexPathMy = tableView.indexPathForSelectedRow else { return }
        DataPersons.personArray.remove(at: indexPathMy.row)
        DataPersons.personArray.insert(person, at: indexPathMy.row)
        tableView.reloadData()
    }
}
