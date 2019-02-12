//
//  FilterOption.swift
//  SideMenus
//
//  Created by Lauren Nicole Roth on 2/12/19.
//  Copyright © 2019 Lauren Nicole Roth. All rights reserved.
//

import Foundation
import UIKit

enum FilterOption: Int, CustomStringConvertible {
  case Nearby
  case TopRated
  case Recent
  case Popular
  
  var description: String {
    switch self {
    case .Nearby: return "Nearby"
    case .TopRated: return "Top Rated"
    case .Recent: return "Recent"
    case .Popular: return "Popular"
    }
  }
  
  var image: UIImage {
    switch self {
    case .Nearby: return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
    case .TopRated: return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
    case .Recent: return UIImage(named: "ic_menu_white_3x") ?? UIImage()
    case .Popular: return UIImage(named: "baseline_settings_white_24dp") ?? UIImage()
    }
  }
}
