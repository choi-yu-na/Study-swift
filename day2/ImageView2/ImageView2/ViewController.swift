//
//  ViewController.swift
//  ImageView2
//
//  Created by Dongduk3 on 2022/06/23.
//

import UIKit

class ViewController : UIViewController {
    
    var isZoom=false
    var imgOn:UIImage?
    var imgOff:UIImage?
    
    override func viewDidLoad() { //앱이 로딩이 됐을때 불러오는거임
        //앱이 뜨자마자 해야되는 작업들을 여기다가 하면 되는거임
        super.viewDidLoad()
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth : CGFloat, newHeight:CGFloat
        
        if(isZoom) {
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            
            btnResize.setTitle("확대", for: .normal)
            
        }
        else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            
            btnResize.setTitle("축소", for: .normal)
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        
        isZoom = !isZoom
    }
    @IBAction func switchImageOnOff(_ sender: UISwitch) { //연결된걸 누르면 그 객체가 sender로 들어가는거임
        if sender.isOn {
            imgView.image=imgOn
        } else {
            imgView.image=imgOff
        }
    }
    
    


}

