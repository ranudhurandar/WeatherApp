//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Ranu Dhurandhar on 21/03/23.
//

import Foundation
import UIKit

class DetailViewController : UIViewController{
    
    @IBOutlet weak var detailLable: UILabel!
    var cityName: String = ""
    var cityDescription: String = ""
    
    override func viewDidLoad() {
        self.navigationItem.title = cityName
        self.detailLable.text = cityDescription
    }
    
}
