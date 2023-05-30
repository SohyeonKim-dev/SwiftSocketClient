//
//  UDPEchoClient.swift
//  SwiftSocket
//
//  Created by 김소현 on 2023/05/30.
//

import Foundation
import NIO

let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
let bootstrap = DatagramBootstrap(group: group)
    .channelInitializer { channel in
        return channel.eventLoop.makeSucceededFuture(())
    }
    .channelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
    .channelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEPORT), value: 1)

class UDPEchoClientManager: NSObject {
    
}
