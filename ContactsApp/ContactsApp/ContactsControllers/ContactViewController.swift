//
//  ContactViewController.swift
//  ContactsApp
//
//  Created by Apple Macbook Pro 13 on 13.08.22.
//

import UIKit
// MARK: Protocol
protocol UpdateContact {
    func updateContact(model: Person)
}

class ContactViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet private weak var phoneNumber: UILabel!
    @IBOutlet private weak var emailAddress: UILabel!
    
    // MARK: Delegates and properties
    var model: Person?
    var newModel: Person?
    var delegate: UpdateCell?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fillPersonData()
    }
    // MARK: IBAction
    @IBAction func callButton() {
        alert(title: "Sorry =(",
              message: "This function can not be used, please stay with us for update!",
              style: .alert)
    }
    @IBAction func messageButton() {
        alert(title: "Sorry =(",
              message: "This function can not be used, please stay with us for update!",
              style: .alert)
    }
    @IBAction func freeVideoCallButton() {
        alert(title: "Sorry =(",
              message: "This function can not be used, please stay with us for update!",
              style: .alert)
    }
    @IBAction func extraOutCallButton() {
        alert(title: "Sorry =(",
              message: "This function can not be used, please stay with us for update!",
              style: .alert)
    }
    @IBAction func editButton() {
        performSegue(withIdentifier: "GoToEditContactVC", sender: nil)
    }
    
    // MARK: Functions
    private func fillPersonData() {
        if let unwrapModel = model {
            title = unwrapModel.name + " " + unwrapModel.surname
            phoneNumber.text = unwrapModel.phone
            emailAddress.text = unwrapModel.email
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let editContactVC = segue.destination as? EditContactViewController,
            let unwModel = model
        {
            let person = Person(name: unwModel.name,
                                surname: unwModel.surname,
                                email: unwModel.email,
                                phone: unwModel.phone)
            editContactVC.model = person
            editContactVC.delegate = self
        }
    }
}

// MARK: Extension
extension ContactViewController: UpdateContact {
    func updateContact(model: Person) {
        title = model.name + " " + model.surname
        phoneNumber.text = model.phone
        emailAddress.text = model.email
        delegate?.updateCell(person: model)
    }
}
