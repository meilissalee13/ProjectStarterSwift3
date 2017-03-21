//
//  FieldsValidator.swift
//  Peeqr
//
//  Created by East Agile on 12/14/16.
//  Copyright © 2016 node8. All rights reserved.
//

import Foundation
import ReactiveKit

struct FieldsValidator {
  var error: NSError?

  init(_ properties: [(String, String?)]) {
    for (name, value) in properties {
      if value == nil || value?.characters.count == 0 {
        error = NSError(localizedDescription: "\(name) is empty")
        return
      }
    }
  }

  func toSignal() -> Signal<Void, NSError> {
    return Signal<Void, NSError> { producer in
      if let error = self.error {
        producer.failed(error)
      } else {
        producer.completed(with: Void())
      }
      return NonDisposable.instance
    }
  }
}
