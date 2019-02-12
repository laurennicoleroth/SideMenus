//
//  ContainerViewController.swift
//  SideMenus
//
//  Created by Lauren Nicole Roth on 2/12/19.
//  Copyright © 2019 Lauren Nicole Roth. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
  
  var menuViewController: MenuViewController!
  var filtersViewController: FiltersViewController!
  var centerViewController: UIViewController!
  var isExpanded = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureBrowseViewController()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
    return .slide
  }
  
  override var prefersStatusBarHidden: Bool {
    return isExpanded
  }
  
  func configureBrowseViewController() {
    let browseViewController = BrowseViewController()
    browseViewController.delegate = self
    centerViewController = UINavigationController(rootViewController: browseViewController)
    
    view.addSubview(centerViewController.view)
    addChild(centerViewController)
    centerViewController.didMove(toParent: self)
  }
  
  func configureMenuController() {
    if menuViewController == nil {
      menuViewController = MenuViewController()
      menuViewController.delegate = self
      view.insertSubview(menuViewController.view, at: 0)
      addChild(menuViewController)
      menuViewController.didMove(toParent: self)
    }
  }
  
  func configureFiltersController() {
    if filtersViewController == nil {
      filtersViewController = FiltersViewController()
      filtersViewController.delegate = self
      view.insertSubview(filtersViewController.view, at: 0)
      addChild(filtersViewController)
      filtersViewController.didMove(toParent: self)
    }
  }
  
  func animateMenuPanel(shouldExpand: Bool, menuOption: MenuOption?) {
    
    if shouldExpand {
      // show menu
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
        self.centerViewController.view.frame.origin.x = self.centerViewController.view.frame.width - 80
      }, completion: nil)
      
    } else {
      // hide menu
      
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
        self.centerViewController.view.frame.origin.x = 0
      }) { (_) in
        guard let menuOption = menuOption else { return }
        self.didSelectMenuOption(menuOption: menuOption)
      }
    }
    
    animateStatusBar()
  }
  
  func animateFiltersPanel(shouldExpand: Bool, filterOption: FilterOption?) {
    
    if shouldExpand {
      // show menu
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
        self.centerViewController.view.frame.origin.x = self.centerViewController.view.frame.width - 80
      }, completion: nil)
      
    } else {
      // hide menu
      
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
        self.centerViewController.view.frame.origin.x = 0
      }) { (_) in
        guard let filterOption = filterOption else { return }
        self.didSelectFilterOption(filterOption: filterOption)
      }
    }
    
    animateStatusBar()
  }
  
  func didSelectMenuOption(menuOption: MenuOption) {
    switch menuOption {
    case .Profile:
      print("Show profile")
    case .Notifications:
      print("Show Notifications")
    case .Settings:
      print("Show Settings")
    case .Logout:
      print("Show Logout")
    }
  }
  
  func didSelectFilterOption(filterOption: FilterOption) {
    switch filterOption {
    case .Nearby:
      print("Show nearby")
    case .TopRated:
      print("Show top rated")
    case .Recent:
      print("Show recent")
    case .Popular:
      print("Show popular")
    }
  }
  
  func animateStatusBar() {
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
      self.setNeedsStatusBarAppearanceUpdate()
    }, completion: nil)
  }
  
}

extension ContainerViewController: BrowseViewControllerDelegate {
  func handleFiltersToggle(forFilterOption filterOption: FilterOption?) {
    if !isExpanded {
      configureFiltersController()
    }
    
    isExpanded = !isExpanded
    animateFiltersPanel(shouldExpand: isExpanded, filterOption: filterOption)
  }
  
  func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
    if !isExpanded {
      configureMenuController()
    }
    
    isExpanded = !isExpanded
    animateMenuPanel(shouldExpand: isExpanded, menuOption: menuOption)
  }
}
