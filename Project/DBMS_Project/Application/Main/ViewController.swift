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

    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        let title = "Find your passion"
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black ])
        lbl.numberOfLines = 0
        lbl.attributedText = attributedText
        return lbl
    }()
    
    lazy var firstSubjectTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.autocapitalizationType = .none
        tf.textColor = UIColor.rgbColor(r: 99, g: 99, b: 99, alpha: 1)
        return tf
    }()
    
    lazy var secondSubjectTextField: UITextField = {
        var tf = UITextField()
        tf.borderStyle = .none
        tf.autocapitalizationType = .none
        tf.textColor = UIColor.rgbColor(r: 99, g: 99, b: 99, alpha: 1)
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var entScoreTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.autocapitalizationType = .none
        tf.textColor = UIColor.rgbColor(r: 99, g: 99, b: 99, alpha: 1)
        return tf
    }()
    
    lazy var townTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.autocapitalizationType = .none
        tf.textColor = UIColor.rgbColor(r: 99, g: 99, b: 99, alpha: 1)
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var showResultsBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = Constants.mainColor
        btn.setTitle("Show Results", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.semanticContentAttribute = .forceRightToLeft
        btn.addTarget(self, action: #selector(showResultsDidTaped), for: .touchUpInside)
        btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 5)
        let image = UIImage(named: "go")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(image, for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    lazy var canRelocateLabel: UILabel = {
        let lbl = UILabel()
        let title = "Can you relocate to another city: "
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 20)!, NSAttributedString.Key.foregroundColor : UIColor.black ])
        lbl.numberOfLines = 0
        lbl.attributedText = attributedText
        return lbl
    }()
    
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
        view.backgroundColor = UIColor.rgbColor(r: 232, g: 233, b: 237, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(firstSubjectTextField)
        view.addSubview(secondSubjectTextField)
        view.addSubview(entScoreTextField)
        view.addSubview(townTextField)
        view.addSubview(canRelocateLabel)
        view.addSubview(canRelocateSwitch)
        view.addSubview(showResultsBtn)
    }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        firstSubjectTextField.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(40)
        }
        secondSubjectTextField.snp.makeConstraints { (make) in
            make.top.equalTo(firstSubjectTextField.snp.bottom).offset(20)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(firstSubjectTextField)
        }
        entScoreTextField.snp.makeConstraints { (make) in
            make.top.equalTo(secondSubjectTextField.snp.bottom).offset(20)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(firstSubjectTextField)
        }
        townTextField.snp.makeConstraints { (make) in
            make.top.equalTo(entScoreTextField.snp.bottom).offset(20)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(firstSubjectTextField)
        }
        canRelocateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(townTextField.snp.bottom).offset(20)
            make.left.equalTo(titleLabel)
        }
        canRelocateSwitch.snp.makeConstraints { (make) in
            make.top.equalTo(canRelocateLabel)
            make.left.equalTo(canRelocateLabel.snp.right).offset(10)
            make.right.equalTo(titleLabel)
        }
        showResultsBtn.snp.makeConstraints { (make) in
            make.top.equalTo(canRelocateLabel.snp.bottom).offset(20)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(firstSubjectTextField)
        }
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
