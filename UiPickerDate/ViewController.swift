//
//  ViewController.swift
//  UiPickerDate
//
//  Created by admin on 23.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var firstDate = Date()
    var secondDate = Date()
    var timer = Timer()
    

    
    let picker2 :UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .dateAndTime
        picker.preferredDatePickerStyle = .compact
        picker.minuteInterval = 1
        picker.timeZone = TimeZone.autoupdatingCurrent
        picker.locale = Locale.init(identifier: "en_gb")
        picker.addTarget(self, action: #selector(getSecondDate(sender:)), for: .valueChanged)
        return picker
    }()
    
    let label :UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 10
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        

        view.addSubview(picker2)
        view.addSubview(label)

      
        picker2.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            

            picker2.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            picker2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            picker2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            label.topAnchor.constraint(equalTo: picker2.bottomAnchor, constant: 30),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            label.heightAnchor.constraint(equalToConstant: 30),
        
        ])
        
    }
    

    
    @objc func getSecondDate (sender: UIDatePicker){
        
        secondDate  = sender.date
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.day, .hour, .minute]
        var difs = Calendar.current.dateComponents([.day,  .hour, .minute], from: firstDate, to: secondDate)
        label.text = formatter.string(from: difs)
    }
    
   



}

