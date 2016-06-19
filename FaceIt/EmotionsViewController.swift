//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by yishain chen on 2016/6/5.
//  Copyright © 2016年 yishain. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {
    private let emotionalFaces: Dictionary<String,FacialExpression> = [
        "angry" : FacialExpression(eyes: .Closed, eyesBrow: .Furrowed, mouth: .Frown),
        "happy" : FacialExpression(eyes: .Open, eyesBrow: .Normal , mouth: .Smile),
        "worried" : FacialExpression(eyes: .Open, eyesBrow: .Relaxed, mouth: .Smirk),
        "mischievious" : FacialExpression(eyes: .Open, eyesBrow: .Furrowed, mouth: .Grin)
    ]

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       var destinationvc = segue.destinationViewController
        if let navcon = destinationvc as? UINavigationController {
            destinationvc = navcon.visibleViewController ?? destinationvc
        }
        if let facevc = destinationvc as? FaceViewController {
            if let identifier = segue.identifier {
                if let expression = emotionalFaces[identifier] {
                    facevc.expression = expression
                    if let sendingButton = sender as? UIButton {
                        facevc.navigationItem.title = sendingButton.currentTitle
                    }
                }
            }
        }
    }
}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

