//
//  View2Coordinator.swift
//  SampleAppCoordinator
//
//  Created by sakiyamaK on 2020/05/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class LoginedView2Coordinator: Coordinator {
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
      let vc = LoginedView2Controller()
      guard let _self = self else { return }
      vc.tapButton1 = {
//        print("\(type(of: self)): tapButton1")
        let nextCoordinator = LoginedView3Coordinator(navigator: _self.navigator)
        nextCoordinator.start()
        _self.nextCoordinator = nextCoordinator
      }
      vc.tapButton2 = {
//        print("\(type(of: self)): tapButton2")
        let nextCoordinator = LoginedView4Coordinator(navigator: _self.navigator)
        nextCoordinator.start()
        _self.nextCoordinator = nextCoordinator
      }
      self?.navigator.pushViewController(vc, animated: true)
    }
  }
}
