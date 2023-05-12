//
//  MainViewController.swift
//  SwiftSocket
//
//  Created by 김소현 on 2023/05/09.
//

import UIKit
import SocketIO

class MainViewController: UIViewController {
    
    var socket: SocketIOClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
