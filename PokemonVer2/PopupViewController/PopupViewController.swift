//
//  PopupViewController.swift
//  PokemonVer2
//
//  Created by Van Phu on 17/7/26.
//

import UIKit

protocol PopupDelegate: AnyObject{
    func dismiss()
    func popView()
    func usedCoupon()
}

class PopupViewController: UIViewController {

    weak var delegate: PopupDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTappedBackButton(_ sender: Any) {
        self.delegate?.dismiss()
        self.dismiss(animated: true)
    }
    
    @IBAction func backToChatView(_ sender: Any) {
        self.dismiss(animated: true)
        self.delegate?.popView()
    }
    
    @IBAction func useCoupon(_ sender: Any) {
        self.self.dismiss(animated: true)
        self.delegate?.usedCoupon()
    }
    
}
