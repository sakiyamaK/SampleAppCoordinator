//
//  LogioutView1Coordinator.swift
//  SampleAppCoordinator
//
//  Created by sakiyamaK on 2020/06/21.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class LogoutView1Coordinator: Coordinator {
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
      let vc = LogoutView1Controller()
      vc.tapLoginButton = {
        print("\(type(of: self)): tapLoginButton")
        UserDefaults.standard.set(true, forKey: "logined")
        NotificationCenter.default.post(name: .reStart, object: nil)
      }
      self?.navigator.pushViewController(vc, animated: true)
      print("\(self?.navigator.viewControllers)")
    }
  }
}
