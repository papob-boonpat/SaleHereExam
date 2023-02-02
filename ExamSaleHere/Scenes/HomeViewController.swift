//
//  ViewController.swift
//  ExamSaleHere
//
//  Created by papob boonpat on 1/2/2566 BE.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet private weak var goalsView: GoalsView!
  @IBOutlet private weak var goalsLabel: UILabel!
  @IBOutlet private weak var amountLabel: UILabel!
  @IBOutlet private weak var headerView: UIView!
  @IBOutlet private weak var bestOfferView: BannersView!
  @IBOutlet private weak var suggestView: BannersView!
  
  private let goals = [
    Goal(expect: 20000, current: 16500, goodState: true, daysLeft: 45, title: "ไปเที่ยวญี่ปุ่น", image: UIImage(named: "luggage")),
    Goal(expect: 6000, current: 500, goodState: false, daysLeft: 20, title: "ซื้อกองทุนรวม", image: UIImage(named: "stock")),
    Goal(expect: 23000, current: 20500, goodState: true, daysLeft: 40, title: "ไปทะเล", image: UIImage(named: "luggage"))
  ]
  
  private let bestOffers = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png",
    "https://media.istockphoto.com/id/984661764/photo/sunrise-with-grand-palace-of-bangkok-thailand.jpg?s=612x612&w=0&k=20&c=wJb-mQcboK8nMSWqK4Kmy0g5e4Sh5bCIFBMe7MD6Izc=",
    "https://www.shutterstock.com/image-photo/bangkok-cityscape-night-view-business-260nw-701150233.jpg"
  ]
  
  @IBAction func newGoalPressed(_ sender: Any) {
    hidesBottomBarWhenPushed = false
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GoalViewController")
    navigationController?.pushViewController(nextViewController, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.isNavigationBarHidden = true
    setupHeader()
    setupSection()
  }
  
  private func setupHeader() {
    let gradient = CAGradientLayer()
    gradient.frame = headerView.bounds
    let lightColor = #colorLiteral(red: 0.9411764706, green: 0.6745098039, blue: 0.1764705882, alpha: 1).cgColor
    let darkColor = #colorLiteral(red: 0.7725490196, green: 0.5215686275, blue: 0.03529411765, alpha: 1).cgColor
    gradient.colors = [lightColor, lightColor,darkColor]
    gradient.startPoint = CGPoint(x: 0, y: 0)
    gradient.endPoint = CGPoint(x: 1, y: 1)
    headerView.layer.insertSublayer(gradient, at: 0)
  }
  
  private func setupSection() {
    goalsView.setupGoals(dataSource: goals)
    goalsLabel.text = "\(goals.count) Goals"
    let allSaving = Int(goals.reduce(0, {$0 + $1.current})).delimiter
    let attributedText = NSMutableAttributedString(string: "All Saving ", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue Medium", size: 17) ?? UIFont.systemFont(ofSize: 17)])
    attributedText.append(NSMutableAttributedString(string: allSaving, attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue Bold", size: 24) ?? UIFont.systemFont(ofSize: 24)]))
    attributedText.append(NSMutableAttributedString(string: " THB", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue Medium", size: 17) ?? UIFont.systemFont(ofSize: 17)]))
    amountLabel.attributedText = attributedText
    bestOfferView.setupBanners(dataSource: bestOffers, title: "Best Offer")
    suggestView.setupBanners(dataSource: bestOffers, title: "Suggest for you")
  }
}

