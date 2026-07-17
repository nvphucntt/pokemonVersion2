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
    @IBOutlet weak var tab02: UIView!
    @IBOutlet weak var tab03: UIView!
    @IBOutlet weak var tab04: UIView!
    @IBOutlet weak var tab05: UIView!
    @IBOutlet weak var tabbarImageView: UIImageView!
    
    @IBOutlet weak var tab3ScrollView: UIScrollView!
    
    @IBOutlet weak var isValidView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var topLineView: UIView!
    
    let screenBounds = UIScreen.main.bounds
    var statusHome: Status = .tab1
    var activityIndicator: NVActivityIndicatorView!
    
    @IBOutlet weak var countOTP: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var tab2ExpandView: UIScrollView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.countOTP.text = "\(DataStore.shared.countPassword)"
        if DataStore.shared.checkIfOver24hTokyo() {
            DataStore.shared.update(isLogin: false)
        }
        
//        self.isValidView.isHidden = true
        self.emptyView.isHidden = true
        
        self.statusHome = .tab1
        if DataStore.shared.isComplete {
            self.showLoadingView()
            
        } else {
            
        }
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
            tab01.isHidden = false
            tab02.isHidden = true
            tab03.isHidden = true
            tab04.isHidden = true
            tab05.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_01")
        case .tab2:
            tab01.isHidden = true
            tab02.isHidden = false
            tab03.isHidden = true
            tab04.isHidden = true
            tab05.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_02")
        case .tab3:
            tab01.isHidden = true
            tab02.isHidden = true
            tab03.isHidden = false
            tab04.isHidden = true
            tab05.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_03")
        case .tab4:
            tab01.isHidden = true
            tab02.isHidden = true
            tab03.isHidden = true
            tab04.isHidden = false
            tab05.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_04")
        case .tab5:
            tab01.isHidden = true
            tab02.isHidden = true
            tab03.isHidden = true
            tab04.isHidden = true
            tab05.isHidden = false
            tabbarImageView.image = UIImage(named: "tab_home_05")
        }
    }
    
    @IBAction func didTapeedLogin(_ sender: Any) {
        let password = passwordTextField.text ?? ""
        let isValid = checkPassword(password, validView: isValidView)
        if isValid {
            DataStore.shared.update(lastLoginDate: Date())
        } else {
            showWrongPasswordAlert(on: self)
        }
        
        DataStore.shared.update(isLogin: isValid)
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
    
    func checkPassword(_ password: String, validView: UIView) -> Bool {
        view.endEditing(true)
        if DataStore.shared.checkPass(pass: password) {
            let count = DataStore.shared.countPassword
            let x = count + 1
            DataStore.shared.update(countPassword: x)
            
            showLoadingView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                validView.isHidden = true
            }
            return true
        } else {
            validView.isHidden = true
            return false
        }
    }
    
    func showWrongPasswordAlert(on viewController: UIViewController) {
        let alert = UIAlertController(
            title: "ERROR",
            message: "OTP đã được sử dụng \n Vui lòng thử lại.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alert, animated: true)
    }
}

