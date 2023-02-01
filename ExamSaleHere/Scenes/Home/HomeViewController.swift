//
//  ViewController.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 1/2/2566 BE.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var goalsView: GoalsView!
  @IBOutlet private weak var headerView: UIView!
  @IBOutlet weak var bestOfferView: BannersView!
  @IBOutlet weak var suggestView: BannersView!
  let goals = [Goal(expect: 20000, current: 15000, goodState: true, daysLeft: 40, title: "ssss", image: UIImage(named: "Account")), Goal(expect: 6000, current: 500, goodState: false, daysLeft: 20, title: "sdfd", image: UIImage(named: "sss"))]
  let bestOffers = [ "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png" ,"https://media.istockphoto.com/id/984661764/photo/sunrise-with-grand-palace-of-bangkok-thailand.jpg?s=612x612&w=0&k=20&c=wJb-mQcboK8nMSWqK4Kmy0g5e4Sh5bCIFBMe7MD6Izc=", "https://www.shutterstock.com/image-photo/bangkok-cityscape-night-view-business-260nw-701150233.jpg"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupHeader()
  }

  private func setupHeader() {
    let gradient = CAGradientLayer()
    gradient.frame = headerView.bounds
    let colorTop = UIColor(red: 229 / 255.0, green: 165 / 255.0, blue: 40.0 / 255.0, alpha: 1.0).cgColor
    let colorBottom = UIColor(red: 197 / 255.0, green: 133 / 255.0, blue: 9 / 255.0, alpha: 1.0).cgColor
    gradient.colors = [colorTop, colorBottom]
    gradient.startPoint = CGPoint(x: 0, y: 0)
    gradient.endPoint = CGPoint(x: 1, y: 1)
    headerView.layer.insertSublayer(gradient, at: 0)
    goalsView.setupGoals(dataSource: goals)
    bestOfferView.setupBanners(dataSource: bestOffers, title: "Best Offer")
    suggestView.setupBanners(dataSource: bestOffers, title: "Suggest for you")
  }
  
}

