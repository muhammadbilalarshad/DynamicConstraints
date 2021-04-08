//
//  DynamicConstraint.swift
//  IclickIplaySample
//
//  Created by Bilal Arshad on 02/03/2021.
//  Copyright © 2021 Bilal Arshad. All rights reserved.
//

import Foundation
import UIKit

public class DynamicVerticalConstraint: NSLayoutConstraint {
    override init() {
        super.init()
        updateConstant()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        updateConstant()
    }
    
    public func updateConstant() {
        self.constant = self.constant * (UIScreen.main.bounds.height / 667)
        if (UIScreen.main.bounds.height < 650) {
            self.constant = self.constant/1.3
        }
    }
    
}

public class DynamicHorizontalConstraint: NSLayoutConstraint {
    override init() {
        super.init()
        updateConstant()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        updateConstant()
    }
    //It will send contraint constant according to devices. For this you have to set your contraint according to iPhone6/ iPhone 8
    public func updateConstant(){
        self.constant = self.constant * (UIScreen.main.bounds.width / 375)
    }
    
}


extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem ?? 0,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
