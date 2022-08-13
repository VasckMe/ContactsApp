//
//  EditContactViewController.swift
//  ContactsApp
//
//  Created by Apple Macbook Pro 13 on 13.08.22.
//

import UIKit

class EditContactViewController: UIViewController {

    @IBOutlet weak var clearTextButtonOutlet: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    var model: Person?
    
    var buttonMy = UIButton(type: .custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPersonData()
        setupTextFields()
    }
    
    
    private func setupTextFields() {
        nameTextField.rightView = clearTextButtonOutlet
        nameTextField.rightViewMode = .whileEditing
        
        surnameTextField.rightView = clearTextButtonOutlet
        surnameTextField.rightViewMode = .whileEditing
    }

    private func setupPersonData() {
        if
            let person = model
        {
            nameTextField.text = person.name
            surnameTextField.text = person.surname
            emailTextField.text = person.email
            phoneTextField.text = person.phone
        }
    }
    
    private func checkPersons() {
//        let newPerson = Person(name: <#T##String#>, surname: <#T##String#>, email: <#T##String#>, phone: <#T##String#>)
//        if
//            let newPer
//            let person = model,
            
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
