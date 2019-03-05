//
//  CustomView.swift
//  RWBlueLibrary
//
//  Created by richard oh on 05/03/2019.
//  Copyright © 2019 Razeware LLC. All rights reserved.
//

import Foundation
import UIKit

// 선언부
class CustomView: UIView {
  
  // 2. 클래스에 delegate 프로퍼티 생성
  var delegate: CustomViewDelegate?
  
  // 3. delegate 인스턴스 메소드 실행
  override func layoutSubviews() {
    delegate?.viewFrameChanged(newFrame: self.frame)
  }
  
}

// 1. 프로토콜 생성
protocol CustomViewDelegate {
  func viewFrameChanged(newFrame: CGRect)
}
