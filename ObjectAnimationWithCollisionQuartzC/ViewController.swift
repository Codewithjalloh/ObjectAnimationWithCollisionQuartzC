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
        let max: CGRect = UIScreen.mainScreen().bounds
        let snap1 = UISnapBehavior(item: self.mobBallgravity, snapToPoint: CGPointMake(max.size.width/2, max.size.height/2 - 50))
        
        let snap2 = UISnapBehavior(item: self.hackBombPush, snapToPoint: CGPointMake(max.size.width/2, max.size.height/2))
        
        let snap3 = UISnapBehavior(item: self.ironAttachment, snapToPoint: CGPointMake(max.size.width/2, max.size.height/2 + 50))
        
        snap1.damping = 1
        snap2.damping = 2
        snap3.damping = 4
        
        animator.addBehavior(snap1)
        animator.addBehavior(snap2)
        animator.addBehavior(snap3)
        
        
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
        let anchorPoint = CGPointMake(self.ironAttachment.center.x, self.ironAttachment.center.y)
        attachmentBahavior = UIAttachmentBehavior(item: self.ironAttachment, attachedToAnchor: anchorPoint)
        
        attachmentBahavior!.frequency = 0.5
        attachmentBahavior!.damping = 2
        attachmentBahavior!.length = 20
        
        animator.addBehavior(attachmentBahavior!)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }

    
    
    

    

}

