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
