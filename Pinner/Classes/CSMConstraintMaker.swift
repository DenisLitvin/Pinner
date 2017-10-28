//
//  CSMConstraintManager.swift
//  testingAnchors
//
//  Created by macbook on 28.10.2017.
//  Copyright © 2017 macbook. All rights reserved.
//

import UIKit

public class CSMConstraintPinner {
    
    private var anchors: [Any] = []
    
    private var lastConstraint: NSLayoutConstraint?
    
    init() {
        
    }
    
    fileprivate func add(_ anchor: Any){
        anchors.append(anchor)
    }
    
    func equal(_ constant: CGFloat) {
        _ = equalAndReturn(constant)
    }
    
    func equalAndReturn(_ constant: CGFloat) -> NSLayoutConstraint {
        
        if let fromAnchor = anchors.first as? NSLayoutDimension {
            lastConstraint = fromAnchor.constraint(equalToConstant: constant)
        }
        iterateConstraint()
        return lastConstraint ?? NSLayoutConstraint()
    }
    
    
    func pin<T>(to anchor: NSLayoutAnchor<T>, const: CGFloat? = nil, mult: CGFloat? = nil, options: CSMConstraintOptions? = nil){
        
        _ = pinAndReturn(to: anchor, const: const, mult: mult, options: options)
    }
    func pinAndReturn<T>(to anchor: NSLayoutAnchor<T>, const: CGFloat? = nil, mult: CGFloat? = nil, options: CSMConstraintOptions? = nil) -> NSLayoutConstraint{
        
        if let firstAnchor = anchors.first as? NSLayoutAnchor<NSLayoutDimension>,
            let fromAnchor = firstAnchor as? NSLayoutDimension,
            let secondAnchor = anchor as? NSLayoutAnchor<NSLayoutDimension>,
            let toAnchor = secondAnchor as? NSLayoutDimension {
            constrainWithMultiplier(fromAnchor: fromAnchor, toAnchor: toAnchor, const: const, mult: mult, options: options)
        }
        else if let fromAnchor = anchors.first as? NSLayoutAnchor<T> {
            constrainWithConstant(fromAnchor: fromAnchor, toAnchor: anchor, const: const, options: options)
        }
        iterateConstraint()
        return lastConstraint ?? NSLayoutConstraint()
    }
    
    private func constrainWithConstant<T>(fromAnchor: NSLayoutAnchor<T>, toAnchor: NSLayoutAnchor<T>, const: CGFloat? = nil, mult: CGFloat? = nil, options: CSMConstraintOptions? = nil){
        
        switch options{
        case .none, .some(.equal):
            lastConstraint = fromAnchor.constraint(equalTo: toAnchor, constant: const ?? 0)
        case .some(.lessOrEqual):
            lastConstraint = fromAnchor.constraint(lessThanOrEqualTo: toAnchor, constant: const ?? 0)
        case .some(.moreOrEqual):
            lastConstraint = fromAnchor.constraint(greaterThanOrEqualTo: toAnchor, constant: const ?? 0)
        }
    }

    private func constrainWithMultiplier(fromAnchor: NSLayoutDimension, toAnchor: NSLayoutDimension, const: CGFloat? = nil, mult: CGFloat? = nil, options: CSMConstraintOptions? = nil){
        
        switch options{
        case .none, .some(.equal):
            lastConstraint = fromAnchor.constraint(equalTo: toAnchor, multiplier: mult ?? 1, constant: const ?? 0)
        case .some(.lessOrEqual):
            lastConstraint = fromAnchor.constraint(lessThanOrEqualTo: toAnchor, multiplier: mult ?? 1, constant: const ?? 0)
        case .some(.moreOrEqual):
            lastConstraint = fromAnchor.constraint(greaterThanOrEqualTo: toAnchor, multiplier: mult ?? 1, constant: const ?? 0)
        }
    }
    
    private func iterateConstraint(){
        lastConstraint?.isActive = true
        anchors.removeFirst()
    }
}

enum CSMConstraintOptions {
    
    case equal
    case lessOrEqual
    case moreOrEqual
}

enum CSMConstraintType {
    
    case top
    case leading
    case left
    case bottom
    case trailing
    case right
    
    case height
    case width
    
    case centerX
    case centerY
}

extension UIView {
    
    func makeConstraints(for constraints: CSMConstraintType..., closure: @escaping (CSMConstraintPinner) -> () ){
        
        let pinner = CSMConstraintPinner()
        translatesAutoresizingMaskIntoConstraints = false
        
        for constraint in constraints {
            switch constraint {
            case .top:
                pinner.add(topAnchor)
            case .left:
                pinner.add(leftAnchor)
            case.bottom:
                pinner.add(bottomAnchor)
            case .right:
                pinner.add(rightAnchor)
            case .leading:
                pinner.add(leadingAnchor)
            case .trailing:
                pinner.add(trailingAnchor)
            case .height:
                pinner.add(heightAnchor)
            case .width:
                pinner.add(widthAnchor)
            case .centerX:
                pinner.add(centerXAnchor)
            case .centerY:
                pinner.add(centerYAnchor)
            }
        }
        closure(pinner)
    }
}






