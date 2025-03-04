//
//  AlertView.swift
//  SweetSan
//
//  Created by 박성근 on 3/4/25.
//

import UIKit

import SnapKit

// TODO: Design -> Color Fix
class AlertView: UIView {
  // MARK: - Properties
  let labelContainerView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.cornerRadius([.topLeft, .topRight], radius: LayoutConstants.defaultRadius)
    return view
  }()
  
  let titleLabel: CommonLabel = CommonLabel(
    font: .bold,
    size: LayoutConstants.titleLabelFontSize
  )
  
  let leftButton: CommonRectangleButton = CommonRectangleButton(
    fontStyle: .regularFont(ofSize: LayoutConstants.defaultRadius),
    backgroundColor: .black,
    radius: 0
  )
  
  var rightbutton: CommonRectangleButton? = CommonRectangleButton(
    fontStyle: .boldFont(ofSize: LayoutConstants.defaultRadius),
    backgroundColor: .primary,
    radius: 0
  )
  
  let buttonStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.distribution = .fillEqually
    stackView.cornerRadius([.bottomLeft, .bottomRight], radius: LayoutConstants.defaultRadius)
    return stackView
  }()
  
  // MARK: - Initializer
  init(
    title: String,
    leftButtonTitle: String,
    rightbuttonTitle: String
  ) {
    titleLabel.updateTextKeepingAttributes(title)
    leftButton.setTitle(leftButtonTitle, for: .normal)
    
    if rightbuttonTitle.isEmpty {
      rightbutton = nil
    } else {
      rightbutton?.setTitle(rightbuttonTitle, for: .normal)
    }
    
    super.init(frame: .zero)
    
    setupViews()
    setupLayoutconstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Methods
  func setupLeftButtonAction(_ action: UIAction) {
    leftButton.addAction(action, for: .touchUpInside)
  }
}

// MARK: - Private Extenion
private extension AlertView {
  enum LayoutConstants {
    static let titleLabelFontSize: CGFloat = 20
    static let defaultPadding: CGFloat = 16
    static let defaultRadius: CGFloat = 16
    static let titleLabelPadding: CGFloat = 48
    static let buttonStackViewHeightRatio: CGFloat = 0.066
  }
  
  func setupViews() {
    backgroundColor = .black
    addSubview(labelContainerView)
    labelContainerView.addSubview(titleLabel)
    addSubview(buttonStackView)
    
    [leftButton, rightbutton]
      .compactMap { $0 }
      .forEach {
        buttonStackView.addArrangedSubview($0)
      }
  }
  
  func setupLayoutconstraints() {
    labelContainerView.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(LayoutConstants.defaultPadding)
      $0.leading.trailing.equalToSuperview().inset(LayoutConstants.titleLabelPadding)
    }
    
    buttonStackView.snp.makeConstraints {
      $0.top.equalTo(labelContainerView.snp.bottom)
      $0.leading.trailing.equalTo(labelContainerView)
      $0.height.equalToSuperview().multipliedBy(LayoutConstants.buttonStackViewHeightRatio)
    }
  }
}
