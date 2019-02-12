//
//  MenuOption.swift
//  SideMenus
//
//  Created by Lauren Nicole Roth on 2/12/19.
//  Copyright © 2019 Lauren Nicole Roth. All rights reserved.
//

import Foundation
import UIKit

enum MenuOption: Int, CustomStringConvertible {
  case Profile
  case Notifications
  case Settings
  case Logout
  
  var description: String {
    switch self {
    case .Profile: return "Profile"
    case .Notifications: return "Notifications"
    case .Settings: return "Settings"
    case .Logout: return "Logout"
    }
  }
  
  var image: UIImage {
    switch self {
    case .Profile: return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
    case .Notifications: return UIImage(named: "ic_menu_white_3x") ?? UIImage()
    case .Settings: return UIImage(named: "baseline_settings_white_24dp") ?? UIImage()
    case .Logout: return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
    }
  }
}
