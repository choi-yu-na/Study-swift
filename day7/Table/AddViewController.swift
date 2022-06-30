//
//  AddViewController.swift
//  Table
//
//  Created by Dongduk3 on 2022/06/30.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 50
    
    var pickImageFileName = ""
    
    var imageArray = [UIImage?]()
    var imageFileName = ["cart.png","clock.png","pencil.png"]

    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }

        imageView.image = UIImage(named: imageFileName[0])
        pickImageFileName = imageFileName[0]
        
    }
    

    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(pickImageFileName)
        
        tfAddItem.text=""

        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickImageFileName = imageFileName[row]
        imageView.image = UIImage(named: imageFileName[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        print("row : \(row)")
        let imageView = UIImageView(image: imageArray[row])
        
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
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
