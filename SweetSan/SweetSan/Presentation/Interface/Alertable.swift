//
//  Alertable.swift
//  SweetSan
//
//  Created by 박성근 on 3/4/25.
//

import UIKit

protocol Alertable {}

enum AlertType {
  case something
}

// TODO: 기획/디자인 후 수정 필요
extension Alertable where Self: UIViewController {
  func presentAlert(
    type: AlertType,
    leftButtonAction: @escaping () -> Void,
    rightButtonAction: @escaping () -> Void = {}
  ) {
    let alertView = CommonAlertView(
      title: "",
      message: "",
      leftButtonTitle: "",
      rightbuttonTitle: ""
    )
    let alertController = AlertViewController(alertView: alertView)
    
    alertView.setupLeftButtonAction(UIAction { _ in
      alertController.dismiss(animated: true)
      leftButtonAction()
    })
    
    alertView.setupRightButtonAction(UIAction { _ in
      alertController.dismiss(animated: true)
      rightButtonAction()
    })
    
    present(alertController, animated: true)
  }
}
