//
//  CSMConstraintManager.swift
//  
//
//  Created by macbook on 28.10.2017.
//  Copyright © 2017 macbook. All rights reserved.
//

import UIKit

public class CSMConstraintMaker {
    
    private var currentAnchorIdx = 0
    private var anchors: [Any] = []
    private var constraints: [NSLayoutConstraint] = []
    
    fileprivate func add(_ anchor: Any){
        anchors.append(anchor)
    }
    
    public func returnAll() -> [NSLayoutConstraint] {
        return constraints
    }
    public func deactivate(_ i: Int) {
        NSLayoutConstraint.deactivate([constraints[i]])
    }
    public func deactivateAll() {
        NSLayoutConstraint.deactivate(constraints)
    }
    public func equal(_ constant: CGFloat) {
        _ = equalAndReturn(constant)
    }
    
    public func equalAndReturn(_ constant: CGFloat) -> NSLayoutConstraint {
        
        if let fromAnchor = anchors[currentAnchorIdx] as? NSLayoutDimension {
            constraints.append(fromAnchor.constraint(equalToConstant: constant))
        }
        iterateConstraint()
        return constraints.last!
    }
    
    @discardableResult
    public func pin<T>(to anchor: NSLayoutAnchor<T>,
                       const: CGFloat? = nil,
                       mult: CGFloat? = nil,
                       options: ConstraintOptions? = nil) -> NSLayoutConstraint
    {
        if  let fromAnchor = anchors[currentAnchorIdx] as? NSLayoutDimension,
            let toAnchor = anchor as? NSLayoutDimension
        {
            constrainDimensions(fromAnchor: fromAnchor, toAnchor: toAnchor, const: const, mult: mult, options: options)
        }
        else if let fromAnchor = anchors[currentAnchorIdx] as? NSLayoutAnchor<T> {
            constrainAxes(fromAnchor: fromAnchor, toAnchor: anchor, const: const, options: options)
        }
        iterateConstraint()
        return constraints.last!
    }
    
    private func constrainAxes<T>(fromAnchor: NSLayoutAnchor<T>, toAnchor: NSLayoutAnchor<T>, const: CGFloat? = nil, options: ConstraintOptions? = nil){
        
        switch options{
        case .none, .some(.equal):
            constraints.append(fromAnchor.constraint(equalTo: toAnchor, constant: const ?? 0))
        case .some(.lessOrEqual):
            constraints.append(fromAnchor.constraint(lessThanOrEqualTo: toAnchor, constant: const ?? 0))
        case .some(.moreOrEqual):
            constraints.append(fromAnchor.constraint(greaterThanOrEqualTo: toAnchor, constant: const ?? 0))
        }
    }
    
    private func constrainDimensions(fromAnchor: NSLayoutDimension, toAnchor: NSLayoutDimension, const: CGFloat? = nil, mult: CGFloat? = nil, options: ConstraintOptions? = nil){
        
        switch options{
        case .none, .some(.equal):
            constraints.append(fromAnchor.constraint(equalTo: toAnchor, multiplier: mult ?? 1, constant: const ?? 0))
        case .some(.lessOrEqual):
            constraints.append(fromAnchor.constraint(lessThanOrEqualTo: toAnchor, multiplier: mult ?? 1, constant: const ?? 0))
        case .some(.moreOrEqual):
            constraints.append(fromAnchor.constraint(greaterThanOrEqualTo: toAnchor, multiplier: mult ?? 1, constant: const ?? 0))
        }
    }
    
    private func iterateConstraint(){
        constraints.last?.isActive = true
        currentAnchorIdx += 1
    }
}

public enum ConstraintOptions {
    
    case equal
    case lessOrEqual
    case moreOrEqual
}

public enum ConstraintType {
    
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
    
    public func makeConstraints(for constraints: ConstraintType..., closure: @escaping (ConstraintMaker) -> () ){
        
        let maker = ConstraintMaker()
        translatesAutoresizingMaskIntoConstraints = false
        
        for constraint in constraints {
            switch constraint {
            case .top:
                maker.add(topAnchor)
            case .left:
                maker.add(leftAnchor)
            case.bottom:
                maker.add(bottomAnchor)
            case .right:
                maker.add(rightAnchor)
            case .leading:
                maker.add(leadingAnchor)
            case .trailing:
                maker.add(trailingAnchor)
            case .height:
                maker.add(heightAnchor)
            case .width:
                maker.add(widthAnchor)
            case .centerX:
                maker.add(centerXAnchor)
            case .centerY:
                maker.add(centerYAnchor)
            }
        }
        closure(maker)
    }
}
