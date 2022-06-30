//
//  DetailViewController.swift
//  Table
//
//  Created by Dongduk3 on 2022/06/30.
//

import UIKit

class DetailViewController: UIViewController {

    var receiveItem = ""
    var receiveItemIndex = -1
    
    @IBOutlet var txItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txItem.text = receiveItem
    }
    
    func receiveItem(_ item: String)
    {
        receiveItem = item
    }

    @IBAction func btnEdit(_ sender: UIButton) {
        items.remove(at: receiveItemIndex)
        //print("ttt" + String(receiveItemIndex))
        items.insert(txItem.text!, at: receiveItemIndex)
        
        _ = navigationController?.popViewController(animated: true)
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
