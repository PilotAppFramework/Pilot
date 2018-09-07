//
//  LoginViewController.swift
//  App
//
//  Created by LXF on 2018/7/21.
//  Copyright © 2018年 LXF. All rights reserved.
//

import UIKit
import FastComponent
import Moya
import Async

class LoginViewController: XXBaseViewController {
    // <APIType>
//    open let api = AppProviderManager.makeProvider() as MoyaProvider<APIType>
    open let api = AppProviderManager.makeProvider() as MoyaProvider<AuthApi>
    
    var userNameTextField = UITextField.init().then {
        $0.xx.setUserNameStyle(placeholder: "手机号",keyboardType: .phonePad)

        $0.xx.setLeftImage(image: #imageLiteral(resourceName: "menu_我的-r"),s:10)
    }
    
    var passwordTextField = UITextField.init().then {
        $0.xx.setPasswordStyle()
        $0.xx.setLeftImage(image: #imageLiteral(resourceName: "menu_我的-r"),s:10)
    }
    
    var loginButton = XXButton.init().then {
        $0.backgroundColor = AC.mainColor
        $0.titleColor = AC.foregroundColor
        $0.title = "登陆"
        
        $0.setTitleColor(AC.lightText2Color, for: .disabled)
        
    }
    
    var refindPwdButton = UIButton.init(type: UIButtonType.roundedRect).then {
        $0.title = "忘记密码?"
        $0.titleColor = AC.lightTextColor
    }
    
    var auto:AutoNextGroup?
    
    override func prepareViewController() {
        
        userNameTextField.xx.add(dividerColor: UIColor.init("cbcaca")!,dividerWidth:1)
        passwordTextField.xx.add(dividerColor: UIColor.init("cbcaca")!,dividerWidth:1)
        
        view.addSubviews([
            userNameTextField,
            passwordTextField,
            loginButton,
            refindPwdButton
        ])
        
        let margin:CGFloat = 20
        let height:CGFloat = 40
        let itemPan:CGFloat = 20
        
        
        userNameTextField.snp.makeConstraints({ (make) in
            make.height.equalTo(height)
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(margin)
            make.right.equalToSuperview().offset(-margin)
        })
        passwordTextField.snp.makeConstraints({ (make) in
            make.height.equalTo(height)
            make.top.equalTo(userNameTextField.snp.bottom).offset(itemPan)
            make.left.equalToSuperview().offset(margin)
            make.right.equalToSuperview().offset(-margin)
        })
        loginButton.snp.makeConstraints({ (make) in
            make.height.equalTo(44)
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(margin)
            make.right.equalToSuperview().offset(-margin)
        })
    
        prepareEvent()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func prepareEvent(){
        userNameTextField.becomeFirstResponder()
        
//        auto = AutoNextGroup.init(textField: userNameTextField, textField2: passwordTextField, button: loginButton)
        
        let obsTub = AutoNextGroup.observeValid(textField: [
            (textField: userNameTextField, valid: XXRegexVerifyType.PhoneNumber.rawValue),
            (textField: passwordTextField, valid: XXRegexVerifyType.Password.rawValue),
        ], dispose: self.dispose)
        
        obsTub.validObservable.bind(to: loginButton.rx.isEnabled).disposed(by: self)
        
        obsTub.validObservable.bind(to: loginButton.rx.switchBgColor(enBG: AC.mainColor, disBG: AC.grayDividerColor)).disposed(by: self)
        
        obsTub.endNext?.subscribe(onNext: { [weak self](res) in
            self?.loginButton.sendActions(for: .touchUpInside)
            self?.loginButton.loading = true
        }).disposed(by: self)
        
        _ = self.loginButton.rx.tap.subscribe(onNext: {[weak self]() in
            self?.loginButton.loading = true
            
            self?.loginButtonClick()
        })
        
        if Env.DEBUG {
            self.userNameTextField.text = Env.Test.TEST_PHONE
            self.passwordTextField.text = Env.Test.TEST_PWD
        }
    }
    
    @objc func loginButtonClick(){
        
        guard let userName = userNameTextField.text?.trim.nilOrNotEmptyString,
            userName =~ "^.*?$" else{
                hud.showInfo(withStatus: "请输入正确的手机号..")
                loginButton.loading = false
                return;
        }
        
        guard let password = passwordTextField.text?.trim.nilOrNotEmptyString,
            password =~ "^.*?$"  else {
                hud.showInfo(withStatus: "密码格式不正确..")
                loginButton.loading = false
                return;
        }
        
        Async.main(after: 1) {
            self.loginButton.loading = false
            self.loginButton.flashMessage(message: "登陆失败~")
        }

        
        api.rx.request(AuthApi.auth(userName: userName, password: password))
        .mapJSON()
        
        // 登陆
//        api.rx.request(AuthApi.auth(userName: userName, password: password))
//            .mapModel(TokenData.self)
//            .subscribe(onSuccess: { (resp) in
//                AuthManager.shared.login(authData: resp)
//                HUD.showSuccess(withStatus: "登录成功.")
//                AppRoutes.shared.switchToAutoChooseVC()
//            }){ err in
////                showErrorHUD(err)
//                log.e(err)
//            }
//            .disposed(by: self)
    }
    
}

