//
//  ResultTableViewCell.swift
//  DBMS_Project
//
//  Created by Aibol Tungatarov on 11/28/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    lazy var professionCodeLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "5B110300"
        return lbl
    }()
    lazy var professionNameLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Фармация"
        lbl.numberOfLines = 0
        return lbl
    }()
    lazy var universityNameLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Казахский национальный медицинский университет имени С. Д. Асфендиярова (КазНМУ)"
        lbl.numberOfLines = 0
        return lbl
    }()
    lazy var cityNameLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "Almaty"
        return lbl
    }()
    lazy var examScoreLabel: UILabel = {
        var lbl = UILabel()
        lbl.text = "99"
        return lbl
    }()
    lazy var professionCodeImageView: UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "code-signs")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    lazy var professionNameImageView: UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "profession")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    lazy var universityImageView: UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "university")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    lazy var locationImageView: UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "location")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    lazy var scoreImageView: UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "score")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configUI()
        self.makeConstraints()
    }
}


// MARK: ConfigUI and Constraints
extension ResultTableViewCell {
    func configUI() {
        addSubview(professionCodeLabel)
        addSubview(professionNameLabel)
        addSubview(universityNameLabel)
        addSubview(cityNameLabel)
        addSubview(examScoreLabel)
        addSubview(universityImageView)
        addSubview(professionCodeImageView)
        addSubview(professionNameImageView)
        addSubview(locationImageView)
        addSubview(scoreImageView)
    }
    
    func makeConstraints() {
        professionCodeImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(professionCodeLabel)
            make.left.equalTo(universityImageView)
            make.right.equalTo(professionCodeLabel.snp.left).offset(-10)
            make.width.height.equalTo(30)
        }
        professionCodeLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
        }
        professionNameImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(professionNameLabel)
            make.left.equalTo(universityImageView)
            make.width.height.equalTo(30)
        }
        professionNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(professionCodeLabel.snp.bottom).offset(20)
            make.right.equalTo(universityNameLabel)
            make.left.equalTo(professionNameImageView.snp.right).offset(10)
        }
        universityImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(universityNameLabel)
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(universityNameLabel.snp.left).offset(-10)
            make.width.height.equalTo(professionCodeImageView)
        }
        universityNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(professionNameLabel.snp.bottom).offset(20)
            make.right.equalToSuperview().offset(-10)
        }
        locationImageView.snp.makeConstraints { (make) in
            make.left.equalTo(professionCodeImageView)
            make.centerY.equalTo(cityNameLabel)
            make.width.height.equalTo(professionCodeImageView)
        }
        cityNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(universityNameLabel.snp.bottom).offset(20)
            make.right.equalTo(universityNameLabel)
            make.left.equalTo(locationImageView.snp.right).offset(10)
        }
        scoreImageView.snp.makeConstraints { (make) in
            make.left.equalTo(professionCodeImageView)
            make.centerY.equalTo(examScoreLabel)
            make.width.height.equalTo(professionCodeImageView)
        }
        examScoreLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cityNameLabel.snp.bottom).offset(20)
            make.right.equalTo(universityNameLabel)
            make.left.equalTo(scoreImageView.snp.right).offset(10)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
