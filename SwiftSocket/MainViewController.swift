//
//  MainViewController.swift
//  SwiftSocket
//
//  Created by 김소현 on 2023/05/09.
//

import UIKit
import SocketIO

class MainViewController: UIViewController, UITextViewDelegate {
    var socket: SocketIOClient!
    
    @Published var inputText: String = ""
    @Published var outputText: String = ""
    
    private let firstTopTextLabel: UILabel = {
           let label = UILabel()
           label.text = "Full Stack Service"
           label.textColor = .darkGray
           label.font = .systemFont(ofSize: 30, weight: .bold)
           return label
       }()
    
    private let secondTopTextLabel: UILabel = {
           let label = UILabel()
           label.text = "Networking"
           label.textColor = .black
           label.font = .systemFont(ofSize: 30, weight: .bold)
           return label
       }()
    
    private var outputTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = .systemFont(ofSize: 15, weight: .regular)
        textView.text = "풀스택 서비스 네트워킹 APP"
        
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
           label.font = .systemFont(ofSize: 28, weight: .bold)
           return label
       }()
    
    private let secondBottomTextLabel: UILabel = {
           let label = UILabel()
           label.text = "Socket Programming"
           label.textColor = .darkGray
           label.font = .systemFont(ofSize: 28, weight: .bold)
           return label
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.socket = SocketIOManager.shared.socket
        SocketIOManager.shared.establishConnection()
        
        [firstTopTextLabel, secondTopTextLabel, outputTextView, firstBottomTextLabel, secondBottomTextLabel].forEach {
            view.addSubview($0)
        }
        
        configureConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        SocketIOManager.shared.closeConnection()
        
    }
    
    private func configureConstraints() {
        firstTopTextLabel.translatesAutoresizingMaskIntoConstraints = false
        secondTopTextLabel.translatesAutoresizingMaskIntoConstraints = false
        outputTextView.translatesAutoresizingMaskIntoConstraints = false
        firstBottomTextLabel.translatesAutoresizingMaskIntoConstraints = false
        secondBottomTextLabel.translatesAutoresizingMaskIntoConstraints = false

        firstTopTextLabel.leadingAnchor.constraint(equalTo: outputTextView.leadingAnchor).isActive = true
        firstTopTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        firstTopTextLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        secondTopTextLabel.leadingAnchor.constraint(equalTo: outputTextView.leadingAnchor).isActive = true
        secondTopTextLabel.topAnchor.constraint(equalTo: firstTopTextLabel.bottomAnchor, constant: 5).isActive = true
        secondTopTextLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        outputTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        outputTextView.widthAnchor.constraint(equalToConstant: 318).isActive = true
        outputTextView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        outputTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 230).isActive = true
        
        firstBottomTextLabel.trailingAnchor.constraint(equalTo: outputTextView.trailingAnchor).isActive = true
        firstBottomTextLabel.topAnchor.constraint(equalTo: outputTextView.bottomAnchor, constant: 80).isActive = true
        
        secondBottomTextLabel.trailingAnchor.constraint(equalTo: outputTextView.trailingAnchor).isActive = true
        secondBottomTextLabel.topAnchor.constraint(equalTo: outputTextView.bottomAnchor, constant: 115).isActive = true
        
    }
}
