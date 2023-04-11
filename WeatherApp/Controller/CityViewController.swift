//
//  CityViewController.swift
//  WeatherApp
//
//  Created by Ranu Dhurandhar on 20/03/23.
//

import Foundation
import UIKit

class CityViewController: UIViewController{
    
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //Variables:
    var cityDataSource: [CityTableCellViewModel] = []
    let searchController   = UISearchController(searchResultsController: nil)
    var desToSend: String = ""
    var nameToSend: String = ""
    var weathermodel : WeatherViewModel = WeatherViewModel(_service: Services())
    
    
    override func viewDidLoad() {
       
        self.setupTableView()
        bindViewModel()
        self.setupSearchController()
        self.noDataLabel.isHidden =  true
        searchController.searchBar.backgroundColor = .white
        searchController.searchBar.tintColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.weathermodel.getCityBySearch(searchText: "")
        self.reloadTableView()
    }
    func bindViewModel() {
        self.weathermodel.isLoadingData.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        weathermodel.cities.bind { [weak self] cities in
            guard let self = self,
                  let cities = cities else {
                return
            }
            self.cityDataSource = cities
            self.reloadTableView()
        }
    }
    
    func setupSearchController() {
         searchController.searchResultsUpdater = self
         searchController.obscuresBackgroundDuringPresentation = false
         searchController.searchBar.placeholder = Constant.searchPlaceHolder
         navigationItem.searchController = searchController
         definesPresentationContext = true
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
            detailVC.cityName = nameToSend
            detailVC.cityDescription = desToSend
         }
    
    }

//MARK:- UISearchResultsUpdating, UISearchControllerDelegate
extension CityViewController: UISearchResultsUpdating,UISearchControllerDelegate {
 
    func updateSearchResults(for searchController: UISearchController) {
            if let searchText = searchController.searchBar.text {
               self.weathermodel.getCityBySearch( searchText: searchText)
                self.reloadTableView()
             }
       }
    }

