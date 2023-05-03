//
//  ViewController.swift
//  Tipsy
//
//  Created by Dmitry Medvedev on 02.05.2023.
//

import UIKit
import SnapKit

final class CalculatorViewController: UIViewController {
    
    private let calculateViews = CalculateViews()
    private let resultViews = ResultsViews()
    private let calculatorLogic = CalculatorLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        addTargetsForButtons()
    }
    
    private func addTargetsForButtons() {
        calculateViews.zeroPercentageButton.addTarget(self, action: #selector(didTappedZero), for: .touchUpInside)
        calculateViews.tenPercentageButton.addTarget(self, action: #selector(didTappedTen), for: .touchUpInside)
        calculateViews.twentyPercentageButton.addTarget(self, action: #selector(didTappedTwenty), for: .touchUpInside)
        calculateViews.stepper.addTarget(self, action: #selector(splitStepper), for: .touchUpInside)
        calculateViews.calculateButton.addTarget(self, action: #selector(switchToResultVC), for: .touchUpInside)
    }
    
    @objc private func didTappedZero() {
        calculateViews.billTextField.endEditing(true)
        calculateViews.tenPercentageButton.isSelected = false
        calculateViews.twentyPercentageButton.isSelected = false
        calculateViews.zeroPercentageButton.isSelected = true
        calculatorLogic.percentage = 1.0
    }
    
    @objc private func didTappedTen() {
        calculateViews.billTextField.endEditing(true)
        calculateViews.zeroPercentageButton.isSelected = false
        calculateViews.twentyPercentageButton.isSelected = false
        calculateViews.tenPercentageButton.isSelected = true
        calculatorLogic.percentage = 1.1
    }
    
    @objc private func didTappedTwenty() {
        calculateViews.billTextField.endEditing(true)
        calculateViews.zeroPercentageButton.isSelected = false
        calculateViews.tenPercentageButton.isSelected = false
        calculateViews.twentyPercentageButton.isSelected = true
        calculatorLogic.percentage = 1.2
    }
    
    @objc private func splitStepper() {
        calculateViews.quantityLabel.text = String(Int(calculateViews.stepper.value))
        calculatorLogic.quantityOfPerson = Int(calculateViews.stepper.value)
        
    }
    
    @objc private func switchToResultVC() {
        let totalBill = calculatorLogic.getTips(bill: calculateViews.billTextField.text!)
        let percentage = (calculatorLogic.percentage - 1) * 100
        
        if calculateViews.billTextField.text == "" {
            showAlert(message: "Введите сумму")
        } else if calculateViews.zeroPercentageButton.isSelected == false && calculateViews.tenPercentageButton.isSelected == false && calculateViews.twentyPercentageButton.isSelected == false {
            showAlert(message: "Выберите размер чаевых")
        } else {
            let resultVC = ResultViewController()
            resultVC.changeTipsLabel(bill: totalBill, tips: percentage, quantityOfPersons: calculatorLogic.quantityOfPerson)
            resultVC.modalPresentationStyle = .fullScreen
            present(resultVC, animated: true)
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: message,
                                      message: "",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок",
                                   style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }

}

extension CalculatorViewController {
    private func addViews() {
        view.backgroundColor = UIColor(hexString: "F8FFFD")
        view.addSubview(calculateViews.firstStack)
        view.addSubview(calculateViews.bottomView)
        view.addSubview(calculateViews.calculateButton)
        
        calculateViews.firstStack.addArrangedSubview(calculateViews.billLabel)
        calculateViews.firstStack.addArrangedSubview(calculateViews.billTextField)
        
        calculateViews.bottomView.addSubview(calculateViews.firstStackInBottomView)
        
        calculateViews.firstStackInBottomView.addArrangedSubview(calculateViews.selectTipLabel)
        calculateViews.firstStackInBottomView.addArrangedSubview(calculateViews.secondStackInBottomView)
        calculateViews.firstStackInBottomView.addArrangedSubview(calculateViews.chooseSplitLabel)
        calculateViews.firstStackInBottomView.addArrangedSubview(calculateViews.thirdStackInBottomView)
        calculateViews.secondStackInBottomView.addArrangedSubview(calculateViews.zeroPercentageButton)
        calculateViews.secondStackInBottomView.addArrangedSubview(calculateViews.tenPercentageButton)
        calculateViews.secondStackInBottomView.addArrangedSubview(calculateViews.twentyPercentageButton)
        calculateViews.thirdStackInBottomView.addArrangedSubview(calculateViews.quantityLabel)
        calculateViews.thirdStackInBottomView.addArrangedSubview(calculateViews.stepper)
        addConstraints()
    }
    
    private func addConstraints() {
        calculateViews.firstStack.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(50)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        calculateViews.bottomView.snp.makeConstraints { make in
            make.bottom.trailing.leading.equalToSuperview()
            make.top.equalTo(calculateViews.firstStack.snp.bottom).inset(-40)
        }
        
        calculateViews.calculateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(54)
            make.width.greaterThanOrEqualTo(200)
        }
        
        calculateViews.billLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        calculateViews.billTextField.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(48)
        }
        
        calculateViews.firstStackInBottomView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(20)
        }
        
        calculateViews.secondStackInBottomView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
        
        calculateViews.selectTipLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        calculateViews.zeroPercentageButton.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.width.greaterThanOrEqualTo(60)
            make.width.equalTo(calculateViews.twentyPercentageButton.snp.width)
        }
        
        calculateViews.tenPercentageButton.snp.makeConstraints { make in
            make.height.equalTo(54)
        }
        
        calculateViews.twentyPercentageButton.snp.makeConstraints { make in
            make.height.equalTo(54)
        }
        
        calculateViews.chooseSplitLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        calculateViews.quantityLabel.snp.makeConstraints { make in
            make.height.equalTo(29)
            make.width.equalTo(93)
        }
        
        calculateViews.stepper.snp.makeConstraints { make in
            make.height.equalTo(29)
            make.width.equalTo(94)
        }
    }
}
