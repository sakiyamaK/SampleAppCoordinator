//
//  View2Controller.swift
//  SampleAppCoordinator
//
//  Created by sakiyamaK on 2020/05/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class View2Controller: UIViewController {

  var tapButton1: (()->Void)? = nil
  var tapButton2: (()->Void)? = nil

  deinit {
    print("\(type(of: self)): \(#function)")
  }

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    print("\(type(of: self)): \(#function)")
    self.view.backgroundColor = .green
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    super.loadView()
    print("\(type(of: self)): \(#function)")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    print("\(type(of: self)): \(#function)")

    do {
      let btn = UIButton.init()
      btn.setTitle("次へ3", for: .normal)

      self.view.addSubview(btn)

      btn.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        btn.widthAnchor.constraint(equalToConstant: 100),
        btn.heightAnchor.constraint(equalToConstant: 100),
        btn.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 1.0),
        btn.centerYAnchor.constraint(equalToSystemSpacingBelow: self.view.centerYAnchor, multiplier: 1.0)
      ])
      btn.addTarget(self, action: #selector(tapButton1Selector), for: .touchUpInside)
    }
    do {
      let btn = UIButton.init()
      btn.setTitle("次へ4", for: .normal)

      self.view.addSubview(btn)

      btn.translatesAutoresizingMaskIntoConstraints = false
      let centerYAnchor = btn.centerYAnchor.constraint(equalToSystemSpacingBelow: self.view.centerYAnchor, multiplier: 1.0)
      centerYAnchor.constant = 100
      NSLayoutConstraint.activate([
        btn.widthAnchor.constraint(equalToConstant: 100),
        btn.heightAnchor.constraint(equalToConstant: 100),
        btn.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 1.0),
        centerYAnchor
      ])
      btn.addTarget(self, action: #selector(tapButton2Selector), for: .touchUpInside)
    }
  }

  @objc func tapButton1Selector() {
    tapButton1?()
  }

  @objc func tapButton2Selector() {
    tapButton2?()
  }
}
