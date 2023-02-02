//
//  TabBarController.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 2/2/2566 BE.
//

import Foundation

import UIKit

class TabBarController: UITabBarController {
  
  private var socketIO: SocketIOManager?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    socketIO = SocketIOManager()
    socketIO?.delegate = self
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    socketIO?.stop()
  }
}

extension TabBarController: SocketIOManagerDelegate {
  func notiUpdated(count: Int) {
    tabBar.items?[3].badgeValue = String(count)
  }
}
