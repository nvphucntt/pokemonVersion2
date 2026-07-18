//
//  ViewController.swift
//  Pokemon
//
//  Created by Van Phu on 27/9/25.
//

import UIKit
import NVActivityIndicatorView

enum Status {
    case tab1
    case tab2
    case tab3
    case tab4
    case tab5
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tab01: UIView!
    
    @IBOutlet weak var tab012: UIView!
    
    @IBOutlet weak var tab013: UIView!
    
    @IBOutlet weak var tab02: UIView!
    @IBOutlet weak var tab03: UIView!
    @IBOutlet weak var tab04: UIView!
    @IBOutlet weak var tab05: UIView!
    @IBOutlet weak var tabbarImageView: UIImageView!
    
    @IBOutlet weak var tab3ScrollView: UIScrollView!
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var topLineView: UIView!
    
    let screenBounds = UIScreen.main.bounds
    var statusHome: Status = .tab1
    var activityIndicator: NVActivityIndicatorView!
    
    @IBOutlet weak var countOTP: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var tab2ExpandView: UIScrollView!
    
    @IBOutlet weak var noticeLabel: UILabel!
    
    @IBOutlet weak var constraintTabViewToTop: NSLayoutConstraint!
    
    @IBOutlet weak var constraintTabbarToBottom: NSLayoutConstraint!
    
    @IBOutlet weak var heightTopView: NSLayoutConstraint!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    var random = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tap)
        self.random = Int.random(in: 0...2)
        if DataStore.shared.currentDevice == .small_se || DataStore.shared.currentDevice == .small_6_7_8 {
            constraintTabbarToBottom.constant = -15
            constraintTabViewToTop.constant = -20
            heightTopView.constant = 20
        } else {
            constraintTabbarToBottom.constant = 0
            constraintTabViewToTop.constant = 0
            heightTopView.constant = 40
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.countOTP.text = "\(DataStore.shared.countPassword)"
        if DataStore.shared.maxCount == 0 {
            DataStore.shared.update(maxCount: 5)
        }
        if DataStore.shared.countPassword <= DataStore.shared.maxCount {
            self.emptyView.isHidden = !DataStore.shared.isAfterEventDate()
            self.noticeLabel.text = "App không còn hỗ trợ, vui lòng xóa app và tải lại."
        } else {
            self.noticeLabel.text = "Đã sử dụng hết \(DataStore.shared.maxCount) OTP cho ngày hôm nay. \n Vui lòng gỡ app và tải lại."
            self.emptyView.isHidden = false
        }
        self.loginView.isHidden = DataStore.shared.isLogin
        
        self.statusHome = .tab1
        self.configUI()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showLoadingView() {
        let frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        activityIndicator = NVActivityIndicatorView(frame: frame,
                                                    type: .ballSpinFadeLoader,
                                                    color: .red,
                                                    padding: 0)
        self.activityIndicator.stopAnimating()
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.activityIndicator.stopAnimating()
        }
    }
    
    func configUI() {
        
        switch self.statusHome {
        case .tab1:
            tab01.isHidden = !(random == 0)
            tab012.isHidden = !(random == 1)
            tab013.isHidden = !(random == 2)
            tab02.isHidden = true
            tab03.isHidden = true
            tab04.isHidden = true
            tab05.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_01")
        case .tab2:
            tab01.isHidden = true
            tab012.isHidden = true
            tab013.isHidden = true
            tab02.isHidden = false
            tab03.isHidden = true
            tab04.isHidden = true
            tab05.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_02")
        case .tab3:
            tab01.isHidden = true
            tab012.isHidden = true
            tab013.isHidden = true
            tab02.isHidden = true
            tab03.isHidden = false
            tab04.isHidden = true
            tab05.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_03")
        case .tab4:
            tab01.isHidden = true
            tab012.isHidden = true
            tab013.isHidden = true
            tab02.isHidden = true
            tab03.isHidden = true
            tab04.isHidden = false
            tab05.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_04")
        case .tab5:
            tab01.isHidden = true
            tab012.isHidden = true
            tab013.isHidden = true
            tab02.isHidden = true
            tab03.isHidden = true
            tab04.isHidden = true
            tab05.isHidden = false
            tabbarImageView.image = UIImage(named: "tab_home_05")
        }
    }
    
    @IBAction func didTapeedLogin(_ sender: Any) {
        let password = passwordTextField.text ?? ""
        let isValid = checkPassword(password, validView: loginView)
        if isValid {
            DataStore.shared.update(isLogin: isValid)
        } else {
            DataStore.shared.update(isLogin: false)
            showWrongPasswordAlert(on: self)
        }
    }
    
    @IBAction func didTappedTab01(_ sender: Any) {
        self.tab3ScrollView.setContentOffset(.zero, animated: false)
        self.statusHome = .tab1
        configUI()
    }
    
    @IBAction func didTappedTab2(_ sender: Any) {
        self.tab3ScrollView.setContentOffset(.zero, animated: false)
        self.statusHome = .tab2
        configUI()
    }
    
    @IBAction func didTappedTab03(_ sender: Any) {
        self.tab3ScrollView.setContentOffset(.zero, animated: false)
        self.statusHome = .tab3
        configUI()
    }
    
    @IBAction func didTappedTab04(_ sender: Any) {
        self.tab3ScrollView.setContentOffset(.zero, animated: false)
        self.statusHome = .tab4
        configUI()
    }
    
    @IBAction func didTappedTab05(_ sender: Any) {
        self.tab3ScrollView.setContentOffset(.zero, animated: false)
        self.statusHome = .tab5
        configUI()
    }
    
    @IBAction func didTappedChatIto(_ sender: Any) {
        let chatVC = ChatViewController()
        self.navigationController?.pushViewController(chatVC, animated: true)
    }
    
    @IBAction func checkCountLogin(_ sender: Any) {
        self.showCountLogin(on: self)
    }
    
    func checkPassword(_ password: String, validView: UIView) -> Bool {
        view.endEditing(true)
        if DataStore.shared.checkPass(pass: password) {
            showLoadingView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                validView.isHidden = true
            }
            return true
        } else {
            return false
        }
    }
    
    func showWrongPasswordAlert(on viewController: UIViewController) {
        let alert = UIAlertController(
            title: "ERROR",
            message: "OTP không chính xác \n Vui lòng thử lại.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alert, animated: true)
    }
    
    func showCountLogin(on viewController: UIViewController) {
        let total = DataStore.shared.maxCount
        let use = DataStore.shared.countPassword
        
        let alert = UIAlertController(
            title: "ERROR",
            message: "Đã sử dụng \(use)/ \(total) OTP \n Chỉ còn lại \(total - use) OTP",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alert, animated: true)
        // Tự đóng sau 3 giây
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            alert.dismiss(animated: true)
        }
    }
}

