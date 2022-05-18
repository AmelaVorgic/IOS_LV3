//
//  ViewController.swift
//  lv3_Vorgic
//
//  Created by student on 14.05.2022..
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            univs.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! UniViewCell
        cell.name.text = univs[indexPath.row].name
        cell.country.text = univs[indexPath.row].country
        cell.url.text = univs[indexPath.row].url?.description
        return cell
    }
        

    var univs: [University] = []
    @IBOutlet weak var table: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.global().async {
            self.fetchData()
        }
        initTable()
    }
    
    func initTable(){
        table.delegate = self
        table.dataSource = self
    }
    
    
    func fetchData(){
        AF.request("http://universities.hipolabs.com/search?country=croatia").responseJSON {
            dataResponse in
            let statusCode = dataResponse.response?.statusCode ?? 0
            if statusCode >= 200 && statusCode < 400 {
                print(dataResponse.data)
                let json = JSON(dataResponse.data)
                for obj in json.arrayValue{
                    let u = University(with: obj)
                    self.univs.append(u)
                }
                DispatchQueue.main.async {
                    print(self.univs.count)
                    self.table.reloadData()
                }
            }
            
            else
            {
                print("Error", statusCode)
            }
            
        }
        
    }

}

