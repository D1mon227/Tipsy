//
//  CalculatorLogic.swift
//  Tipsy
//
//  Created by Dmitry Medvedev on 02.05.2023.
//

import UIKit

final class CalculatorLogic {
    
    var quantityOfPerson = 2
    var percentage = 0.0
    
    func getTips(bill: String) -> Double {
        var totalBill = 0.0
        if let bill = Double(bill) {
            totalBill = (bill * percentage) / Double(quantityOfPerson)
        }
        return totalBill
    }
}
