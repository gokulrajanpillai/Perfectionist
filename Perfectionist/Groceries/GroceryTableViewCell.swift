//
//  GroceryTableViewCell.swift
//  Perfectionist
//
//  Created by RAJAN on 1/1/18.
//  Copyright © 2018 RAJAN. All rights reserved.
//

import UIKit

protocol GroceryTableViewCellDelegate {
    
    func didUpdateTextContent(text: String?, indexPath: IndexPath?)
}

class GroceryTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var groceryItem: UITextField!
    var indexPath: IndexPath?
    var delegate: GroceryTableViewCellDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func set(indexpath: IndexPath?, delegate: GroceryTableViewCellDelegate?, text: String?) {
        
        self.indexPath = indexpath ?? nil
        self.delegate = delegate ?? nil
        self.groceryItem.text = text ?? "Empty"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        delegate?.didUpdateTextContent(text: groceryItem.text, indexPath: self.indexPath)
        return false
    }
}
