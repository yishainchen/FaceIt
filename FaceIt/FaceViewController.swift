//
//  ViewController.swift
//  FaceIt
//
//  Created by yishain chen on 2016/6/1.
//  Copyright © 2016年 yishain. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {

    var expression = FacialExpression(eyes: .Open,eyesBrow: .Normal, mouth: .Smile) {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var faceView: FaceView!
    private func updateUI() {
    
    }    
    
}

