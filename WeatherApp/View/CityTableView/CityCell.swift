//
//  CityCell.swift
//  WeatherApp
//
//  Created by Ranu Dhurandhar on 20/03/23.
//

import Foundation
import UIKit

class CityCell: UITableViewCell{

    @IBOutlet weak var citynameLable: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var findName: UILabel!
    
    static var identifier: String {
        get {
            "cellCity"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "CityCell", bundle: nil)
    }
    
    
    
    func setupCell(viewModel: CityTableCellViewModel) {
        self.citynameLable.text = viewModel.cityName
        self.countryName.text = viewModel.countryName
        self.findName.text = viewModel.findName
    }
}

