//
//  StatView.swift
//  MyCV
//
//  Created by Khoa on 9/21/16.
//  Copyright © 2016 Khoa. All rights reserved.
//

import UIKit

@IBDesignable
class StatView: UIView {
    let percentLabel  = UILabel()
    let skillLable = UILabel()
    
    var range : CGFloat = 10
    var curValue : CGFloat = 0{
        didSet{
            configure()
        }
    }
    let margin: CGFloat = 10
    
    let bgLayer = CAShapeLayer()
    @IBInspectable var bgColor : UIColor = UIColor.gray{
        didSet{
            configure()
        }
    }
    let fgLayer = CAShapeLayer()
    @IBInspectable var fgColor : UIColor = UIColor.black{
        didSet{
            configure()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        configure()
        
    }
    override func prepareForInterfaceBuilder() {
        setup()
        configure()
    }
    func setup(){
        // setup background layer
        bgLayer.lineWidth = 20
        bgLayer.fillColor = nil
        bgLayer.strokeEnd = 1
        layer.addSublayer(bgLayer)
        
        // setup background layer
        fgLayer.lineWidth = 20
        fgLayer.fillColor = nil
        fgLayer.strokeEnd = 0.5
        layer.addSublayer(fgLayer)
        // setup percent label
        percentLabel.font = UIFont.systemFont(ofSize: 22)
        percentLabel.textColor = UIColor.white
        percentLabel.text = "0/12"
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(percentLabel)
        // setup skill name
        skillLable.font = UIFont.systemFont(ofSize: 18)
        skillLable.text = "Programming"
        skillLable.textColor = UIColor.white
        skillLable.translatesAutoresizingMaskIntoConstraints = false
        addSubview(skillLable)
        
        // setup constraints
        let percentLabelCenterX = percentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let percentLabelCenterY = percentLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -margin)
        
        NSLayoutConstraint.activate([percentLabelCenterX, percentLabelCenterY])
        
        let skillLabelCenterX = skillLable.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -margin)
        let skillLabelCenterY = skillLable.centerYAnchor.constraint(equalTo: self.bottomAnchor, constant: -margin)
        NSLayoutConstraint.activate([skillLabelCenterX, skillLabelCenterY])
    
    }
    func configure(){
        percentLabel.text = String(format: "%.0f/%.0f", curValue,range)
        bgLayer.strokeColor = bgColor.cgColor
        fgLayer.strokeColor = fgColor.cgColor
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupShapeLayer(bgLayer)
        setupShapeLayer(fgLayer)
        
    }
    func setupShapeLayer(_ shapeLayer : CAShapeLayer){
        shapeLayer.frame = self.bounds
        let startAngle = DegreesToRadians(135.0)
        let endAngle = DegreesToRadians(45.0)
        let center = percentLabel.center
        let radius = self.bounds.width * 0.35
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        shapeLayer.path = path.cgPath
    }
}

