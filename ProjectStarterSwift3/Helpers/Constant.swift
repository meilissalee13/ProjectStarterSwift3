//
//  Constant.swift
//  Peeqr
//
//  Created by Buu Bui on 12/10/16.
//  Copyright © 2016 node8. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
  struct StatusBarNotification {
    static let duration: Double = 2
    struct Color {
      static let alertBackground = UIColor(red: 0.855, green: 0.2, blue: 0.176, alpha: 1)
      static let successBackground = UIColor(red: 0.188, green: 0.631, blue: 0.29, alpha: 1)
      static let text = UIColor.white
    }
  }

  struct PeeqrCollectionViewCellSize {
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let topHeightCell = (0.5*SCREEN_HEIGHT) as CGFloat
    static let midHeightCell = (0.3*SCREEN_HEIGHT) as CGFloat
    static let topWidthCell = (0.485*SCREEN_WIDTH) as CGFloat
    static let midWidthCell = (0.32*SCREEN_WIDTH) as CGFloat
    static let adWidthCell = (0.98*SCREEN_WIDTH) as CGFloat
    static let adHeightCell = (0.2*SCREEN_HEIGHT) as CGFloat
    static let sectionInsets = UIEdgeInsets(top: SCREEN_WIDTH*0.01, left: SCREEN_WIDTH*0.01, bottom: 0, right: SCREEN_WIDTH*0.01)
    static let subscriptionsHeightCell = (0.43*SCREEN_HEIGHT) as CGFloat
    static let subscriptionsWidthCell = (0.43*SCREEN_WIDTH) as CGFloat
    static let subscriptionsSectionInsets = UIEdgeInsets(top: SCREEN_WIDTH*0.05, left: SCREEN_WIDTH*0.05, bottom: 5, right: SCREEN_WIDTH*0.05)
  }
  
  struct Util {
    static func setCircleView(_ view: AnyObject) {
      view.layer.cornerRadius = view.frame.size.height / 2
      view.layer.borderWidth = 2.5
      view.layer.borderColor = UIColor.white.cgColor
      view.layer.masksToBounds = true
    }
    
    static func setCircleViewWithoutBorder(_ view: AnyObject) {
      view.layer.cornerRadius = view.frame.size.height / 2
      view.layer.masksToBounds = true
    }
    
    static func setCornerView(_ view: AnyObject, radius:CGFloat) {
      view.layer.cornerRadius = radius
      view.layer.masksToBounds = true
    }
  }
}
