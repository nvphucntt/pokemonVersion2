//
//  ChatViewController.swift
//  PokemonVer2
//
//  Created by Van Phu on 17/7/26.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTappedBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func didTappdGo(_ sender: Any) {
        let chatVC = CouponViewController()
        self.navigationController?.pushViewController(chatVC, animated: true)
    }
    
    @IBAction func didTappdOpenAppstore(_ sender: Any) {
        if let url = URL(string: "https://www.itoyokado.co.jp/spe/chirashi_application/sorting/index.html") {
            UIApplication.shared.open(url)
        }
    }
}
