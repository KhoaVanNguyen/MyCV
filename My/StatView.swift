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
    // MARK:- Properties and IBInspectable
    let percentLabel  = UILabel()
    let skillLable = UILabel()
    
    let bgLayer = CAShapeLayer()
    @IBInspectable var BGColor : UIColor = UIColor.gray{
        didSet{
            configure()
        }
    }
    let fgLayer = CAShapeLayer()
    @IBInspectable var FGColor : UIColor = UIColor.black{
        didSet{
            configure()
        }
    }
    @IBInspectable var SkillName : String = "Programming"{
        didSet{
            configure()
        }
    }
    @IBInspectable var PercentMargin : CGFloat = 0{
        didSet{
            configure()
        }
    }
    @IBInspectable var SkillNameMarginX : CGFloat = 0{
        didSet{
            configure()
        }
    }
    @IBInspectable var SkillNameMarginY : CGFloat = 20{
        didSet{
            configure()
        }
    }
    @IBInspectable var Total : CGFloat = 100{
        didSet{
            configure()
        }
    }
    @IBInspectable var CurrentValue : CGFloat = 100{
        didSet{
            configure()
        }
    }
    
    // MARK:- Awake and prepare
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        configure()
        
    }
    override func prepareForInterfaceBuilder() {
        setup()
        configure()
    }
    
    // MARK:- Setup
    func setup(){
        // setup background layer
        bgLayer.lineWidth = 20
        bgLayer.fillColor = nil
        bgLayer.strokeEnd = 1
        layer.addSublayer(bgLayer)
        
        // setup background layer
        fgLayer.lineWidth = 20
        fgLayer.fillColor = nil
        editPercent(range: Total, curValue: CurrentValue)
        layer.addSublayer(fgLayer)
        // setup percent label
        percentLabel.font = UIFont.systemFont(ofSize: 12)
        percentLabel.textColor = UIColor.white
        editPercent(range: Total, curValue: CurrentValue)
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(percentLabel)
        // setup skill name
        skillLable.font = UIFont.systemFont(ofSize: 12)
        editSkillName(skillName: SkillName)
        skillLable.textColor = UIColor.white
        skillLable.translatesAutoresizingMaskIntoConstraints = false
        addSubview(skillLable)
        
        // setup constraints 
        setupConstraints(PercentMargin,SkillNameMarginX,SkillNameMarginY)
    }
    func configure(){
        
        setupConstraints(PercentMargin,SkillNameMarginX,SkillNameMarginY)
        editSkillName(skillName: SkillName)
        editPercent(range: Total, curValue: CurrentValue)
      
        let percent = ( CurrentValue/Total ) * 100
        let percentString = String(format: "%.0f", percent)
        percentLabel.text = "\(percentString)%"
        bgLayer.strokeColor = BGColor.cgColor
        fgLayer.strokeColor = FGColor.cgColor
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
    
    func setupConstraints(_ percentMargin: CGFloat, _ skillNameMarginX: CGFloat, _ skillNameMarginY: CGFloat){
        // setup constraints
        let percentLabelCenterX = percentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let percentLabelCenterY = percentLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -percentMargin)
        
        NSLayoutConstraint.activate([percentLabelCenterX, percentLabelCenterY])
        
        let skillLabelCenterX = skillLable.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -skillNameMarginX)
        let skillLabelCenterY = skillLable.centerYAnchor.constraint(equalTo: self.bottomAnchor, constant: -skillNameMarginY)
        NSLayoutConstraint.activate([skillLabelCenterX, skillLabelCenterY])
    }
    func editSkillName(skillName : String){
        skillLable.text = skillName
    }
    func editPercent(range : CGFloat, curValue : CGFloat ){
        fgLayer.strokeEnd = CurrentValue/Total
        percentLabel.text = "\(CurrentValue)/\(Total)"
    }
}

