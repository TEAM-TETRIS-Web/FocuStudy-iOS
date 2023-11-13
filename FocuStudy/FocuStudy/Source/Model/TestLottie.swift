//
//  ViewController.swift
//  FocuStudy
//
//  Created by 최유경 on 11/13/23.
//

import UIKit
import Lottie
import SwiftUI
//private var animationView: AnimationView?
var animationView = LottieAnimationView(name: "time")


class ViewController: UIViewController {
    override func viewDidLoad() {

      super.viewDidLoad()
      
      
    animationView.frame = view.bounds
            
        animationView.contentMode = .scaleAspectFit
            
        animationView.loopMode = .loop
            
        animationView.animationSpeed = 0.5
      
        view.addSubview(animationView)
            
        animationView.play()
      
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let animationView = LottieAnimationView(name: "time")
//        self.view.addSubview(animationView)
//
//        animationView.frame = CGRect(x:0, y:100, width:400, height:400)
//        animationView.contentMode = .scaleAspectFill
//        animationView.isUserInteractionEnabled = false
//                        
//        animationView.play{ (finished) in
//            animationView.removeFromSuperview()
//        }
//    }
}

