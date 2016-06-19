//
//  ViewController.swift
//  FaceIt
//
//  Created by yishain chen on 2016/6/1.
//  Copyright © 2016年 yishain. All rights reserved.

import UIKit

class FaceViewController: UIViewController {
    // MARK : MODEL
    var expression = FacialExpression(eyes: .Closed ,eyesBrow: .Normal, mouth: .Smile) {
        didSet {
            updateUI() //Model changed, so change the view
        }
    }
    
    // MARK : VIEW
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.addGestureRecognizer(UIPanGestureRecognizer(
                target:  faceView,action: #selector(FaceView.changeScale(_:))
                ))
            let happierSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self,action: #selector(FaceViewController.increaseHappiness)
            )
            happierSwipeGestureRecognizer.direction = .Up
            faceView.addGestureRecognizer(happierSwipeGestureRecognizer)
            
            let sadderSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self,action: #selector(FaceViewController.decreaseHappiness)
            )
            happierSwipeGestureRecognizer.direction = .Down
            faceView.addGestureRecognizer(sadderSwipeGestureRecognizer)
            
            updateUI()
        }
    }
    
    private func updateUI() {
        if faceView != nil {
            switch expression.eyes {
            case .Open: faceView.eyeOpen = true
            case .Closed: faceView.eyeOpen = false
            case .Squinting: faceView.eyeOpen = false
            }
            faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
            faceView.eyeBrowTilt = eyeBrowTilts[expression.eyesBrow] ?? 0.0
            
        }
    }
    
    private var mouthCurvatures = [FacialExpression.Mouth.Frown:-1.0, .Grin:0.5, .Smile:-1.0, .Smirk:-0.5, .Neutral:0.0]
    private var eyeBrowTilts = [FacialExpression.EyeBrows.Relaxed:0.5, .Furrowed:-0.5, .Normal:0.0]
    
    func increaseHappiness() {
        expression.mouth = expression.mouth.happierMouth()
    }
    
    func decreaseHappiness() {
        expression.mouth = expression.mouth.sadderMouth()
    }
    
    
    @IBAction func toggleEyes(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .Ended {
            switch expression.eyes {
            case .Open: expression.eyes = .Closed
            case .Closed: expression.eyes = .Open
            case .Squinting: break
               
            }
        }
    }
    
//    func changeBrows(recognizer: UIRotationGestureRecognizer)  {
//        switch recognizer.state {
//        case .Changed,.Ended:
//            if recognizer.rotation > CGFloat(M_PI/4) {
//                expression.eyesBrow =
//                    expression.eyesBrows
//                
//            }
//        }
//    }
//    


    
}
