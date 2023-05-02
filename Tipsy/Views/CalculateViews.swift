//
//  CalculateViews.swift
//  Tipsy
//
//  Created by Dmitry Medvedev on 02.05.2023.
//

import UIKit

final class CalculateViews {
    
    lazy var firstStack: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 26
        element.distribution = .fill
        return element
    }()
    
    lazy var bottomView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(hexString: "D7F9EB")
        return element
    }()
    
    lazy var calculateButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Calculate", for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        element.setTitleColor(UIColor(hexString: "F8FFFD"), for: .normal)
        element.backgroundColor = UIColor(hexString: "00B06B")
        return element
    }()
    
    lazy var billLabel: UILabel = {
        let element = UILabel()
        element.textAlignment = .left
        element.text = "Enter bill total"
        element.textColor = .lightGray
        element.font = UIFont.systemFont(ofSize: 25)
        return element
    }()
    
    lazy var billTextField: UITextField = {
        let element = UITextField()
        element.placeholder = "e.g. 123.56"
        element.font = UIFont.systemFont(ofSize: 40)
        element.textColor = UIColor(hexString: "00B06B")
        element.textAlignment = .center
        element.keyboardType = .decimalPad
        return element
    }()
    
    lazy var selectTipLabel: UILabel = {
        let element = UILabel()
        element.text = "Select tip"
        element.font = UIFont.systemFont(ofSize: 25)
        element.textColor = .lightGray
        return element
    }()
    
    lazy var firstStackInBottomView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 26
        element.alignment = .center
        element.distribution = .fillProportionally
        return element
    }()
    
    lazy var secondStackInBottomView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 0
        element.distribution = .fillProportionally
        return element
    }()
    
    lazy var zeroPercentageButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("0%", for: .normal)
        element.setTitleColor(UIColor(hexString: "00B06B"), for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        element.tintColor = UIColor(hexString: "00B06B")
        return element
    }()
    
    lazy var tenPercentageButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("10%", for: .normal)
        element.setTitleColor(UIColor(hexString: "00B06B"), for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        element.tintColor = UIColor(hexString: "00B06B")
        return element
    }()
    
    lazy var twentyPercentageButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("20%", for: .normal)
        element.setTitleColor(UIColor(hexString: "00B06B"), for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        element.tintColor = UIColor(hexString: "00B06B")
        return element
    }()
    
    lazy var chooseSplitLabel: UILabel = {
        let element = UILabel()
        element.text = "Choose Split"
        element.font = UIFont.systemFont(ofSize: 25)
        element.textColor = .lightGray
        return element
    }()
    
    lazy var thirdStackInBottomView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 27
        element.distribution = .fill
        element.alignment = .fill
        return element
    }()
    
    lazy var quantityLabel: UILabel = {
        let element = UILabel()
        element.text = "2"
        element.font = UIFont.systemFont(ofSize: 35)
        element.textColor = UIColor(hexString: "00B06B")
        return element
    }()
    
    lazy var stepper: UIStepper = {
        let element = UIStepper()
        element.value = 2
        element.minimumValue = 2
        element.maximumValue = 25
        element.stepValue = 1
        element.autorepeat = false
        return element
    }()
}
