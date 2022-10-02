//
//  TodoListViewController.swift
//  Perfectionist
//
//  Created by RAJAN on 1/1/18.
//  Copyright © 2018 RAJAN. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, TodoTableViewCellDelegate {
    
    var todoList: Array<String>? = ["Brush","Bath","Meditate","Jog"]
    
    @IBOutlet weak var todoTableView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        
        let oldList = UserDefaults.standard.array(forKey: "todoList") as? Array<String>
        if oldList?.isEmpty == false {
            self.todoList = oldList
        }
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        todoTableView.register(TodoTableViewCell.self, forCellReuseIdentifier: "todoCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        self.todoTableView.reloadData()
    }
    
    // MARK: - UITableView delegate and datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (todoList?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! TodoTableViewCell
        cell.set(indexpath: indexPath, delegate: self, text:todoList?[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            
            todoList?.remove(at: indexPath.row)
            updateTodoList()
        }
    }
    
    // MARK: - Button actions
    
    @IBAction func addCellButtonClicked(_ sender: Any) {
        
        todoList?.append("new thing to do")
        updateTodoList()
    }
    
    
    // MARK: - GroceryTableViewCellDelegate
    
    func didUpdateTextContent(text: String?, indexPath: IndexPath?) {
        let index = indexPath!.row
        todoList?.remove(at: index)
        todoList?.insert(text!, at: index)
        updateTodoList()
    }
    
    // MARK: - Methods
    
    func updateTodoList() {
        UserDefaults.standard.set(todoList, forKey: "todoList")
        todoTableView.reloadData()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

