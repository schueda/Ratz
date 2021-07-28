//
//  CustomProgessBar.swift
//  Ratz
//
//  Created by André Schueda on 28/07/21.
//

import Foundation
import UIKit

class CustomProgressBar: UIProgressView {
    override func layoutSubviews() {
           super.layoutSubviews()

           let maskLayerPath = UIBezierPath(roundedRect: bounds, cornerRadius: 4.0)
           let maskLayer = CAShapeLayer()
           maskLayer.frame = self.bounds
           maskLayer.path = maskLayerPath.cgPath
           layer.mask = maskLayer
       }
}
