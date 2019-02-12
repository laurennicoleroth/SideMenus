//
//  FiltersViewController.swift
//  SideMenus
//
//  Created by Lauren Nicole Roth on 2/12/19.
//  Copyright © 2019 Lauren Nicole Roth. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FilterOptionCell"

class FiltersViewController: UIViewController {
  
  var tableView: UITableView!
  var delegate: BrowseViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureTableView()
  }
  
  func configureTableView() {
    tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(FilterOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
    tableView.backgroundColor = .darkGray
    tableView.separatorStyle = .none
    tableView.rowHeight = 80
    
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
  }
  
}

extension FiltersViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FilterOptionCell
    
    let filterOption = FilterOption(rawValue: indexPath.row)
    cell.descriptionLabel.text = filterOption?.description
    cell.iconImageView.image = filterOption?.image
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let filterOption = FilterOption(rawValue: indexPath.row)
    delegate?.handleFiltersToggle(forFilterOption: filterOption)
  }
}

extension FiltersViewController : UITableViewDelegate {
  
}
