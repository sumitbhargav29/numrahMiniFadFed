//
//  CircularProgressView.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 29/10/24.
//

import UIKit

class RotatingCircularLoaderView: UIView {
    
    private let progressLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    
    var progressColor: UIColor = .clrYellow {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    var trackColor: UIColor = .clrBackground {
        didSet {
            backgroundLayer.strokeColor = trackColor.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }
    
    private func setupLayers() {
        // Define a circular path
        let radius = min(bounds.width, bounds.height) / 2 - 10  
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: bounds.width / 2, y: bounds.height / 2),
                                        radius: radius,
                                        startAngle: -.pi / 2,
                                        endAngle: .pi * 1.5,
                                        clockwise: true)
        
        // Background Track Layer
        backgroundLayer.path = circularPath.cgPath
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.strokeColor = trackColor.cgColor
        backgroundLayer.lineWidth = 2
        layer.addSublayer(backgroundLayer)
        
        // Progress Layer
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        progressLayer.lineWidth = 4
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0
        layer.addSublayer(progressLayer)
    }
    
    func setProgress(_ progress: CGFloat, animated: Bool = true) {
        progressLayer.strokeEnd = progress
    }
    
    func startAnimating() {
        // Animate the progress layer to simulate loading
        let progressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        progressAnimation.fromValue = 0
        progressAnimation.toValue = 1
        progressAnimation.duration = 5.0 // Adjust as needed
        progressAnimation.repeatCount = .infinity
        progressLayer.add(progressAnimation, forKey: "progressAnimation")
        
        // Add rotation animation to rotate the entire view
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat.pi * 2
        rotationAnimation.duration = 3.5 // Adjust for desired rotation speed
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = .infinity
        self.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    func stopAnimating() {
        progressLayer.removeAnimation(forKey: "progressAnimation")
        self.layer.removeAnimation(forKey: "rotationAnimation")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayers() // Ensure layers are adjusted if view size changes
    }
}
