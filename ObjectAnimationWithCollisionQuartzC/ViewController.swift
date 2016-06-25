//
//  ViewController.swift
//  ObjectAnimationWithCollisionQuartzC
//
//  Created by wealthyjalloh on 25/06/2016.
//  Copyright © 2016 CWJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ironAttachment: UIButton!
    @IBOutlet weak var hackBombPush: UIButton!
    @IBOutlet weak var mobBallgravity: UIButton!
    
    var collision: UICollisionBehavior!
    var animator = UIDynamicAnimator()
    var attachmentBahavior: UIAttachmentBehavior? = nil
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: self.view)
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    
    // pan gesture recognizer
    @IBAction func handleAttchmentPanGesture(sender: AnyObject) {
        if((attachmentBahavior) != nil ) {
            attachmentBahavior?.anchorPoint = sender.locationInView(self.view)
        }
    
    }
    
    @IBAction func gravityButton(sender: AnyObject) {
        animator.removeAllBehaviors()
        
        let gravity = UIGravityBehavior(items: [self.ironAttachment, self.hackBombPush, self.ironAttachment])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [self.hackBombPush, self.mobBallgravity, self.ironAttachment])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        
    }
    
    @IBAction func pushButton(sender: AnyObject) {
        animator.removeAllBehaviors()
        let push = UIPushBehavior(items: [self.mobBallgravity, self.ironAttachment, self.hackBombPush], mode: .Instantaneous)
        push.magnitude = 2
        
        animator.addBehavior(push)
        
        collision = UICollisionBehavior(items: [self.hackBombPush, self.mobBallgravity, self.ironAttachment])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
    }
    
    
    @IBAction func attchmentButton(sender: AnyObject) {
        animator.removeAllBehaviors()
        
    }

    
    
    

    

}

