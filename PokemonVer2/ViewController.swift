//
//  ViewController.swift
//  Pokemon
//
//  Created by Van Phu on 27/9/25.
//

import UIKit
import NVActivityIndicatorView

enum Status {
    case home
    case qr1
    case qr2
    case qrDone
    case home2
    case home4
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tab01: UIView!
    @IBOutlet weak var tab02: UIView!
    @IBOutlet weak var tab03: UIView!
    @IBOutlet weak var tab04: UIView!
    
    @IBOutlet weak var tabbarImageView: UIImageView!
    
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var qrButton: UIButton!
    @IBOutlet weak var numberQRImageView: UIImageView!
    
    @IBOutlet weak var firstTab3ImageView: UIImageView!
    
    @IBOutlet weak var tab3ScrollView: UIScrollView!
    
    @IBOutlet weak var isValidView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var topLineView: UIView!
    
    let screenBounds = UIScreen.main.bounds
    var statusHome: Status = .home
    var activityIndicator: NVActivityIndicatorView!
    var isExpandHome2: Bool = false
    
    @IBOutlet weak var countOTP: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var tab2CollapseView: UIImageView!
    @IBOutlet weak var tab2ExpandView: UIScrollView!
    
    @IBOutlet weak var constraintTab3FisrtTopTop: NSLayoutConstraint!
    @IBOutlet weak var constraintTab3FirstTopBottom: NSLayoutConstraint!
    
    @IBOutlet weak var constraintTab3_02_topTop: NSLayoutConstraint!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passEmailTextField: UITextField!
    
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
        
        self.isValidView.isHidden = DataStore.shared.isLogin
        self.emptyView.isHidden = !DataStore.shared.isAfterEventDate()
        
        self.statusHome = .home
        if DataStore.shared.isComplete {
            self.showLoadingView()
            
        } else {
            
        }
        self.configUI()
        self.numberQRImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        numberQRImageView.layer.cornerRadius = 32.5
        numberQRImageView.clipsToBounds = true
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
        self.isExpandHome2 = false
        
        switch self.statusHome {
        case .home:
            tab01.isHidden = false
            tab02.isHidden = true
            tab03.isHidden = true
            tab04.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_01")
        case .home2:
            tab01.isHidden = true
            tab02.isHidden = false
            tab03.isHidden = true
            tab04.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_02")
        case .qr1:
            tab01.isHidden = true
            tab02.isHidden = true
            tab03.isHidden = false
            tab04.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_03")
            constraintTab3FisrtTopTop.constant = 0
            self.constraintTab3FirstTopBottom.constant = 0
            self.firstTab3ImageView.isHidden = false
            self.constraintTab3FirstTopBottom.priority = UILayoutPriority(1000)
            self.constraintTab3_02_topTop.priority = UILayoutPriority(250)
            
            downloadButton.isUserInteractionEnabled = true
            qrButton.isUserInteractionEnabled = false
            qrButton.backgroundColor = UIColor.color(rgb: 0xD8D8D8)
            numberQRImageView.image = UIImage(named: "tab3_button_04")
            self.firstTab3ImageView.image = UIImage(named: "tab3_first")
        case .qr2:
            tab01.isHidden = true
            tab02.isHidden = true
            tab03.isHidden = false
            tab04.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_03")
            self.constraintTab3FisrtTopTop.constant = -0.5
            self.constraintTab3FirstTopBottom.constant = 0.5
            self.firstTab3ImageView.isHidden = false
            self.constraintTab3FirstTopBottom.priority = UILayoutPriority(1000)
            self.constraintTab3_02_topTop.priority = UILayoutPriority(250)
            
            downloadButton.isUserInteractionEnabled = true
            qrButton.isUserInteractionEnabled = true
            qrButton.backgroundColor = UIColor.color(rgb: 0xE60012)
            numberQRImageView.image = UIImage(named: "tab3_button_03")
            self.firstTab3ImageView.image = UIImage(named: "tab3_first_downloaded")
        case .home4:
            tab01.isHidden = true
            tab02.isHidden = true
            tab03.isHidden = true
            tab04.isHidden = false
            tabbarImageView.image = UIImage(named: "tab_home_04")
        case .qrDone:
            tab01.isHidden = true
            tab02.isHidden = true
            tab03.isHidden = false
            tab04.isHidden = true
            tabbarImageView.image = UIImage(named: "tab_home_03")
            
//            self.firstTab3ImageView.isHidden = true
//            self.constraintTab3FirstTopBottom.priority = UILayoutPriority(250)
//            self.constraintTab3_02_topTop.priority = UILayoutPriority(1000)
            downloadButton.isUserInteractionEnabled = true
            qrButton.isUserInteractionEnabled = false
            qrButton.backgroundColor = UIColor.color(rgb: 0xE60012)
            numberQRImageView.image = UIImage(named: "tab3_button_04")
            self.firstTab3ImageView.image = UIImage(named: "tab3_first_done")
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
                showWrongEmailAlert(on: self)
            }
        } else {
            showWrongEmailAlert(on: self)
        }
    }
    
    @IBAction func didTappedHomeButton(_ sender: Any) {
        self.tab3ScrollView.setContentOffset(.zero, animated: false)
        self.statusHome = .home
        configUI()
    }
    
    @IBAction func didTappedHome2Button(_ sender: Any) {
        self.tab3ScrollView.setContentOffset(.zero, animated: false)
        self.isExpandHome2 = false
        updateUIHome2()
        self.statusHome = .home2
        configUI()
    }
    
    @IBAction func didTappedQrButton(_ sender: Any) {
        if DataStore.shared.isComplete {
            self.statusHome = .qrDone
        } else {
            self.statusHome = .qr1
        }
        configUI()
    }
    
    @IBAction func didTappedHome4Button(_ sender: Any) {
        self.tab3ScrollView.setContentOffset(.zero, animated: false)
        self.statusHome = .home4
        configUI()
    }
    
    @IBAction func didTappedHome5Button(_ sender: Any) {
        if let url = URL(string: "https://auth.7id.omni7.jp/login-id/input?appid=bpc&userhash=GZKS74DFBQP6VCNTDWUWAER732PBZGPIV2AGS6I&ts=1762610319&tn=1762610319342GZKS74DFBQP6VCNTDWUWAER732PBZGPIV2AGS6I990&sig=2333f9b4d35c95909b17bfdb9827bee74a0a56de&ksappcd=03&ksappsitecd=0003&r_url=&utmparam=utm_campaign%3Diy_7mp%26utm_medium%3Dapp%26utm_source%3Dapp_iy") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func didTappedExpandHome2Button(_ sender: Any) {
        self.isExpandHome2 = true
        updateUIHome2()
    }
    
    func updateUIHome2() {
        if self.isExpandHome2 {
            tab2ExpandView.isHidden = false
            tab2CollapseView.isHidden = true
        } else {
            tab2ExpandView.isHidden = true
            tab2CollapseView.isHidden = false
        }
    }
    
    @IBAction func didTappedDownloadButton(_ sender: Any) {
        if self.statusHome == .qr1 {
            self.statusHome = .qr2
        } else if self.statusHome == .qr2 {
            self.statusHome = .qr1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.configUI()
        }
    }
    
    @IBAction func didTappedShowCoupon(_ sender: Any) {
        configUI()
        showCouponAlert(on: self)
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
            validView.isHidden = false
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

