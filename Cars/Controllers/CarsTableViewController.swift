//
//  CarsTableViewController.swift
//  Cars
//
//  Created by Henrique Augusto on 14/03/2019.
//  Copyright © 2019 Henrique Augusto. All rights reserved.
//

import UIKit
import Alamofire

class CarsTableViewController: UITableViewController {
    
    @IBOutlet var carsTable: UITableView!
    
    let URL = "http://desafioonline.webmotors.com.br/api/OnlineChallenge/Vehicles?page=1"
    
    var carsInfo : [CarsInfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCars()
    }
    
    func loadCars(){
        Alamofire.request(URL).responseJSON { response in
            guard let data = response.data else { return }
            do {
                let info = try JSONDecoder().decode([CarsInfo].self, from: data)
                self.carsInfo = info
                print(self.carsInfo)
                self.carsTable.reloadData()
            } catch {
                print(error)
            }
        }
        
    }
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return carsInfo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let cars = carsInfo[indexPath.row]
        cell.textLabel?.text = cars.Color
        cell.detailTextLabel?.text = cars.Make
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
