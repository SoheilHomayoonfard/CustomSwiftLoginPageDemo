//
//  DetailViewController.swift
//  firstApp
//
//  Created by Gandom on 7/27/22.
//
import UIKit

class DetailViewController: UITableViewController {
    
//MARK: - Properties
    
    static var JsonData : CompanyType?
    static var items: [Displayable] = []
    var selectedItem: Displayable?
}

//MARK: - VC Lifecycle

extension DetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Methods

extension DetailViewController {
    
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

 //MARK: - Actions

extension DetailViewController {
    
    @IBAction func unwindToCompanyCategories(_ sender: Any) {
        let CompanyCategoriesVC = storyboard?.instantiateViewController(identifier: "CompanyCategoriesVC") as? CompanyCategoriesViewController
        view.window?.rootViewController = CompanyCategoriesVC
        view.window?.makeKeyAndVisible()
    }

}
