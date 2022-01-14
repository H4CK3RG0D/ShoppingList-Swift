//
//  ViewController.swift
//  ShoppingListHackwich
//
//  Created by period2 on 1/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tabelView: UITableView!
    @IBOutlet weak var newItemTextfield: UITextField!
    
    var items: [Item] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.dataSource = self
        
        let item1 = Item(name: "Apples", quantity: 2)
        let item2 = Item(name: "Eggs", quantity: 3)
        items = [item1, item2]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        let currentItem = items[indexPath.row]
        cell.textLabel?.text = currentItem.name
        cell.detailTextLabel?.text = "Quantity:\(currentItem.quantity)"
        return cell
    }

    @IBAction func whenAddItemButtonPressed(_ sender: Any) {
            if let newItemName = newItemTextfield.text {
                let randomInt = Int.random(in: 1...10)
            let newItem = Item(name: newItemName, quantity: randomInt)
            items.append(newItem)
            tabelView.reloadData()
            newItemTextfield.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tabelView.indexPathForSelectedRow {
            let item = items[indexPath.row]
            let vc = segue.destination as! DetailsViewController
            vc.item = item
        }
    }
}
    

