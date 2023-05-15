//
//  MainViewController.swift
//  SwiftSocket
//
//  Created by 김소현 on 2023/05/09.
//

import UIKit

class MainViewController: UIViewController, UITextViewDelegate {
    @Published var inputText: String = ""
    @Published var outputText: String = ""
    
    private let firstTopTextLabel: UILabel = {
           let label = UILabel()
           label.text = "Full Stack Service"
           label.textColor = .darkGray
           label.textAlignment = .center
           label.font = .systemFont(ofSize: 30, weight: .bold)
           return label
       }()
    
    private let secondTopTextLabel: UILabel = {
           let label = UILabel()
           label.text = "Networking"
           label.textColor = .black
           label.textAlignment = .center
           label.font = .systemFont(ofSize: 30, weight: .bold)
           return label
       }()
    
    private var outputTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 15, weight: .regular)
        
        textView.isUserInteractionEnabled = false
        textView.layer.cornerRadius = 0
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.black.cgColor
        return textView
    }()
    
    private let firstBottomTextLabel: UILabel = {
           let label = UILabel()
           label.text = "iOS Swift"
           label.textColor = .black
           label.textAlignment = .center
           label.font = .systemFont(ofSize: 28, weight: .bold)
           return label
       }()
    
    private let secondBottomTextLabel: UILabel = {
           let label = UILabel()
           label.text = "Socket Programming"
           label.textColor = .darkGray
           label.textAlignment = .center
           label.font = .systemFont(ofSize: 28, weight: .bold)
           return label
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [firstTopTextLabel, secondTopTextLabel, outputTextView, firstBottomTextLabel, secondBottomTextLabel].forEach {
            view.addSubview($0)
        }
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        firstTopTextLabel.translatesAutoresizingMaskIntoConstraints = false
        secondTopTextLabel.translatesAutoresizingMaskIntoConstraints = false
        outputTextView.translatesAutoresizingMaskIntoConstraints = false
        firstBottomTextLabel.translatesAutoresizingMaskIntoConstraints = false
        secondBottomTextLabel.translatesAutoresizingMaskIntoConstraints = false

        firstTopTextLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -200).isActive = true
        firstTopTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        firstTopTextLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        secondTopTextLabel.leadingAnchor.constraint(equalTo: firstTopTextLabel.leadingAnchor, constant: -43).isActive = true
        secondTopTextLabel.topAnchor.constraint(equalTo: firstTopTextLabel.bottomAnchor, constant: 5).isActive = true
        secondTopTextLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        outputTextView.leadingAnchor.constraint(equalTo: firstTopTextLabel.leadingAnchor).isActive = true
        // UI 구현 추가 need
        
        
        
        
    }
}
