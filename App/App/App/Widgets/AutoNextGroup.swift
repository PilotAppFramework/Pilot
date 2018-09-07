//
//  AutoNextGroup.swift
//  App
//
//  Created by LXF on 2018/9/7.
//  Copyright © 2018年 LXF. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import FastComponent

public class AutoNextGroup {
    
    //        everythingValid
    //            .bind(to: button.rx.isEnabled)
    //            .disposed(by: xx.dispose)
    //        textField.rx
    //            .controlEvent(.editingDidEndOnExit)
    //            .map({true})
    //            .bind(to: textField2.rx.isFirstResponder())
    //            .disposed(by: xx.dispose)
    //
    //        textField2.rx.controlEvent(.editingDidEndOnExit)
    //            .map({
    //                if button.isEnabled == false{
    //                    print("1111")
    //                }
    //                return button.isEnabled
    //            })
    //            .filter({return $0})
    //            .subscribe(onNext: { (_Bool) in
    //                button.sendActions(for: .touchUpInside)
    //            })
    //            .disposed(by: xx.dispose)
    
    public static func observeValid(textField:[(textField:UITextField,valid:String?)],dispose:DisposeBag) -> (endNext:Observable<Bool>?,validObservable:Observable<Bool>) {
        
        var validList:[Observable<Bool>] = []
        
        var endNext:Observable<Bool>?
        
        for index in 0..<textField.count {
            let elm = textField[index]
            
            let va:Observable<Bool> = elm.textField.rx.text.orEmpty
                .map { (str) -> Bool in
                    if let v = elm.valid {
                        return str =~ v
                    }
                    return false
                }.share(replay: 1)
            
            if let elmNext = textField.safe(index: index+1){
                elm.textField.rx
                    .controlEvent(.editingDidEndOnExit)
                    .map({true})
                    .bind(to: elmNext.textField.rx.isFirstResponder())
                    .disposed(by: dispose)
            }else{
                endNext = elm.textField.rx
                    .controlEvent(.editingDidEndOnExit)
                    .map({true})
            }
            
            validList.append(va)
        }
        
        let everythingValid = Observable.combineLatest(validList) { (vlist) in
            vlist.reduce(true, { $0 && $1 })
            }.share(replay: 1)
        
        return (endNext,everythingValid)
    }
    
    
    
    
    
//    private func init222(textField:UITextField,textField2:UITextField,button:UIButton) {
//
//
//        let _1Valid = textField.rx.text.orEmpty
//            .map {
//                $0 =~ .Email
//            }
//            .share(replay: 1)
//
//        let _2Valid = textField2.rx.text.orEmpty
//            .map {
//                $0 =~ .Password
//            }
//            .share(replay: 1)
//
//        let everythingValid = Observable.combineLatest(_1Valid, _2Valid) { $0 && $1 }
//            .share(replay: 1)
//
//        everythingValid
//            .bind(to: button.rx.isEnabled)
//            .disposed(by: xx.dispose)
//
//        textField.rx
//            .controlEvent(.editingDidEndOnExit)
//            .map({true})
//            .bind(to: textField2.rx.isFirstResponder())
//            .disposed(by: xx.dispose)
//
//        textField2.rx.controlEvent(.editingDidEndOnExit)
//            .map({
//                if button.isEnabled == false{
//                    print("1111")
//                }
//                return button.isEnabled
//            })
//            .filter({return $0})
//            .subscribe(onNext: { (_Bool) in
//                button.sendActions(for: .touchUpInside)
//            })
//            .disposed(by: xx.dispose)
//    }
    
}

