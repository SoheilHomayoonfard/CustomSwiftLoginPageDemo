//
//  DetailViewController.swift
//  firstApp
//
//  Created by Gandom on 7/27/22.
//
import UIKit

class DetailViewController: UITableViewController {
    
    static var JsonData : CompanyType?

    static var items: [Displayable] = []
    
    var selectedItem: Displayable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailViewController.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        let item = DetailViewController.items[indexPath.row]
        cell.textLabel?.text = item.TitleLabel
        cell.detailTextLabel?.text = item.subtitleLabel
        return cell
    }
}
