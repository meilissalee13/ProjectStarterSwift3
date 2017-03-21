//
//  UITextField+Bond.swift
//  Peeqr
//
//  Created by Buu Bui on 12/15/16.
//  Copyright © 2016 node8. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

extension UITextField {
  public var bnd_delegate: ProtocolProxy {
    return protocolProxy(for: UITextFieldDelegate.self, setter: NSSelectorFromString("setDelegate:"))
  }

  var bnd_return: Signal1<Void> {
    return bnd_delegate.signal(for: #selector(UITextFieldDelegate.textFieldShouldReturn(_:))) { (subject: PublishSubject<Void, NoError>, _: UITextField) in
      subject.next()
    }
  }

  func bindTapReturnKeyToFocus(_ field: UITextField) {
    bnd_return.observeNext {
      field.perform(NSSelectorFromString("becomeFirstResponder"), with: nil, afterDelay: 0)
    }.dispose(in: bag)
  }
}
