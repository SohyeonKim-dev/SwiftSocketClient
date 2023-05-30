//
//  UDPEchoClient.swift
//  SwiftSocket
//
//  Created by 김소현 on 2023/05/30.
//

import Foundation
import NIO

class UDPEchoHandler: ChannelInboundHandler  {
    typealias InboundIn = ByteBuffer
    typealias OutboundOut = ByteBuffer
    
    public func channelActive(context: ChannelHandlerContext) {
        // TODO: Fix
    }
    
    public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
//        let envelope = self.unwrapInboundIn(data)
//        let byteBuffer = envelope
    }
}

class UDPClient {
    private let group = MultiThreadedEventLoopGroup(numberOfThreads: System.coreCount)
    private var host: String?
    private var port: Int?
    
    init(host: String, port: Int) {
        self.host = host
        self.port = port
    }
    
    private var clientBootstrap: DatagramBootstrap {
        return DatagramBootstrap(group: group)
            .channelInitializer { channel in
                channel.eventLoop.makeSucceededFuture(())
            }
            .channelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEADDR), value: 1)
            .channelOption(ChannelOptions.socket(SocketOptionLevel(SOL_SOCKET), SO_REUSEPORT), value: 1)
    }
}

