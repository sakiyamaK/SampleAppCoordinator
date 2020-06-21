//
//  AppCoordinator.swift
//  SampleAppCoordinator
//
//  Created by sakiyamaK on 2020/05/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

extension NSNotification.Name {
  static let reStart = Notification.Name("reStart")
}

final class AppCoordinator: Coordinator {
  private let window: UIWindow

  private(set) var root: UIViewController?
  private var logoutedNavigator: UINavigationController?

  private var rootTabbarController: UITabBarController?
  private var rootNavigator: UINavigationController?

  private var nextCoordinator: Coordinator?

  deinit {
    print("\(type(of: self)): \(#function)")
  }

  init(window: UIWindow) {
    self.window = window

    NotificationCenter.default.addObserver(self, selector: #selector(reStartSelector), name: .reStart, object: nil)
  }

  func start() {
    if UserDefaults.standard.bool(forKey: "logined") {
      print("ログイン")
      rootTabbarController = .init()
      rootNavigator = .init()
      window.rootViewController = rootTabbarController
      rootTabbarController!.setViewControllers([rootNavigator!], animated: false)
      let nextCoordinator = LoginedView1Coordinator.init(navigator: rootNavigator!)
      self.nextCoordinator = nextCoordinator
      nextCoordinator.start()
    }
    else {
      print("ログアウト")
      logoutedNavigator = .init()
      window.rootViewController = logoutedNavigator!
      let nextCoordinator = LogoutView1Coordinator.init(navigator: logoutedNavigator!)
      self.nextCoordinator = nextCoordinator
      nextCoordinator.start()
    }
    window.makeKeyAndVisible()
  }

  @objc func reStartSelector() {
    start()
  }
}
