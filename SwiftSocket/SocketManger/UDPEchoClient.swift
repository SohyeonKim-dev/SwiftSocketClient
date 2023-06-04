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
    private var numBytes = 0
    private let remoteAddressInitializer: () throws -> SocketAddress

    init(remoteAddressInitializer: @escaping () throws -> SocketAddress) {
        self.remoteAddressInitializer = remoteAddressInitializer
    }
    
    public func channelActive(context: ChannelHandlerContext) {
          do {
              let remoteAddress = try self.remoteAddressInitializer()
              let buffer = context.channel.allocator.buffer(string: "")
              self.numBytes = buffer.readableBytes
              _ = AddressedEnvelope<ByteBuffer>(remoteAddress: remoteAddress, data: buffer)
                            
          } catch {
              print("Could not resolve remote address")
          }
      }
    
    public func channelRead(context: ChannelHandlerContext, data: NIOAny) {
        let envelope = self.unwrapInboundIn(data)
        let byteBuffer = envelope
        
        self.numBytes -= byteBuffer.readableBytes
        
        if self.numBytes <= 0 {
            let string = String(buffer: byteBuffer)
            print("> received: \(string)")
            
            if (string == "quit") {
                context.close(promise: nil)
            }
        }
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

