//
//  StartDateCell.swift
//  Ryohiwaru
//
//  Created by 原暉 on 2020/04/06.
//  Copyright © 2020 原ひかる. All rights reserved.
//

import UIKit
import UIComponent

class StartDateCell: UITableViewCell {
    
    private let stackView: UIStackView = .init()
    private let startDateTextField: BorderTextField = .init()
    private let endDateTextField: BorderTextField = .init()
    private let startDatePicker: UIDatePicker = .init()
    private let endDatePicker: UIDatePicker = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setStartDatePicker()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayout()
        setStartDatePicker()
    }
    
    private func setLayout() {
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(startDateTextField)
        stackView.addArrangedSubview(endDateTextField)
        stackView.spacing = 12
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
        
        startDateTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startDateTextField.topAnchor.constraint(equalTo: stackView.topAnchor),
            startDateTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            startDateTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
        endDateTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            endDateTextField.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            endDateTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            endDateTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
    }
    
    private func setStartDatePicker() {
        startDatePicker.datePickerMode = .date
        startDatePicker.timeZone = NSTimeZone.local
        startDatePicker.locale = .current
        startDateTextField.inputView = startDatePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 40))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(startDone))
        toolBar.setItems([spaceItem, doneItem], animated: true)
        
        startDateTextField.inputAccessoryView = toolBar
    }
    
    private func setEndDatePicker() {
        endDatePicker.datePickerMode = .date
        endDatePicker.timeZone = NSTimeZone.local
        endDatePicker.locale = .current
        endDateTextField.inputView = endDatePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 40))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(endDone))
        toolBar.setItems([spaceItem, doneItem], animated: true)
        
        endDateTextField.inputAccessoryView = toolBar
    }
    
    @objc func startDone() {
        startDateTextField.endEditing(true)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        startDateTextField.text = "\(formatter.string(from: startDatePicker.date))"
    }
    
    @objc func endDone() {
        endDateTextField.endEditing(true)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        endDateTextField.text = "\(formatter.string(from: endDatePicker.date))"
    }
    
    func showTextField(expanded: Bool) {
        startDateTextField.isHidden = expanded ? false : true
        endDateTextField.isHidden = expanded ? false : true
    }
}
