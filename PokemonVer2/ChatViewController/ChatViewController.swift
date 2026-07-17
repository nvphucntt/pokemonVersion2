//
//  ChatViewController.swift
//  PokemonVer2
//
//  Created by Van Phu on 17/7/26.
//

import UIKit
import NVActivityIndicatorView

class ChatViewController: UIViewController {

    var activityIndicator: NVActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTappedBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func didTappdGo(_ sender: Any) {
        let overlay = UIView(frame: view.bounds)
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.55)

        let spinner = LoadingView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        spinner.center = CGPoint(x: overlay.bounds.midX, y: overlay.bounds.midY - 10)

        let label = UILabel(frame: CGRect(x: 0, y: spinner.frame.maxY + 8, width: overlay.bounds.width, height: 20))
        label.text = "Đang tải..."
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center

        overlay.addSubview(spinner)
        overlay.addSubview(label)
        view.addSubview(overlay)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            overlay.isHidden = true
            let chatVC = CouponViewController()
            self.navigationController?.pushViewController(chatVC, animated: true)
        }
    }
    
    func showLoadingView() {
        let frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        activityIndicator = NVActivityIndicatorView(frame: frame,
                                                    type: .ballSpinFadeLoader,
                                                    color: .white,
                                                    padding: 0)
        self.activityIndicator.stopAnimating()
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.activityIndicator.stopAnimating()
            let chatVC = CouponViewController()
            self.navigationController?.pushViewController(chatVC, animated: true)
        }
    }
    
    @IBAction func didTappdOpenAppstore(_ sender: Any) {
        if let url = URL(string: "https://www.itoyokado.co.jp/spe/chirashi_application/sorting/index.html") {
            UIApplication.shared.open(url)
        }
    }
}
