//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Dmitry Medvedev on 02.05.2023.
//

import UIKit
import SnapKit

final class ResultViewController: UIViewController {
    
    private let resultViews = ResultsViews()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        addTargetForRecalculateButton()
    }
    
    func changeTipsLabel(bill: Double, tips: Double, quantityOfPersons: Int) {
        resultViews.tipsLabel.text = String(format: "%.2f", bill)
        resultViews.textLabel.text = "Split between \(quantityOfPersons) people, with \(Int(tips.rounded()))% tip."
    }
    
    private func addTargetForRecalculateButton() {
        resultViews.recalculateButton.addTarget(self, action: #selector(switchToCalculatorVC), for: .touchUpInside)
    }
    
    @objc private func switchToCalculatorVC() {
        dismiss(animated: true)
    }
}

extension ResultViewController {
    private func addViews() {
        view.backgroundColor = UIColor(hexString: "F8FFFD")
        view.addSubview(resultViews.topView)
        view.addSubview(resultViews.textLabel)
        view.addSubview(resultViews.recalculateButton)
        
        resultViews.topView.addSubview(resultViews.quantityPerson)
        resultViews.topView.addSubview(resultViews.tipsLabel)
        
        addConstraints()
    }
    
    private func addConstraints() {
        resultViews.topView.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.trailing.leading.top.equalToSuperview()
        }
        
        resultViews.quantityPerson.snp.makeConstraints { make in
            make.height.equalTo(36)
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        resultViews.tipsLabel.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(resultViews.quantityPerson.snp.bottom)
        }
        
        resultViews.textLabel.snp.makeConstraints { make in
            make.height.equalTo(117)
            make.leading.trailing.equalToSuperview().inset(50)
            make.top.equalTo(resultViews.topView.snp.bottom).inset(-5)
        }
        
        resultViews.recalculateButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(54)
            make.width.greaterThanOrEqualTo(200)
        }
    }
}
