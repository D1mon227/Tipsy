//
//  ResultViews.swift
//  Tipsy
//
//  Created by Dmitry Medvedev on 02.05.2023.
//

import UIKit

final class ResultsViews {
    
    lazy var topView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(hexString: "D7F9EB")
        return element
    }()
    
    lazy var quantityPerson: UILabel = {
        let element = UILabel()
        element.text = "Total per person"
        element.textColor = UIColor(hexString: "959A99")
        element.font = UIFont.systemFont(ofSize: 30)
        element.textAlignment = .center
        return element
    }()
    
    lazy var tipsLabel: UILabel = {
        let element = UILabel()
        element.text = "56.32"
        element.font = UIFont.boldSystemFont(ofSize: 45)
        element.textColor = UIColor(hexString: "00B06B")
        element.textAlignment = .center
        return element
    }()
    
    lazy var textLabel: UILabel = {
        let element = UILabel()
        element.text = "Split between 2 people, with 10% tip."
        element.font = UIFont.systemFont(ofSize: 25)
        element.textColor = UIColor(hexString: "959A99")
        element.textAlignment = .center
        element.numberOfLines = 0
        return element
    }()
    
    lazy var recalculateButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Recalculate", for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        element.setTitleColor(UIColor(hexString: "F8FFFD"), for: .normal)
        element.backgroundColor = UIColor(hexString: "00B06B")
        return element
    }()
}
