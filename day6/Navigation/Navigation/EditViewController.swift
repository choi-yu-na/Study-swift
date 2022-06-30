//
//  EditViewController.swift
//  Navigation
//
//  Created by Dongduk3 on 2022/06/29.
//

import UIKit

protocol EditDelegate { //java 의 인터페이스와 비슷
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Int)
}

class EditViewController: UIViewController {

    //멤버변수는 무조건 초기화 해줘야함
    var textWayValue : String = ""
    var textMessage : String = ""
    var delegate: EditDelegate?
    
    var isOn = false
    var isZoom = 0
    //-1 축소, 0 아무것도 안누름, 1 확대
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIson: UISwitch!
    @IBOutlet var lblIson: UILabel!
    
    override func viewDidLoad() {
        //지역변수는 초기화 안해줘도됨
        
        super.viewDidLoad()
        
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIson.isOn = isOn
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func btnUpScaleImage(_ sender: UIButton) {
        if (isZoom != 1) {
          isZoom = 1
        } else {
            isZoom = 0
        }
            
    }
    
    
    @IBAction func btnDownScaleImage(_ sender: UIButton) {
        if (isZoom != -1) {
          isZoom = -1
        } else {
            isZoom = 0
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
