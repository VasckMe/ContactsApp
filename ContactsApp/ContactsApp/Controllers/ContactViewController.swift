//
//  ContactViewController.swift
//  ContactsApp
//
//  Created by Apple Macbook Pro 13 on 13.08.22.
//

import UIKit

protocol UpdateContact {
    func updateContact(model: Person)
}

class ContactViewController: UIViewController {

    @IBOutlet private weak var phoneNumber: UILabel!
    @IBOutlet private weak var emailAddress: UILabel!
    
    var model: Person?
    var delegate: UpdateCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillPersonData()
    }
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
    private func fillPersonData() {
        if let unwrapModel = model {
            title = unwrapModel.name + " " + unwrapModel.surname
            phoneNumber.text = unwrapModel.phone
            emailAddress.text = unwrapModel.email
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
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
        }
    }
}

extension ContactViewController: UpdateContact {
    func updateContact(model: Person) {
        title = model.name + " " + model.surname
        phoneNumber.text = model.phone
        emailAddress.text = model.email
    }
}
