//
//  SearchResultsTableViewController.swift
//  itunesSearch
//
//  Created by Bobby Keffury on 9/6/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let searchResultsController = SearchResultController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultsController.searchResults.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? SearchTermTableViewCell else { return UITableViewCell() }

        let searchResults = searchResultsController.searchResults[indexPath.row]
        cell.searchResult = searchResults
        
       
        return cell
    }
    

}

extension SearchResultsTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        let resultType: ResultType!
        
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            resultType = .musicTrack
        case 2:
            resultType = .movie
        default:
            resultType = .software
        }
        
        searchResultsController.performSearch(with: searchTerm, resultType: resultType) { (error) in
            if let error = error {
                print("Error loading data: \(error)")
                return
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        //HAVING TROUBLE WITH THE SWITCH STATEMENT.
        
        
        
    }
    
}
