//
//  ViewController.swift
//  mission
//
//  Created by Dongduk3 on 2022/06/23.
//

import UIKit

class ViewController: UIViewController {

    var img1:UIImage?
    var img2:UIImage?
    var img3:UIImage?
    var img4:UIImage?
    var img5:UIImage?
    var img6:UIImage?

    var imgNum=1
    var imgString="img"
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var previousBtn: UIButton!
    @IBOutlet var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        img1 = UIImage(named: "1.png")
        img2 = UIImage(named: "2.png")
        img3 = UIImage(named: "3.png")
        img4 = UIImage(named: "4.png")
        img5 = UIImage(named: "5.png")
        img6 = UIImage(named: "6.png")
        
        imgView.image = img1
    }

    @IBAction func btnPrevious(_ sender: UIButton) {
        if(imgNum != 1) {
            imgNum -= 1
        }
        
        imgView.image = UIImage(named: String(imgNum) + ".png")
    }
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        if(imgNum != 6) {
            imgNum += 1
        }
        
        imgView.image = UIImage(named: String(imgNum) + ".png")
    }
    
}

