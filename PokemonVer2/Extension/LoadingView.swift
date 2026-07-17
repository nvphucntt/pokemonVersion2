//
//  LoadingView.swift
//  PokemonVer2
//
//  Created by Van Phu on 17/7/26.
//

import UIKit

class LoadingView: UIView {
    private let shapeLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        let radius: CGFloat = 14
        let center = CGPoint(x: 20, y: 20)

        // 40% của vòng tròn = 144°
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + (CGFloat.pi * 0.8) // 144°

        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )

        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 4
        shapeLayer.lineCap = .round

        layer.addSublayer(shapeLayer)

        startAnimating()
    }

    func startAnimating() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = CGFloat.pi * 2

        // Quay nhanh hơn
        rotation.duration = 0.4

        rotation.repeatCount = .infinity
        rotation.timingFunction = CAMediaTimingFunction(name: .linear)

        layer.add(rotation, forKey: "spin")
    }

    func stopAnimating() {
        layer.removeAnimation(forKey: "spin")
    }
}
