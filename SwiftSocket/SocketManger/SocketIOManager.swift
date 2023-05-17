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
    
    var manager = SocketManager(socketURL: URL(string: "http://\(HOST):\(PORT)")!, config: [.log(true), .compress])
    
    override init() {
        super.init()
        socket = self.manager.socket(forNamespace: "/test")
        
        socket.on("test") { dataArray, ack in
            print(dataArray)
        }
    }

    func establishConnection() {
        print("echo-client is activated")
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
        print("echo-client is de-activated")
    }
   
    func sendMessage(message: String, nickname: String) {
        socket.emit("event",  ["message" : ">"])
    }
    
    // TODO: recieve data code
}

