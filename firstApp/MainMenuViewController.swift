//
//  MainMenuViewController.swift
//  firstApp
//
//  Created by Gandom on 7/17/22.
//
import UIKit
import Alamofire

class MainMenuViewController: UITableViewController {
    
    var JSONData : CompanyType?
    
    var tableContent : [String] = []

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            CompanyCategoriesViewController.isBourseSelected = true
            let CompanyType = JSONData?.bourse
            DetailViewController.items = CompanyType!.instrumentEffect
        }else{
            CompanyCategoriesViewController.isBourseSelected = true
            let CompanyType = JSONData?.farabourse
            DetailViewController.items = CompanyType!.instrumentEffect
        }
        let CompanyCategoriesVC = storyboard?.instantiateViewController(identifier: "CompanyCategoriesVC") as? CompanyCategoriesViewController
        view.window?.rootViewController = CompanyCategoriesVC
        view.window?.makeKeyAndVisible()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableContent.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = self.tableContent[indexPath.row]
        return cell
    }
    
}

// MARK: -> Networking

extension MainMenuViewController {
    func fetchData() {
        AF.request("https://api-dev.fasttse.com/api/v2/market").validate().responseDecodable(of: CompanyType.self){ (response) in
            guard let ComapanyType = response.value else {
                print("Trouble parsing JSON!")
                return
            }
            self.tableContent = [ "bourse" , "farabourse" ]
            self.tableView.reloadData()
            DetailViewController.JsonData = ComapanyType
            self.JSONData = ComapanyType
        }
    }
}




