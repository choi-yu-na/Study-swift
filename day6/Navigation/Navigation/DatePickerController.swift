//
//  DatePickerController.swift
//  Navigation
//
//  Created by Dongduk3 on 2022/06/29.
//

import UIKit

protocol DatePickerDelegate { //java 의 인터페이스와 비슷
    func didDatePickDone(_ controller: DatePickerController, message: String)
    
}


class DatePickerController: UIViewController {

    let timeSelector: Selector = #selector(DatePickerController.updateTime)
    let interval = 1.0
    var count = 0
    
    var currentTime = ""
    var pickerTime = ""
    
    var delegate: DatePickerDelegate?
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    @IBOutlet var view2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }


    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        //그냥 써도 되는데 상수로 만드는 이유?
        //sender는 변할수있는데 .. 변하지않게 하겠다는거 ..
        //더 좋은점이 있으니까 상수로 한거자나용? 뭐가 더 좋을까요?
        //방금 말햇자나 .. 변하게 한다면 컴파일러가 체크해주는거
        //이게 왜 필요하냐고..!
        //사람이 그렇게 실수를 한다는거에요.. 실수를 할 가능성을 막아준다
        //여기서는 읽어오는 용도니까 값만 받아온다
        
        let formatter = DateFormatter()
        
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm aaa"
        
        pickerTime = formatter.string(from: datePickerView.date)
        
        lblPickerTime.text = "선택시간 : " + pickerTime
    

        
    }
    
    @objc func updateTime() {
//        lblCurrentTime.text = String(count)
//        count = count + 1

        let date = NSDate()

        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy-MM-dd HH:mm aaa"

        currentTime = formatter.string(from: date as Date)

        lblCurrentTime.text =
        "현재시간 : " + currentTime

        var isSame = true

        if(currentTime == pickerTime) {
            let AlarmAlert = UIAlertController(title: "알림", message: "설정한 시간입니다", preferredStyle: UIAlertController.Style.alert)
            let alarmAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)

            AlarmAlert.addAction(alarmAction)

            present(AlarmAlert, animated: true, completion: nil)

            isSame = true
        }
        else {
            isSame = false
        }
    }
    @IBAction func btnDone(_ sender: UIButton) {
        
        delegate?.didDatePickDone(self, message: pickerTime)
        
        _ = navigationController?.popViewController(animated: true)
    }
    
}