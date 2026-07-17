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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgPopupView.isHidden = true
        config()
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
        self.arletImageView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.arletImageView.isHidden = true
        }
        DataStore.shared.isUsedCoupon = true
        bgPopupView.isHidden = true
        self.config()
    }
}
