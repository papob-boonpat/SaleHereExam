//
//  SocketManager.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation

import SocketIO

protocol SocketIOManagerDelegate {
  func notiUpdated(count: Int)
}

class SocketIOManager {
  private let manager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress])
  private var socket: SocketIOClient? = nil
  public var delegate: SocketIOManagerDelegate?
  
  init() {
    setupSocket()
    setupSocketEvents()
    socket?.connect()
  }
  
  func stop() {
    socket?.removeAllHandlers()
  }
  
  // MARK: - Socket Setup
  private func setupSocket() {
    self.socket = manager.defaultSocket
  }
  
  private func setupSocketEvents() {
    socket?.on(clientEvent: .connect) {[weak self] data, ack in
      print("Connected")
      self?.socket?.emit("get-value")
    }
    
    socket?.on("value") { [weak self] data, ack in
      guard let dataInfo = data.first as? Int, dataInfo > 0 else { return }
      print(dataInfo)
      self?.delegate?.notiUpdated(count: dataInfo)
    }
  }
}
