//
//  AntigravityLoader.swift
//  AntigravityLoader
//
//  Created by raghu bansal on 28/11/25.
//

import Foundation
import UIKit

public class AntigravityLoader:UIView{
    
    private let animatedLayer = CAShapeLayer()
    private var fromValue:CGFloat = 0.0
    
    @IBInspectable open var lineWidth:CGFloat = 8
    @IBInspectable open var strokeColor:UIColor = UIColor.lightGray
    @IBInspectable open var selectedStrokeColor:UIColor = UIColor.blue
    @IBInspectable open var fillColor:UIColor = UIColor.clear
    @IBInspectable open var duration:CFTimeInterval = 3
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    
    private func setUp(){
        addLayer()
    }
    
    public func setProgress(toProgress progress : CGFloat){
        setAnimation(toValue: progress)
    }
    
    private func getPath()->UIBezierPath{
        let path = UIBezierPath(ovalIn: CGRect(x: 8, y: 8, width: bounds.width-16, height: bounds.height-16))
        return path
    }
    
    private func getLayer()->CAShapeLayer{
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = getPath().cgPath
        shapeLayer.lineWidth = lineWidth
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.fillColor = fillColor.cgColor
        return shapeLayer
    }
    
    private func getAnimatedLayer()->CAShapeLayer{
        animatedLayer.path = getPath().cgPath
        animatedLayer.lineWidth = lineWidth
        animatedLayer.strokeColor = selectedStrokeColor.cgColor
        animatedLayer.fillColor = fillColor.cgColor
        animatedLayer.strokeEnd = 0
        return animatedLayer
    }
    
    private func addLayer(){
        layer.addSublayer(getLayer())
        layer.addSublayer(getAnimatedLayer())
    }
    
    private func setAnimation(toValue:CGFloat){
        if let strokeEnd = animatedLayer.presentation()?.strokeEnd {
            animatedLayer.removeAllAnimations()
            animatedLayer.strokeEnd = strokeEnd
            fromValue = strokeEnd
        }
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animatedLayer.strokeEnd = toValue
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = duration
        animatedLayer.add(animation, forKey: "loader")
    }
}
