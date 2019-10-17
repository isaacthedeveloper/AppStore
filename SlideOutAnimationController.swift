//
//  SlideOutAnimationController.swift
//  AppStore
//
//  Created by Isaac Ballas on 2019-10-17.
//  Copyright © 2019 Isaacballas. All rights reserved.
//

import UIKit

class SlideOutAnimationController: NSObject,
                         UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext:UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.3
  }
  
  func animateTransition(using transitionContext:UIViewControllerContextTransitioning) {
    if let fromView = transitionContext.view(forKey:UITransitionContextViewKey.from) {
      let containerView = transitionContext.containerView
      let time = transitionDuration(using: transitionContext)
      UIView.animate(withDuration: time, animations: {
        fromView.center.y -= containerView.bounds.size.height
        fromView.transform = CGAffineTransform(scaleX: 0.5,y: 0.5)
      }, completion: { finished in
        transitionContext.completeTransition(finished)
      })
    }
  }
}





