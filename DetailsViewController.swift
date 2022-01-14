//
//  DetailsViewController.swift
//  ShoppingListHackwich
//
//  Created by period2 on 1/12/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var quantityLabel: UILabel!
    var item : Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = item.name
        quantityLabel.text = "\(item.name): Quantity of \(item.quantity)"
        
    }
}
