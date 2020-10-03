//
//  PersonViewController.swift
//  SWAPIObjC
//
//  Created by Clarissa Vinciguerra on 10/1/20.
//

import UIKit

class PersonViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    //MARK: - Properties
    var person: CEVPerson?
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: Helper Functions
    func updateViews() {
        guard let person = person else { return }
        DispatchQueue.main.async {
            self.nameLabel.text = person.name
            self.genderLabel.text = "Gender: \(person.gender)"
            self.heightLabel.text = "Height: \(person.height)"
            print("NAME: \(String(describing: self.nameLabel.text)), GENDER: \(String(describing: self.genderLabel.text)), HEIGHT: \(String(describing: self.heightLabel.text))")
        }
    }
}
