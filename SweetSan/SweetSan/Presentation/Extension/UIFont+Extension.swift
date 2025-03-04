//
//  UIFont+Extension.swift
//  SweetSan
//
//  Created by 박성근 on 3/4/25.
//

import UIKit

extension UIFont {
  // TODO: SweetSan에 맞게 수정
  enum CustomFont: String {
    case regular = "NotoSans-KR"
    case bold = "NotoSans-KR-bold"
  }
  
  static func regularFont(
    ofSize size: CGFloat
  ) -> UIFont {
    return custom(.regular, size: size)
  }
  
  static func boldFont(
    ofSize size: CGFloat
  ) -> UIFont {
    return custom(.bold, size: size)
  }
  
  private static func custom(
    _ font: CustomFont,
    size: CGFloat
  ) -> UIFont {
    return UIFont(name: font.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
  }
}
