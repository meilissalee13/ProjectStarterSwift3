//
//  ViewController.swift
//  ProjectStarterSwift3
//
//  Created by Meilissa Lee on 3/21/17.
//  Copyright © 2017 Meilissa Lee. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class ViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var signInButton: UIButton!
  
  fileprivate let viewModel = mainViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    bindViewModel()
  }

  func bindViewModel() {
    viewModel.name.bidirectionalBind(to: nameTextField.reactive.text)
    
    let loginObserver = { (event: Event<Void, NSError>) in
      if case .failed(let error) = event {
        self.showAlertMessage(error.localizedDescription)
      } else if case .completed = event {
        self.goToHomeScreen()
      }
    }
    
    signInButton.reactive.tap.observeNext { [weak self] in
      self?.viewModel.login().observe(with: loginObserver).dispose(in: (self?.bag)!)
      }.dispose(in: bag)
  }
}

extension ViewController {
  func goToHomeScreen() {
    self.performSegue(withIdentifier: "loginsuccess", sender: self)
  }
}

