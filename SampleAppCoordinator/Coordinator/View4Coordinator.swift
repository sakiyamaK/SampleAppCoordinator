//
//  View4Coordinator.swift
//  SampleAppCoordinator
//
//  Created by sakiyamaK on 2020/06/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class View4Coordinator: Coordinator {
  private let navigator: UINavigationController
  private var nextCoordinator: Coordinator?

  deinit {
    print("\(type(of: self)): \(#function)")
  }

  init(navigator: UINavigationController) {
    self.navigator = navigator
  }

  func start() {
    DispatchQueue.main.async {[weak self] in
      let vc = View4Controller()
      self?.navigator.pushViewController(vc, animated: true)
    }
  }
}
import Foundation
