//
//  CompanyCategoriesViewController.swift
//  firstApp
//
//  Created by Gandom on 7/27/22.
//

import UIKit

class CompanyCategoriesViewController: UITableViewController {
    
    //MARK: - Properties
    
    static var isBourseSelected = true
    var tableContent : [String] = []
    var selectedItem: Displayable?
}

//MARK: - VC Lifecycle

extension CompanyCategoriesViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableContentUpdate()
    }
}

//MARK: - Methods

extension CompanyCategoriesViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableContent.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = self.tableContent[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let DetailVC = storyboard?.instantiateViewController(identifier: "DetailVC") as? DetailViewController
            view.window?.rootViewController = DetailVC
            view.window?.makeKeyAndVisible()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableContentUpdate() {
        if CompanyCategoriesViewController.isBourseSelected{
            tableContent = ["Instrument effect","Most visited symbols","Selected indices","Summery"]
        }else{
            tableContent = ["Instrument effect","Most visited symbols","Summery"]
        }
        tableView.reloadData()
    }

}
