//
//  TodoTableViewCell.swift
//  Perfectionist
//
//  Created by RAJAN on 1/4/18.
//  Copyright © 2018 RAJAN. All rights reserved.
//

import UIKit

protocol TodoTableViewCellDelegate {
    
    func didUpdateTextContent(text: String?, indexPath: IndexPath?)
}

class TodoTableViewCell: UITableViewCell , UITextFieldDelegate {
    
    
    @IBOutlet weak var todoItem: UITextField!
    
    var indexPath: IndexPath?
    var delegate: TodoTableViewCellDelegate?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    override func draw(_ rect: CGRect, for formatter: UIViewPrintFormatter) {
        print("draw")
    }

    override func draw(_ rect: CGRect) {
        print("draw")
    }
    public func set(indexpath: IndexPath?, delegate: TodoTableViewCellDelegate?, text: String?) {
        
        self.indexPath = indexpath ?? nil
        self.delegate = delegate ?? nil
        if let todoTextField = self.todoItem {
            todoTextField.text = text ?? "Empty"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        delegate?.didUpdateTextContent(text: todoItem.text, indexPath: self.indexPath)
        return false
    }
}

