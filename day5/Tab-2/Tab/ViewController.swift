//
//  ViewController.swift
//  Tab
//
//  Created by Dongduk3 on 2022/06/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex=1
    }
    
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex=2
    }
    
}

