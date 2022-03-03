//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Halimcan Dayal on 3.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //Landmark Book Data
        
        landmarkNames.append("Dolmabahçe Sarayı")
        landmarkNames.append("Kız Kulesi")
        landmarkNames.append("İstanbul Boğazı")
        landmarkNames.append("Yerebatan Sarnıcı")
        landmarkNames.append("Topkapı Sarayı")
        
        landmarkNames.count
        
        
        landmarkImages.append(UIImage(named: "dolmabahce")!)
        landmarkImages.append(UIImage(named: "kız kulesi")!)
        landmarkImages.append(UIImage(named: "istanbul boğazı")!)
        landmarkImages.append(UIImage(named: "yerebatan sarnıcı")!)
        landmarkImages.append(UIImage(named: "topkapı sarayı")!)
        
        navigationItem.title = "Landmark Book"
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toImageVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageVC" {
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            
        }
    }
}

