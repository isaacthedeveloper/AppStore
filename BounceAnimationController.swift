//
//  BounceAnimationController.swift
//  AppStore
//
//  Created by Isaac Ballas on 2019-10-17.
//  Copyright © 2019 Isaacballas. All rights reserved.
//

import UIKit
// Create a bounce animation.
class BounceAnimationController: NSObject,
UIViewControllerAnimatedTransitioning {
    // How long will it last?
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    // transitionContext parameter gives a reference to the new view controler and lets you know how large it should be.
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to), let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
            
            let containerView = transitionContext.containerView
            toView.frame = transitionContext.finalFrame(for:toViewController)
            containerView.addSubview(toView)
            toView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7) // scaled down to 70%
            // Animation begins.
            UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .calculationModeCubic, animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.334, animations: {
                                     toView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2) // Expands to 120%
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.334,relativeDuration: 0.333, animations: { // 1/3 of total animation time transitioning between sizes.
                                        toView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) // Down to 90%
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0.666, relativeDuration: 0.333, animations: {
                                        toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    })
            }, completion: { finished in
                transitionContext.completeTransition(finished)
            })
        }
    }
}
