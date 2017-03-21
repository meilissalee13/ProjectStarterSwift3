//
//  mainViewModel.swift
//  ProjectStarterSwift3
//
//  Created by Meilissa Lee on 3/21/17.
//  Copyright © 2017 Meilissa Lee. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class mainViewModel {
  let name = Property<String?>("")
  
  private var properties: [(String, String?)] {
    return [("Name", name.value)]
  }
  
  func login() -> Signal<Void, NSError> {
    return FieldsValidator(self.properties).toSignal()
  }
}
