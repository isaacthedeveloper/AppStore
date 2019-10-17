//
//  FadeOutAnimationController.swift
//  AppStore
//
//  Created by Isaac Ballas on 2019-10-17.
//  Copyright © 2019 Isaacballas. All rights reserved.
//

import UIKit

class FadeOutAnimationController: NSObject,UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext:UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.4
  }
  
  func animateTransition(using transitionContext:UIViewControllerContextTransitioning) {
    if let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) {
      let time = transitionDuration(using: transitionContext)
      UIView.animate(withDuration: time, animations: {
        fromView.alpha = 0
      }, completion: { finished in
        transitionContext.completeTransition(finished)
      })
    }
  }
}
