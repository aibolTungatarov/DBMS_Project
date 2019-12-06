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
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    var resultsList: [Result] = []
    var autoCompletionPossibilities: [String] = []
    var autoCompleteCharacterCount = 0
    var timer = Timer()
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        let title = "Find your passion"
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black ])
        lbl.numberOfLines = 0
        lbl.attributedText = attributedText
        return lbl
    }()
    
    lazy var firstSubjectTextField: UITextField = {
        let tf = PaddedTextField()
        let placeholderAttr = NSAttributedString(string: "First Subject", attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgbColor(r: 170, g: 170, b: 170, alpha: 1)])
        tf.attributedPlaceholder = placeholderAttr
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 35
        tf.layer.borderColor = UIColor.black.cgColor
        tf.borderStyle = .none
        tf.autocapitalizationType = .none
        tf.textColor = UIColor.rgbColor(r: 99, g: 99, b: 99, alpha: 1)
        return tf
    }()
    
    lazy var secondSubjectTextField: UITextField = {
        var tf = PaddedTextField()
        tf.borderStyle = .none
        tf.autocapitalizationType = .none
        let placeholderAttr = NSAttributedString(string: "Second Subject", attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgbColor(r: 170, g: 170, b: 170, alpha: 1)])
        tf.attributedPlaceholder = placeholderAttr
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 35
        tf.layer.borderColor = UIColor.black.cgColor
        tf.textColor = UIColor.rgbColor(r: 99, g: 99, b: 99, alpha: 1)
        return tf
    }()
    
    lazy var entScoreTextField: UITextField = {
        let tf = PaddedTextField(frame: .zero)
        tf.borderStyle = .none
        tf.autocapitalizationType = .none
        let placeholderAttr = NSAttributedString(string: "Exam Score", attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgbColor(r: 170, g: 170, b: 170, alpha: 1)])
        tf.attributedPlaceholder = placeholderAttr
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 35
        tf.layer.borderColor = UIColor.black.cgColor
        tf.textColor = UIColor.rgbColor(r: 99, g: 99, b: 99, alpha: 1)
        return tf
    }()
    
    lazy var townTextField: UITextField = {
        let tf = PaddedTextField(frame: .zero)
        tf.delegate = self
        tf.borderStyle = .none
        tf.autocapitalizationType = .none
        let placeholderAttr = NSAttributedString(string: "City", attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgbColor(r: 170, g: 170, b: 170, alpha: 1)])
        tf.attributedPlaceholder = placeholderAttr
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 35
        tf.layer.borderColor = UIColor.black.cgColor
        tf.textColor = UIColor.rgbColor(r: 99, g: 99, b: 99, alpha: 1)
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
        switchDemo.tintColor = .white
        switchDemo.isOn = false
        switchDemo.setOn(false, animated: false)
        switchDemo.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
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
            make.height.equalTo(70)
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
            make.height.equalTo(60)
        }
    }
    
    @objc func showResultsDidTaped() {
        validateFields()
        let firstSubject = firstSubjectTextField.text!
        let secondSubject = secondSubjectTextField.text!
        let city = townTextField.text!
        let resultsVC = ResultsViewController()
        getRecommendations(success: { results in
            resultsVC.resultsList = results
            self.navigationController?.pushViewController(resultsVC, animated: true)
        }, failure: {
            
        }, firstSubject: firstSubject, secondSubject: secondSubject, city: city)
    }
    
    func validateFields() {
        guard let _ = firstSubjectTextField.text, !firstSubjectTextField.text!.isEmpty else {
            return
        }
        
        guard let _ = secondSubjectTextField.text, !secondSubjectTextField.text!.isEmpty else {
            return
        }
        guard let _ = townTextField.text, !townTextField.text!.isEmpty else {
            return
        }
    }
    
    @objc func switchValueDidChange() {
        if (canRelocateSwitch.isOn){
            print("on")
        }
        else{
            print("off")
        }
    }
    
    func formatSubstring(subString: String) -> String {
        let formatted = String(subString.dropLast(autoCompleteCharacterCount)).lowercased().capitalized //5
        return formatted
    }
    
    
    
    func resetValues() {
        autoCompleteCharacterCount = 0
        townTextField.text = ""
    }
}

// MARK: Requests
extension ViewController {
    func getRecommendations(success: @escaping ([Result]) -> Void, failure: @escaping () -> Void, firstSubject: String, secondSubject: String, city: String) {
        getRecommendations(firstSubject: firstSubject, secondSubject: secondSubject, city: city)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { results in
                success(results)
            }, onError: { (error) in
                
            }).disposed(by: disposeBag)
    }
    
    func getRecommendations(firstSubject: String, secondSubject: String, city: String) -> Observable<[Result]> {
        return ApiClient.shared.request(ApiRouter.getRecommendations(firstSubject: firstSubject, secondSubject: secondSubject, city: city))
    }
    
}

//MARK: TextField Delegate
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { //1
        var subString = (textField.text!.capitalized as NSString).replacingCharacters(in: range, with: string) // 2
        subString = formatSubstring(subString: subString)
        
        if subString.count == 0 { // 3 when a user clears the textField
            resetValues()
        } else {
            searchAutocompleteEntriesWIthSubstring(substring: subString) //4
        }
        return true
    }
}
