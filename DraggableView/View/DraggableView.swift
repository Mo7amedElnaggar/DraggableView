//
//  DraggableView.swift
//  DraggableView
//
//  Created by Mohamed El-Naggar on 2/15/21.
//

import UIKit

class DraggableView: UIView {
    
    var dismissDelegate: (() -> Void)?
    var indicatorToDismiss: CGFloat! , initialFrame: CGRect!
    
    var panGesture: UIPanGestureRecognizer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureTarget))
        
        self.addGestureRecognizer(panGesture)
        
        initialTheView()
        viewCorners()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        initialTheView()
        viewCorners()
    }
    
    func initialTheView() {
        initialFrame = self.frame
        indicatorToDismiss = initialFrame.midY
        
    }
    
    func viewCorners() {
        self.layer.cornerRadius = 38.0
    }
    
    @objc func panGestureTarget() {
        if panGesture.state == .ended {
            
            if self.frame.minY >= indicatorToDismiss {
                // Dismiss ViewController
                dismissDelegate?()
            } else {
                // Back to original DraggableView frames
                UIView.animate(withDuration: 0.3) {
                    self.frame = self.initialFrame
                }
            }
        }
        
        let trans = panGesture.translation(in: self)
        // Changes to minY frame after adding translation in Y to it
        let newYChanges = trans.y + self.frame.minY
        
        // trans > 0 : user swipe down to dismiss
        // else : user swipe up to back to the initial position
        if trans.y > 0 || newYChanges >= self.initialFrame.minY {
            self.center = CGPoint(x: self.center.x, y: self.center.y + trans.y)
            panGesture.setTranslation(.zero, in: self)
        }
    }
}
