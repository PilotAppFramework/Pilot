//
//  XXButon.swift
//  App
//
//  Created by LXF on 2018/9/7.
//  Copyright © 2018年 LXF. All rights reserved.
//

import UIKit
import FastComponent
import Async

open class XXButton: UIButton {
    
    
    public init() {
        super.init(frame: CGRect.zero)
        initButton()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    fileprivate func initButton(){
        
    }
    
    
    var activityIndicatorView:UIActivityIndicatorView = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
    
    

    enum LoadingState {
        case ready(String)
        case loading(String)
    }
    
    open func flashMessage(message:String,endString:String? = nil,after:Double=1){
        
        var endStr = title
        if let s  = endString{
            endStr = s
        }
        
        title = message
        
        Async.main(after: after) {
            UIView.animate(withDuration: 0.3, animations: {
                self.subviews.filter({$0 != self.activityIndicatorView}).forEach {
                    $0.alpha = 0.1
                }
            }, completion: { (end) in
                self.title = endStr
                
                self.subviews.filter({$0 != self.activityIndicatorView}).forEach {
                    $0.alpha = 0.1
                }
            
                UIView.animate(withDuration: 0.5, animations: {
                    self.subviews.filter({$0 != self.activityIndicatorView}).forEach {
                        $0.alpha = 1
                    }
                }, completion: { (end) in
                    
                })
            })
            
            
        }
    }
    
    var loading:Bool = false{
        
        didSet{
            if loading {
                self.isEnabled = false
                
                self.subviews.filter({$0 != activityIndicatorView}).forEach {
                    $0.alpha = 0
                }
                
                self.addSubview(activityIndicatorView)
                
                activityIndicatorView.snp.remakeConstraints { (make) in
                    make.center.equalToSuperview()
                }
                
                activityIndicatorView.sizeToFit()
                activityIndicatorView.hidesWhenStopped = true
                activityIndicatorView.startAnimating()
                
            }else{
                self.isEnabled = true
                
                self.subviews.filter({$0 != activityIndicatorView}).forEach {
                    $0.alpha = 1
                }
                
                activityIndicatorView.stopAnimating()
                


            }
        }
    }
    
    open override func sendActions(for controlEvents: UIControlEvents) {
        if loading == false {
            super.sendActions(for: controlEvents)
        }
    }

    
    enum BorderStyle {
        case rounded(CGFloat)
        case regularRounded
    }
    
    /// 默认正规圆角
    var borderStyle:BorderStyle = .regularRounded{
        didSet{
            layoutIfNeeded()
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        switch borderStyle {
        case .rounded(let r):
            self.clipsToBoundsCornerRadius =  r
        default:
            self.clipsToBoundsCornerRadius =  min(self.xx.width, self.xx.height) * 0.5
        }
        
    }
    
    
}
