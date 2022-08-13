//
//  ContactViewController.swift
//  ContactsApp
//
//  Created by Apple Macbook Pro 13 on 13.08.22.
//

import UIKit

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
//        alert(title: "Sorry =(",
//              message: "This function can not be used, please stay with us for update!",
//              style: .alert)
        let model = Person(name: "Rak", surname: "Omar", email: "a", phone: "b")
        delegate?.updateCell(person: model)
        navigationController?.popViewController(animated: true)
    }
    
    private func fillPersonData() {
        if let unwrapModel = model {
            title = unwrapModel.name + " " + unwrapModel.surname
            phoneNumber.text = unwrapModel.phone
            emailAddress.text = unwrapModel.email
        }
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
