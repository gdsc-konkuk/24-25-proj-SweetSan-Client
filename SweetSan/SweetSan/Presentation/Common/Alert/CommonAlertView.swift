//
//  CommonAlertView.swift
//  SweetSan
//
//  Created by 박성근 on 3/4/25.
//

import UIKit

import SnapKit

final class CommonAlertView: AlertView {
  // MARK: - Properties
  private var messageLabel: CommonLabel? = CommonLabel(
    font: .regular,
    size: LayoutConstants.messageLabelFontSize,
    textColor: .black
  )
  
  // MARK: - Initializer
  init(
    title: String,
    message: String,
    leftButtonTitle: String,
    rightbuttonTitle: String
  ) {
    super.init(title: title, leftButtonTitle: leftButtonTitle, rightbuttonTitle: rightbuttonTitle)
    messageLabel?.text = message
    
    setupViews()
    setupLayoutconstraints()
    setupLabelSpacing()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Methods
  func setupRightButtonAction(_ action: UIAction) {
    guard let rightbutton else { return }
    rightbutton.addAction(action, for: .touchUpInside)
  }
}

// MARK: - Private Extenion
private extension CommonAlertView {
  func setupViews() {
    if let messageLabel, !(messageLabel.text ?? "").isEmpty {
      labelContainerView.addSubview(messageLabel)
    } else {
      messageLabel = nil
    }
    
    if (rightbutton?.titleLabel?.text ?? "").isEmpty {
      rightbutton = nil
    }
    
    [titleLabel, messageLabel]
      .forEach {
        $0?.textAlignment = .center
      }
  }
  
  func setupLayoutconstraints() {
    if let messageLabel {
      messageLabel.snp.makeConstraints {
        $0.top.equalTo(titleLabel.snp.bottom).offset(LayoutConstants.defaultPadding)
        $0.centerX.equalToSuperview()
        $0.bottom.equalToSuperview().offset(-LayoutConstants.defaultPadding)
      }
    } else {
      titleLabel.snp.makeConstraints {
        $0.bottom.equalToSuperview().offset(-LayoutConstants.defaultPadding)
      }
    }
  }
  
  func setupLabelSpacing() {
    guard let messageLabel else { return }
    messageLabel.setupLineSpacing()
  }
}

private extension CommonAlertView {
  enum LayoutConstants {
    static let messageLabelFontSize: CGFloat = 16
    static let defaultPadding: CGFloat = 16
  }
}
