//
//  MainMenuViewController.swift
//  firstApp
//
//  Created by Gandom on 7/17/22.
//
import UIKit
import Alamofire

class MainMenuViewController: UITableViewController {
    
    var tableContet  = ["a","b"]
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // toast selected cell
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
        return self.tableContet.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = self.tableContet[indexPath.row]
        return cell
    }
    
}

extension MainMenuViewController {
    func fetchData() {
        AF.request("https://api-dev.fasttse.com/api/v2/market").validate().responseJSON(){ (response) in
            print(response)
        }
    }
}




