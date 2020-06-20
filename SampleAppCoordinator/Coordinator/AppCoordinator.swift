//
//  AppCoordinator.swift
//  SampleAppCoordinator
//
//  Created by sakiyamaK on 2020/05/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
  private let window: UIWindow
  private let rootTabbarController: UITabBarController
  private let rootNavigator: UINavigationController
  private var nextCoordinator: Coordinator?

  deinit {
    print("\(type(of: self)): \(#function)")
  }

  init(window: UIWindow) {
    self.window = window
    rootTabbarController = .init()
    rootNavigator = .init()
    rootTabbarController.viewControllers = [rootNavigator]
  }

  func start() {
    window.rootViewController = rootTabbarController
    let nextCoordinator = View1Coordinator.init(navigator: rootNavigator)
    self.nextCoordinator = nextCoordinator
    nextCoordinator.start()
    window.makeKeyAndVisible()
  }
}
