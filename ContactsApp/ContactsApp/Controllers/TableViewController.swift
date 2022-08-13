//
//  TableViewController.swift
//  ContactsApp
//
//  Created by Apple Macbook Pro 13 on 12.08.22.
//

import UIKit

protocol UpdateCell {
    func updateCell(person: Person)
}

class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        DataPersons.fillPersonArray()
        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataPersons.personArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = DataPersons.personArray[indexPath.row]
        cell.textLabel?.text = user.name + " " + user.surname

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow,
            let contactVC = segue.destination as? ContactViewController {
            contactVC.model = DataPersons.personArray[indexPath.row]
            contactVC.delegate = self
        }
    }
}

extension TableViewController: UpdateCell {
    func updateCell(person: Person) {
        if
            let indexPathMy = tableView.indexPathForSelectedRow
        {
            DataPersons.personArray.remove(at: indexPathMy.row)
            DataPersons.personArray.insert(person, at: indexPathMy.row)
            tableView.reloadData()
        }
    }
}
