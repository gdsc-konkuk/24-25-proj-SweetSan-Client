//
//  AlertViewController.swift
//  SweetSan
//
//  Created by 박성근 on 3/4/25.
//

import UIKit

import SnapKit

final class AlertViewController: UIViewController {
  // MARK: - Properties
  private let alertView: AlertView
  
  // MARK: - Initializer
  init(alertView: AlertView) {
    self.alertView = alertView
    
    super.init(nibName: nil, bundle: nil)
    modalPresentationStyle = .overCurrentContext
    modalTransitionStyle = .crossDissolve
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(alertView)
    setupAlertView()
  }
}

// MARK: - Private Extenion
private extension AlertViewController {
  func setupAlertView() {
    view.addSubview(alertView)
    
    alertView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
