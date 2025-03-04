//
//  UIView+Extension.swift
//  SweetSan
//
//  Created by 박성근 on 3/4/25.
//

import UIKit

extension UIView {
  func cornerRadius(_ corners: [UIRectCorner] = [.allCorners], radius: CGFloat) {
    layer.masksToBounds = true
    layer.cornerCurve = .continuous
    layer.cornerRadius = radius
    
    guard corners != [.allCorners] else {
      return
    }
    
    var cornerMask = CACornerMask()
    
    corners.forEach { corner in
      switch corner {
      case .topLeft:     cornerMask.insert(.layerMinXMinYCorner)
      case .topRight:    cornerMask.insert(.layerMaxXMinYCorner)
      case .bottomLeft:  cornerMask.insert(.layerMinXMaxYCorner)
      case .bottomRight: cornerMask.insert(.layerMaxXMaxYCorner)
      default: return
      }
    }
    
    layer.maskedCorners = cornerMask
  }
}
