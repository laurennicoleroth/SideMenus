//
//  BrowseViewController.swift
//  SideMenus
//
//  Created by Lauren Nicole Roth on 2/12/19.
//  Copyright © 2019 Lauren Nicole Roth. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
  var delegate: BrowseViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    configureNavigationBar()
  }
  
  func configureNavigationBar() {
    navigationController?.navigationBar.barTintColor = .darkGray
    navigationController?.navigationBar.barStyle = .black
    
    navigationItem.title = "New York"
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleFiltersToggle))
  }
  
  @objc func handleMenuToggle() {
    delegate?.handleMenuToggle(forMenuOption: nil)
  }
  
  @objc func handleFiltersToggle() {
    delegate?.handleFiltersToggle(forFilterOption: nil)
  }
}
