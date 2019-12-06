//
//  ViewController.swift
//  DBMS_Project
//
//  Created by Aibol Tungatarov on 11/27/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

// first subject
// second subject
// ent score
// Town
// is he/she can relocate
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var titleLabel: UILabel!
    var firstSubjectTextField: UITextField!
    var secondSubjectTextField: UITextField!
    var entScoreTextField: UITextField!
    var townTextField: UITextField!
    var showResultsBtn: UIButton!
    var canRelocateLabel: UILabel!
    lazy var canRelocateSwitch: UISwitch = {
        let switchDemo = UISwitch()
        switchDemo.isOn = false
        switchDemo.setOn(false, animated: false)
        switchDemo.addTarget(self, action: Selector(("switchValueDidChange:")), for: .valueChanged)
        return switchDemo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupViews() {
        setupTitleLabel()
        setupFirstSubjectTextField()
        setupSecondSubjectTextField()
        setupEntScoreTextField()
        setupTownTextField()
        setupCanRelocateLabel()
        setupCanRelocateSwitch()
        setupShowResultsBtn()
    }
    
    
    func constraintsForTitleLabel() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    func constraintsForFirstSubjectTextField() {
        firstSubjectTextField.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(40)
        }
    }
    
    func constraintsForSecondSubjectTextField() {
        secondSubjectTextField.snp.makeConstraints { (make) in
            make.top.equalTo(firstSubjectTextField.snp.bottom).offset(20)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(firstSubjectTextField)
        }
    }
    
    func constraintsForEntScoreTextField() {
        entScoreTextField.snp.makeConstraints { (make) in
            make.top.equalTo(secondSubjectTextField.snp.bottom).offset(20)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(firstSubjectTextField)
        }
    }
    
    func constraintsForTownTextField() {
        townTextField.snp.makeConstraints { (make) in
            make.top.equalTo(entScoreTextField.snp.bottom).offset(20)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(firstSubjectTextField)
        }
    }
    
    func constraintsForCanRelocateLabel() {
        canRelocateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(townTextField.snp.bottom).offset(20)
            make.left.equalTo(titleLabel)
        }
    }
    
    func constraintsForCanRelocateSwitch() {
        canRelocateSwitch.snp.makeConstraints { (make) in
            make.top.equalTo(canRelocateLabel)
            make.left.equalTo(canRelocateLabel.snp.right).offset(10)
            make.right.equalTo(titleLabel)
        }
    }
    
    func constraintsForShowResultsBtn() {
        showResultsBtn.snp.makeConstraints {
            (make) in
            make.top.equalTo(canRelocateLabel.snp.bottom).offset(20)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(firstSubjectTextField)
        }
    }
    
    func makeConstraints() {
        constraintsForTitleLabel()
        constraintsForFirstSubjectTextField()
        constraintsForSecondSubjectTextField()
        constraintsForEntScoreTextField()
        constraintsForTownTextField()
        constraintsForCanRelocateLabel()
        constraintsForCanRelocateSwitch()
        constraintsForShowResultsBtn()
    }
    
    @objc func showResultsDidTaped() {
        let resultsVC = ResultsViewController()
        self.navigationController?.pushViewController(resultsVC, animated: true)
    }
    
    @objc func switchValueDidChange() {
        if (canRelocateSwitch.isOn){
            print("on")
        }
        else{
            print("off")
        }
    }
}


// view setups
extension ViewController {
    func setupTitleLabel() {
        titleLabel = UILabel()
        let title = "Find your passion"
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black ])
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = attributedText
        view.addSubview(titleLabel)
    }
    
    func setupFirstSubjectTextField() {
        firstSubjectTextField = UITextField()
        firstSubjectTextField.borderStyle = .none
        firstSubjectTextField.autocapitalizationType = .none
        let placeholderAttr = NSAttributedString(string: "First Subject", attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgbColor(r: 170, g: 170, b: 170, alpha: 1)])
        firstSubjectTextField.attributedPlaceholder = placeholderAttr
        firstSubjectTextField.textColor = UIColor.rgbColor(r: 99, g: 99, b: 99, alpha: 1)
        view.addSubview(firstSubjectTextField)
    }
    
    func setupSecondSubjectTextField() {
        secondSubjectTextField = UITextField()
        secondSubjectTextField.borderStyle = .none
        secondSubjectTextField.autocapitalizationType = .none
        let placeholderAttr = NSAttributedString(string: "Second Subject", attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgbColor(r: 170, g: 170, b: 170, alpha: 1)])
        secondSubjectTextField.attributedPlaceholder = placeholderAttr
        secondSubjectTextField.textColor = UIColor.rgbColor(r: 99, g: 99, b: 99, alpha: 1)
        secondSubjectTextField.isSecureTextEntry = true
        view.addSubview(secondSubjectTextField)
    }
    
    func setupEntScoreTextField() {
        entScoreTextField = UITextField()
        entScoreTextField.borderStyle = .none
        entScoreTextField.autocapitalizationType = .none
        let placeholderAttr = NSAttributedString(string: "Exam Score", attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgbColor(r: 170, g: 170, b: 170, alpha: 1)])
        entScoreTextField.attributedPlaceholder = placeholderAttr
        entScoreTextField.textColor = UIColor.rgbColor(r: 99, g: 99, b: 99, alpha: 1)
        view.addSubview(entScoreTextField)
    }
    
    func setupTownTextField() {
        townTextField = UITextField()
        townTextField.borderStyle = .none
        townTextField.autocapitalizationType = .none
        let placeholderAttr = NSAttributedString(string: "City", attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgbColor(r: 170, g: 170, b: 170, alpha: 1)])
        townTextField.attributedPlaceholder = placeholderAttr
        townTextField.textColor = UIColor.rgbColor(r: 99, g: 99, b: 99, alpha: 1)
        townTextField.isSecureTextEntry = true
        view.addSubview(townTextField)
    }
    
    func setupCanRelocateLabel() {
        canRelocateLabel = UILabel()
        let title = "Can you relocate to another city: "
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 20)!, NSAttributedString.Key.foregroundColor : UIColor.black ])
        canRelocateLabel.numberOfLines = 0
        canRelocateLabel.attributedText = attributedText
        view.addSubview(canRelocateLabel)
    }
    
    func setupCanRelocateSwitch() {
        view.addSubview(canRelocateSwitch)
    }
    
    func setupShowResultsBtn() {
        showResultsBtn = UIButton()
        showResultsBtn.backgroundColor = Constants.mainColor
        showResultsBtn.setTitle("Show Results", for: .normal)
        showResultsBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        showResultsBtn.layer.cornerRadius = 5
        showResultsBtn.clipsToBounds = true
        showResultsBtn.semanticContentAttribute = .forceRightToLeft
//        showResultsBtn.contentHorizontalAlignment = .left;
        showResultsBtn.addTarget(self, action: #selector(showResultsDidTaped), for: .touchUpInside)
//        showResultsBtn.contentEdgeInsets = UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30);
        showResultsBtn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 5)
//        showResultsBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (showResultsBtn.imageView?.frame.width ?? 0))
        let imageView = UIImageView()
        let image = UIImage(named: "go")?.withRenderingMode(.alwaysTemplate)
        imageView.image = image
        imageView.tintColor = .white
        showResultsBtn.setImage(imageView.image, for: .normal)
//        showResultsBtn.semanticContentAttribute = UIApplication.shared
//            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        view.addSubview(showResultsBtn)
    }
}
