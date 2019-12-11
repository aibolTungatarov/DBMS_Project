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
import DLRadioButton

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    var resultsList: [Results] = []
    var cityAutoCompletionPossibilities: [String] = []
    var subjectAutoCompletionPossibilities: [String] = []
    var cityAutoCompleteCharacterCount = 0
    var firstAutoCompleteCharacterCount = 0
    var secondAutoCompleteCharacterCount = 0
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
        tf.delegate = self
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
        tf.delegate = self
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
    
    lazy var langTextField: UITextField = {
        let tf = PaddedTextField(frame: .zero)
        tf.borderStyle = .none
        tf.autocapitalizationType = .none
        let placeholderAttr = NSAttributedString(string: "Language: ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.rgbColor(r: 170, g: 170, b: 170, alpha: 1)])
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
    
    lazy var langLabel: UILabel = {
        let lbl = UILabel()
        let title = "Education languauge: "
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 20)!, NSAttributedString.Key.foregroundColor : UIColor.black ])
        lbl.numberOfLines = 0
        lbl.attributedText = attributedText
        return lbl
    }()
    
    lazy var kzButton: DLRadioButton = {
        var btn = DLRadioButton()
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCityList(success: { (list) in
            self.cityAutoCompletionPossibilities = list.data
            var index = 0
            for item in self.cityAutoCompletionPossibilities {
                self.cityAutoCompletionPossibilities[index] = item.capitalizingFirstLetter()
                print(self.cityAutoCompletionPossibilities[index])
                index += 1
            }
        }, failure: {
            
        }, interface_lang: "en")
        getSubjectList(success: { (list) in
            self.subjectAutoCompletionPossibilities = list.data
            var index = 0
            for item in self.subjectAutoCompletionPossibilities {
                self.subjectAutoCompletionPossibilities[index] = item.capitalizingFirstLetter()
                print(self.subjectAutoCompletionPossibilities[index])
                index += 1
            }
        }, failure: {
            
        }, interface_lang: "en")
        
        view.backgroundColor = .white
        setupViews()
        makeConstraints()
    }
    
    var intLangs : [String] = ["KZ","EN","RU"];
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupViews() {
        let picker = UIPickerView()
        picker.delegate   = self
        picker.dataSource = self
        self.langTextField.inputView = picker
        view.addSubview(langTextField)
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
        langTextField.snp.makeConstraints { (make) in
            make.top.equalTo(townTextField.snp.bottom).offset(20)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(firstSubjectTextField)
        }
        canRelocateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(langTextField.snp.bottom).offset(20)
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
        let firstSubject = firstSubjectTextField.text!.lowercased()
        let secondSubject = secondSubjectTextField.text!.lowercased()
        let city = canRelocateSwitch.isOn ? "ALL" : townTextField.text!
        let interfaceLang = langTextField.text!
        let score = Int(entScoreTextField.text!)
        getRecommendations(success: { results in
            let resultsVC = ResultsViewController()
            resultsVC.resultsList = results
            print("AIBOL MMMM", results[0].specialities[0].universities.count)
            self.navigationController?.pushViewController(resultsVC, animated: true)
        }, failure: {
            
        }, firstSubject: firstSubject, secondSubject: secondSubject, city: city, score: score ?? 0, interface_lang: interfaceLang)
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
        let formatted = String(subString.dropLast(cityAutoCompleteCharacterCount)).lowercased().capitalized //5
        return formatted
    }

    func searchAutocompleteEntriesWIthSubstring(type: AutocompleteTextFieldType, isCity: Bool, substring: String) {
        let userQuery = substring
        let suggestions = getAutocompleteSuggestions(isCity: isCity, userText: substring) //1
        if suggestions.count > 0 {
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: { (timer) in //2
                let autocompleteResult = self.formatAutocompleteResult(substring: substring, possibleMatches: suggestions) // 3
                self.putColourFormattedTextInTextField(type: type, autocompleteResult: autocompleteResult, userQuery : userQuery) //4
                self.moveCaretToEndOfUserQueryPosition(type: type, userQuery: userQuery) //5
            })
        } else {
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: { (timer) in //7
                switch (type) {
                    case AutocompleteTextFieldType.city:
                        self.townTextField.text = substring
                    case AutocompleteTextFieldType.firstSubject:
                        self.firstSubjectTextField.text = substring
                    case AutocompleteTextFieldType.secondSubject:
                        self.secondSubjectTextField.text = substring
                }
                
            })
            cityAutoCompleteCharacterCount = 0
        }
    }

    func getAutocompleteSuggestions(isCity: Bool, userText: String) -> [String]{
        var possibleMatches: [String] = []
        let list = isCity ? cityAutoCompletionPossibilities : subjectAutoCompletionPossibilities
        for item in list { //2
            let myString:NSString! = item as NSString
            let substringRange :NSRange! = myString.range(of: userText)
            if (substringRange.location == 0)
            {
                possibleMatches.append(item)
            }
        }
        return possibleMatches
    }

    func putColourFormattedTextInTextField(type: AutocompleteTextFieldType, autocompleteResult: String, userQuery : String) {
        let colouredString: NSMutableAttributedString = NSMutableAttributedString(string: userQuery + autocompleteResult)
        colouredString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: NSRange(location: userQuery.count,length:autocompleteResult.count))
        switch (type) {
        case AutocompleteTextFieldType.city:
            self.townTextField.attributedText = colouredString
        case AutocompleteTextFieldType.firstSubject:
            self.firstSubjectTextField.attributedText = colouredString
        case AutocompleteTextFieldType.secondSubject:
            self.secondSubjectTextField.attributedText = colouredString
        }
    }
    func moveCaretToEndOfUserQueryPosition(type: AutocompleteTextFieldType, userQuery : String) {
        switch (type) {
        case AutocompleteTextFieldType.city:
            if let newPosition = self.townTextField.position(from: self.townTextField.beginningOfDocument, offset: userQuery.count) {
                self.townTextField.selectedTextRange = self.townTextField.textRange(from: newPosition, to: newPosition)
            }
            let selectedRange: UITextRange? = townTextField.selectedTextRange
            townTextField.offset(from: townTextField.beginningOfDocument, to: (selectedRange?.start)!)
        case AutocompleteTextFieldType.firstSubject:
            if let newPosition = self.firstSubjectTextField.position(from: self.firstSubjectTextField.beginningOfDocument, offset: userQuery.count) {
                self.firstSubjectTextField.selectedTextRange = self.townTextField.textRange(from: newPosition, to: newPosition)
            }
            let selectedRange: UITextRange? = firstSubjectTextField.selectedTextRange
            firstSubjectTextField.offset(from: firstSubjectTextField.beginningOfDocument, to: (selectedRange?.start)!)
        case AutocompleteTextFieldType.secondSubject:
            if let newPosition = self.secondSubjectTextField.position(from: self.secondSubjectTextField.beginningOfDocument, offset: userQuery.count) {
                self.secondSubjectTextField.selectedTextRange = self.secondSubjectTextField.textRange(from: newPosition, to: newPosition)
            }
            let selectedRange: UITextRange? = secondSubjectTextField.selectedTextRange
            secondSubjectTextField.offset(from: secondSubjectTextField.beginningOfDocument, to: (selectedRange?.start)!)
        }
    }
    func formatAutocompleteResult(substring: String, possibleMatches: [String]) -> String {
        var autoCompleteResult = possibleMatches[0]
        autoCompleteResult.removeSubrange(autoCompleteResult.startIndex..<autoCompleteResult.index(autoCompleteResult.startIndex, offsetBy: substring.count))
        cityAutoCompleteCharacterCount = autoCompleteResult.count
//        isCity ? cityAutoCompletionPossibilities : subjectAutoCompletionPossibilities
        return autoCompleteResult
    }

    func resetValues(textField: UITextField) {
        cityAutoCompleteCharacterCount = 0
        textField.text = ""
    }
}

// MARK: Requests
extension ViewController {
    func getRecommendations(success: @escaping ([Results]) -> Void, failure: @escaping () -> Void, firstSubject: String, secondSubject: String, city: String, score: Int, interface_lang: String) {
        getRecommendations(firstSubject: firstSubject, secondSubject: secondSubject, city: city, score: score, interface_lang: interface_lang)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { results in
                success(results)
            }, onError: { (error) in
                
            }).disposed(by: disposeBag)
    }
    
    func getRecommendations(firstSubject: String, secondSubject: String, city: String,  score: Int, interface_lang: String) -> Observable<[Results]> {
        return ApiClient.shared.request(ApiRouter.getRecommendations(firstSubject: firstSubject, secondSubject: secondSubject, city: city, score: score, interface_lang: interface_lang))
    }
    
    func getCityList(success: @escaping (List) -> Void, failure: @escaping () -> Void, interface_lang: String) {
        getCityList(interface_lang: interface_lang)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { list in
                success(list)
            }, onError: { (error) in
                
            }).disposed(by: disposeBag)
    }
    
    func getCityList(interface_lang: String) -> Observable<List> {
        return ApiClient.shared.request(ApiRouter.getCityList(interface_lang: interface_lang))
    }
    
    func getSubjectList(success: @escaping (List) -> Void, failure: @escaping () -> Void, interface_lang: String) {
        getSubjectList(interface_lang: interface_lang)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { list in
                success(list)
            }, onError: { (error) in
                
            }).disposed(by: disposeBag)
    }
    
    func getSubjectList(interface_lang: String) -> Observable<List> {
        return ApiClient.shared.request(ApiRouter.getSubjectList(interface_lang: interface_lang))
    }
    
}

//MARK: TextField Delegate
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { //1
        var subString = (textField.text!.capitalized as NSString).replacingCharacters(in: range, with: string) // 2
        subString = formatSubstring(subString: subString)
        
        if subString.count == 0 { // 3 when a user clears the textField
            resetValues(textField: textField)
        } else {
            let isCity = textField.placeholder == "City" ? true : false
            var type: AutocompleteTextFieldType = .secondSubject
            if isCity {
                type = .city
            } else if textField.placeholder == "First Subject" {
                type = .firstSubject
            }
            searchAutocompleteEntriesWIthSubstring(type: type ,isCity: isCity, substring: subString) //4
        }
        return true
    }
}


//MARK: PickerView Delegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return self.intLangs.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.intLangs[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        self.langTextField.text = self.intLangs[row];
        self.langTextField.endEditing(true)
        self.getCityList(success: { (list) in
            self.cityAutoCompletionPossibilities = list.data
            var index = 0
            for item in self.cityAutoCompletionPossibilities {
                self.cityAutoCompletionPossibilities[index] = item.capitalizingFirstLetter()
                print(self.cityAutoCompletionPossibilities[index])
                index += 1
            }
        }, failure: {
            
        }, interface_lang: langTextField.text!)
        self.getSubjectList(success: { (list) in
            self.subjectAutoCompletionPossibilities = list.data
            var index = 0
            for item in self.subjectAutoCompletionPossibilities {
                self.subjectAutoCompletionPossibilities[index] = item.capitalizingFirstLetter()
                print(self.subjectAutoCompletionPossibilities[index])
                index += 1
            }
        }, failure: {
            
        }, interface_lang: langTextField.text!)
    }
}
