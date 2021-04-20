//
//  LoginViewController.swift
//  buffup-ios
//
//  Created by Eleftherios Charitou on 18/09/2019.
//  Copyright © 2019 BuffUp. All rights reserved.
//

import UIKit
import BuffSDK

class LoginViewController: PortraitViewController {
    
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var buttonsViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var buffLogo: UIImageView!
    @IBOutlet weak var buffLogoWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var buffChevron: UIImageView!
    @IBOutlet weak var chevronTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var sportLabel: UILabel!
    @IBOutlet weak var gamingLabel: UILabel!
    @IBOutlet weak var liveLabel: UILabel!
    @IBOutlet weak var gamingLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var liveLabelTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimations()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateIt()
    }
    
    private func setupAnimations() {
        buttonsViewBottomConstraint.constant = -buttonsView.frame.size.height*1.25
        buffLogoWidthConstraint.constant = 1
        gamingLabelTopConstraint.constant = 32
        liveLabelTopConstraint.constant = 24
        buffChevron.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        sportLabel.alpha = 0
        gamingLabel.alpha = 0
        liveLabel.alpha = 0
        buffChevron.alpha = 0
        self.view.layoutIfNeeded()
    }
    
    private func animateIt() {
        UIView.animateKeyframes(withDuration: 2.6, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2) {
                self.buffChevron.transform = CGAffineTransform(rotationAngle: 0)
                self.buffChevron.alpha = 1
                self.chevronTopConstraint.constant = -6
            }
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.25) {
                self.buffLogoWidthConstraint.constant = 117
                self.view.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.45, relativeDuration: 0.25) {
                self.buffChevron.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
                self.buffChevron.alpha = 0
                self.sportLabel.alpha = 1
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.25) {
                self.gamingLabelTopConstraint.constant = 8
                self.gamingLabel.alpha = 1
                self.view.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.25) {
                self.liveLabelTopConstraint.constant = 8
                self.liveLabel.alpha = 1
                self.view.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3) {
                self.buttonsViewBottomConstraint.constant = 8
                self.view.layoutIfNeeded()
            }
        }) { _ in

        }
    }
    
}

