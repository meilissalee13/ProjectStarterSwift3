//
//  NSError+Helpers.swift
//  Peeqr
//
//  Created by Buu Bui on 12/15/16.
//  Copyright © 2016 node8. All rights reserved.
//

import UIKit
import SwiftyJSON

enum ErrorType: Int {
  case genericError = 0
  case invalidToken
}

extension NSError {
  convenience init(localizedDescription: String, code: ErrorType = .genericError) {
    self.init(domain: "", code: code.rawValue, userInfo: [NSLocalizedDescriptionKey: localizedDescription])
  }

  convenience init(fromJSON json: JSON) {
    var errors = [String]()
    for (_, value) in json {
      if let errorMessages = value.arrayObject as? [String] {
        errors.append(contentsOf: errorMessages)
      }
    }
    self.init(localizedDescription: errors.joined(separator: "\n"))
  }
}
