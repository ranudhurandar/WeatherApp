//
//  CityViewController+TableView.swift
//  WeatherApp
//
//  Created by Ranu Dhurandhar on 10/04/23.
//

import Foundation
import UIKit
//MARK:- UITableViewDataSource,UITableViewDelegate
enum CountryEnum: String, Codable, CaseIterable {
    case CN = "CN"
    case TR = "TR"
    case RU = "RU"
}

extension CityViewController : UITableViewDataSource,UITableViewDelegate {
    
    func setupTableView() {
        self.cityTableView.delegate = self
        self.cityTableView.dataSource = self
        self.cityTableView.backgroundColor = .clear
        self.registerCells()
    }
    
    func reloadTableView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.cityTableView.reloadData()
        }
    }
    
    func registerCells() {
        self.cityTableView.register(CityCell.register(), forCellReuseIdentifier: CityCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        weathermodel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathermodel.numberOfRows(in: section)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityCell.identifier, for: indexPath) as? CityCell else {
            return UITableViewCell()
        }
        
        cell.setupCell(viewModel: cityDataSource[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
            desToSend =  cityDataSource[indexPath.row].countryName
            nameToSend = cityDataSource[indexPath.row].cityName
            performSegue(withIdentifier: Constant.segueName, sender: nil)
    }
}
