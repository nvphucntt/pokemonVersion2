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
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passEmailTextField: UITextField!
    
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
        let email = DataStore.shared.userName
        self.emailLabel.text = email
        self.userNameView.isHidden = (DataStore.shared.listUserName.contains(email))
        
        switch email {
        case "phudano1":
            DataStore.shared.allPass = DataStore.shared.allPass1
        case "phudano2":
            DataStore.shared.allPass = DataStore.shared.allPass2
        case "phudano3":
            DataStore.shared.allPass = DataStore.shared.allPass3
        case "phudano4":
            DataStore.shared.allPass = DataStore.shared.allPass4
        case "phudano5":
            DataStore.shared.allPass = DataStore.shared.allPass5
        case "phudano6":
            DataStore.shared.allPass = DataStore.shared.allPass6
        default:
            DataStore.shared.allPass = DataStore.shared.allPass1
        }
        
        self.emailTextField.text = DataStore.shared.userName
        
        self.isValidView.isHidden = true
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
    
    @IBAction func didTappedValidateUserName(_ sender: Any) {
        let email = self.emailTextField.text ?? ""
        let passEmail = self.passEmailTextField.text ?? ""
        if passEmail == DataStore.shared.currentPass() {
            if DataStore.shared.listUserName.contains(email) {
                switch email {
                case "phudano1":
                    DataStore.shared.allPass = DataStore.shared.allPass1
                case "phudano2":
                    DataStore.shared.allPass = DataStore.shared.allPass2
                case "phudano3":
                    DataStore.shared.allPass = DataStore.shared.allPass3
                case "phudano4":
                    DataStore.shared.allPass = DataStore.shared.allPass4
                case "phudano5":
                    DataStore.shared.allPass = DataStore.shared.allPass5
                case "phudano6":
                    DataStore.shared.allPass = DataStore.shared.allPass6
                default:
                    DataStore.shared.allPass = DataStore.shared.allPass1
                }
                
                showLoadingView()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.userNameView.isHidden = true
                }
                DataStore.shared.update(userName: email)
                self.emailLabel.text = email
            } else {
                self.userNameView.isHidden = true
                showWrongEmailAlert(on: self)
            }
        } else {
            self.userNameView.isHidden = true
            showWrongEmailAlert(on: self)
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
    
    func checkPassword(_ password: String, validView: UIView) -> Bool {
        view.endEditing(true)
        if DataStore.shared.checkPass(pass: password) {
            let count = DataStore.shared.countPassword
            let x = count + 1
            DataStore.shared.update(countPassword: x)
            
            showLoadingView()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                validView.isHidden = true
            }
            return true
        } else {
            validView.isHidden = true
            return false
        }
    }
    
    func showCouponAlert(on viewController: UIViewController) {
        let title = "クーポンを利用しますか"
        
        let message = """
        クーポンには当日まで有効なもの、制限時間内のみ有効なものがありますのでご注意ください。「利用する」を押下すると、もとに戻すことはできません。
        """
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let useAction = UIAlertAction(title: "利用する（元には戻せません)", style: .default) { _ in
            
            let homeVC = HomeViewController()
            self.navigationController?.pushViewController(homeVC, animated: false)
            self.tab3ScrollView.setContentOffset(.zero, animated: false)
        }
        
        let cancelAction = UIAlertAction(title: "キャンセル", style: .default) { _ in
            self.dismiss(animated: true)
        }
        
        alert.addAction(useAction)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true, completion: nil)
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
    
    func showWrongEmailAlert(on viewController: UIViewController) {
        let alert = UIAlertController(
            title: "ERROR",
            message: "Email hoặc mật khẩu không đúng \n Vui lòng thử lại.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alert, animated: true)
    }
}

