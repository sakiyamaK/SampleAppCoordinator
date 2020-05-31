//
//  View2Controller.swift
//  SampleAppCoordinator
//
//  Created by sakiyamaK on 2020/05/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class View2Controller: UIViewController {

  var tapButton:(()->Void)? = nil

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
    
    let btn = UIButton.init()
    btn.setTitle("次へ", for: .normal)

    self.view.addSubview(btn)

    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
    btn.heightAnchor.constraint(equalToConstant: 100).isActive = true
    btn.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 1.0).isActive = true
    btn.centerYAnchor.constraint(equalToSystemSpacingBelow: self.view.centerYAnchor, multiplier: 1.0).isActive = true
    btn.addTarget(self, action: #selector(tapButtonSelector), for: .touchUpInside)
  }

  @objc func tapButtonSelector() {
    tapButton?()
  }
}
