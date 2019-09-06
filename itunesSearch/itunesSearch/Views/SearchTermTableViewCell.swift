//
//  ItemTableViewCell.swift
//  itunesSearch
//
//  Created by Bobby Keffury on 9/6/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import UIKit

class SearchTermTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    
    var searchResult: SearchResult? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let searchResult = searchResult else { return }
        titleLabel.text = searchResult.title
        creatorLabel.text = searchResult.creator
    }

}
