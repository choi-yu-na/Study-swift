//
//  ViewController.swift
//  Navigation
//
//  Created by Dongduk3 on 2022/06/29.
//

import UIKit

class ViewController: UIViewController, EditDelegate, DatePickerDelegate{
    

    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var isZoom = 0
    
    @IBOutlet var ImgView: UIImageView!
    @IBOutlet var txMessage: UITextField!
    
    @IBOutlet var txDatePick: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        ImgView.image = imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier=="datePicker") {
            let datePickerController = segue.destination as! DatePickerController
            
            datePickerController.delegate = self
        }
        else {
            let editViewController = segue.destination as! EditViewController
            
            if segue.identifier == "editButton" {
                editViewController.textWayValue="segue : use button"
            } else if segue.identifier == "editBarButton" {
                editViewController.textWayValue="segue : use Bar button"
            }

            editViewController.textMessage = txMessage.text! // ! 붙는 이유는 txMessage도 ! 니까...!!!
            editViewController.delegate=self
            //
            editViewController.isOn=isOn
            editViewController.isZoom=isZoom
        }
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        
        if isOn {
            ImgView.image=imgOn
            self.isOn=true
        } else {
            ImgView.image=imgOff
            self.isOn=false
        }
    }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Int) {
        
        let scale: CGFloat = 2.0
        let newWidth: CGFloat, newHeight: CGFloat
        
        if (isZoom == 1) {
                newWidth = ImgView.frame.width * scale
                newHeight = ImgView.frame.height * scale
    
            self.isZoom = 1

        } else if (isZoom == -1) {
            newWidth = ImgView.frame.width / scale
            newHeight = ImgView.frame.height / scale
            
            self.isZoom = -1
        } else {
            newWidth = ImgView.frame.width
            newHeight = ImgView.frame.height
            
            self.isZoom = 0
        }
        
        ImgView.frame.size = CGSize(width: newWidth, height: newHeight)
        
        
    }
    
    func didDatePickDone(_ controller: DatePickerController, message: String) {
        txDatePick.text = message
    }


}

