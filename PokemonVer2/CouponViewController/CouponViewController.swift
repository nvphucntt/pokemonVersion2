//
//  CouponViewController.swift
//  PokemonVer2
//
//  Created by Van Phu on 17/7/26.
//

import UIKit

class CouponViewController: UIViewController {
    
    @IBOutlet weak var bgPopupView: UIView!
    
    @IBOutlet weak var couponOpenView: UIView!
    
    @IBOutlet weak var couponUsedView: UIView!
    
    @IBOutlet weak var arletImageView: UIImageView!
    
    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var constraintOpenToTop: NSLayoutConstraint!
    
    @IBOutlet weak var constraintUsedToTop: NSLayoutConstraint!
    
    @IBOutlet weak var constraintUsedToBot: NSLayoutConstraint!
    
    @IBOutlet weak var constraintOpenToBot: NSLayoutConstraint!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .darkContent
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arletImageView.isHidden = true
        bgPopupView.isHidden = true
        config()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.whiteView.isHidden = true
        }
    }
    @IBAction func didTappedBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTappdCoupon(_ sender: Any) {
        if !DataStore.shared.isUsedCoupon {
            bgPopupView.isHidden = false
            let popup = PopupViewController()
            popup.modalPresentationStyle = .overFullScreen
            popup.delegate = self
            self.present(popup, animated: true)
        }
    }
    
    func config() {
        if DataStore.shared.currentDevice == .small_se || DataStore.shared.currentDevice == .small_6_7_8 {
            constraintOpenToTop.constant = -15
            constraintUsedToTop.constant = -15
            constraintUsedToBot.constant = -15
            constraintOpenToBot.constant = -15
        } else {
            constraintOpenToTop.constant = 0
            constraintUsedToTop.constant = 0
            constraintUsedToBot.constant = 0
            constraintOpenToBot.constant = 0
        }
        
        couponOpenView.isHidden = DataStore.shared.isUsedCoupon
        couponUsedView.isHidden = !DataStore.shared.isUsedCoupon
    }
}

extension CouponViewController: PopupDelegate {
    func dismiss() {
        bgPopupView.isHidden = true
    }
    
    func popView() {
        self.navigationController?.popViewController(animated: false)
    }
    
    func usedCoupon() {
        let count = DataStore.shared.countPassword
        let x = count + 1
        DataStore.shared.update(countPassword: x)
        self.arletImageView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.arletImageView.isHidden = true
        }
        bgPopupView.isHidden = true
        self.config()
    }
}
