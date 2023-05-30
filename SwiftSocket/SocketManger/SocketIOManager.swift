//
//  SocketIOManager.swift
//  SwiftSocket
//
//  Created by 김소현 on 2023/05/15.
//

import SocketIO

let HOST = "HOST here"
let PORT = 65456

class SocketIOManager: NSObject {
    var socket: SocketIOClient!
    static let shared = SocketIOManager()
    
    var manager = SocketManager(socketURL: (URL(string: "localhost:\(PORT)")!), config: [.log(true), .compress])
    
    override init() {
        super.init()
        socket = self.manager.socket(forNamespace: "/event")
        
        // recieve data
        socket.on("event") { dataArray, ack in
            print(dataArray)
        }
    }

    func establishConnection() {
        print("echo-client is activated")
        socket.connect()
        print("status: \(socket.status)")
        // print("socketURL: \(socket.manager?.socketURL)")
    }
    
    func closeConnection() {
        socket.disconnect()
        print("echo-client is de-activated")
    }
   
    func sendMessage(message: String, nickname: String) {
        let sendMsg = ">"
        socket.emit("event",  with: [sendMsg])
    }
}
