//
//  Untitled.swift
//  SweetSan
//
//  Created by 박성근 on 3/4/25.
//

import UIKit

final class CommonRectangleButton: UIButton {
  init(
    title: String = "",
    fontStyle: UIFont,
    titleColor: UIColor = .white,
    backgroundColor: UIColor,
    corners: [UIRectCorner] = [.allCorners],
    radius: CGFloat = 16
  ) {
    super.init(frame: .zero)
    
    setTitle(title, for: .normal)
    titleLabel?.font = fontStyle
    setTitleColor(titleColor, for: .normal)
    self.backgroundColor = backgroundColor
    cornerRadius(corners, radius: radius)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
