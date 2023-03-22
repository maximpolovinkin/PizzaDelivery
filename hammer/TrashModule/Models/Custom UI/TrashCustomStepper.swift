//
//  TrashCustomStepper.swift
//  hammer
//
//  Created by Максим Половинкин on 17.03.2023.
//

import UIKit
//import SnapKit

final class TrashCustomStepper: UIControl {
    var currentValue = 1 {
        didSet {
            currentValue = currentValue > 0 ? currentValue : 0
            currentStepValueLabel.text = "\(currentValue)"
        }
    }
    var isIncremented = false
    var isDecremented = false

    private lazy var decreaseButton: UIButton = {
       let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()

    private lazy var currentStepValueLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.text = "\(currentValue)"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: UIFont.Weight.regular)
        
        return label
    }()

    private lazy var increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
       
        return button
    }()

    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
       
        return stackView
    }()

    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private
    private func setupViews() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 20

        addSubview(horizontalStackView)

        horizontalStackView.addArrangedSubview(decreaseButton)
        horizontalStackView.addArrangedSubview(currentStepValueLabel)
        horizontalStackView.addArrangedSubview(increaseButton)
    }

    private func setupContraints() {
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            horizontalStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        
    }

    //MARK: - Actions
    @objc private func buttonAction(_ sender: UIButton) {
        switch sender {
        case decreaseButton:
            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
            impactFeedbackgenerator.prepare()
            impactFeedbackgenerator.impactOccurred()
            currentValue -= 1
            isDecremented = true
            updateValue()
        case increaseButton:
            let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
            impactFeedbackgenerator.prepare()
            impactFeedbackgenerator.impactOccurred()
            currentValue += 1
            updateValue()
        default:
            break
        }
        sendActions(for: .touchUpInside)
    }
    
    private func updateValue() {
        currentStepValueLabel.text = "\(currentValue)"

        sendActions(for: .valueChanged)
    }
}
