//
//  PersonsListViewController.swift
//  ContactsApp
//
//  Created by Apple Macbook Pro 13 on 13.08.22.
//

import UIKit

final class PersonsListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self,
                           forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}

extension PersonsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return DataPersons.personArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = DataPersons.personArray[section]
        return person.name + " " + person.surname
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.contentView.backgroundColor = .lightGray
        header?.textLabel?.textColor = .black
        header?.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.identifier,
            for: indexPath) as? CustomTableViewCell
        {
            let person = DataPersons.personArray[indexPath.row]
            if indexPath.row == 0 { cell.refresh(sender: person.email) }
            if indexPath.row == 1 { cell.refresh(sender: person.phone) }
            cell.backgroundColor = .clear
            return cell
        }
        return UITableViewCell()
    }
}

extension PersonsListViewController: UITableViewDelegate {}
