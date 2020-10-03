//
//  PersonArrayTableViewController.swift
//  SWAPIObjC
//
//  Created by Clarissa Vinciguerra on 10/1/20.
//

import UIKit

class PersonArrayTableViewController: UITableViewController {
    //MARK: - Properties
    var personArray: [CEVPerson] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPersonArray()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
       
        let person = personArray[indexPath.row]
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    // MARK: Helper Functions and Methods
    func fetchPersonArray() {
        CEVPersonController.fetchPersonArray { (personsArray, _) in
            DispatchQueue.main.async {
                self.personArray = personsArray
                self.tableView.reloadData()
                }
            }
        }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            guard let index = tableView.indexPathForSelectedRow, let destination = segue.destination as? PersonViewController else { return }
            let personToSend = personArray[index.row]
            destination.person = personToSend
        }
    }
}
