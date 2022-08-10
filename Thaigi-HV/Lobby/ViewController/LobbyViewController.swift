//
//  LobbyViewController.swift
//  Thaigi-HV
//
//  Created by Alex on 2022/7/12.
//

import UIKit

class LobbyViewController: BaseViewController {

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var personalButton: UIButton!
    @IBOutlet weak var vipView: UIView!
    @IBOutlet weak var vipImageView: UIImageView!
    @IBOutlet weak var vipLabel: UILabel! {
        didSet {
            vipLabel.text = "\(HVLobby.Top.vip) 1 "
            vipLabel.layer.cornerRadius = 7.0
            vipLabel.backgroundColor = UIColor.init(hexString: "622bd2")
            vipLabel.textColor = UIColor.init(hexString: "ffffff")
        }
    }
    @IBOutlet weak var vipButton: UIButton!
    @IBOutlet weak var giftButton: UIButton!
    
    @IBOutlet weak var moneyView: UIView! {
        didSet {
            moneyView.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            moneyView.layer.borderWidth = 1.0
            moneyView.layer.cornerRadius = 14.0
            moneyView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var moneyLabel: UILabel! {
        didSet {
            moneyLabel.textColor = UIColor.init(hexString: "f5debe")
        }
    }
    @IBOutlet weak var reloadButton: UIButton!
    
    @IBOutlet weak var rankView: UIView!
    @IBOutlet weak var rankImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel! {
        didSet {
            rankLabel.text = HVLobby.Top.rank
            rankLabel.layer.borderColor = UIColor.init(hexString: "5b14cc").cgColor
            rankLabel.layer.borderWidth = 1.0
            rankLabel.textColor = UIColor.init(hexString: "f6eac7")
            rankLabel.layer.cornerRadius = 4.0
        }
    }
    @IBOutlet weak var rankButton: UIButton!
    
    @IBOutlet weak var settingButton: UIButton!
    
    @IBOutlet weak var footerView: UIView!
    
    @IBOutlet weak var bonusView: UIView!
    @IBOutlet weak var bonusImage: UIImageView!
    @IBOutlet weak var bonusLabel: UILabel! {
        didSet {
            bonusLabel.text = HVLobby.Footer.bonus
            bonusLabel.textColor = UIColor.init(hexString: "f5debe")
        }
    }
    @IBOutlet weak var bonusButton: UIButton!
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel! {
        didSet {
            messageLabel.text = HVLobby.Footer.message
            messageLabel.textColor = UIColor.init(hexString: "f5debe")
        }
    }
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var serviceView: UIView!
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceLabel: UILabel! {
        didSet {
            serviceLabel.text = HVLobby.Footer.service
            serviceLabel.textColor = UIColor.init(hexString: "f5debe")
        }
    }
    @IBOutlet weak var serviceButton: UIButton!
    
    @IBOutlet weak var recommendButton: UIButton! {
        didSet {
            recommendButton.setTitle(HVLobby.Footer.recommend, for: .normal)
            recommendButton.setTitleColor(UIColor.init(hexString: "ffffff"), for: .normal)
        }
    }
    @IBOutlet weak var depositButton: UIButton! {
        didSet {
            depositButton.setTitle(HVLobby.Footer.deposit, for: .normal)
            depositButton.setTitleColor(UIColor.init(hexString: "ffffff"), for: .normal)
        }
    }
    
    
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var venderView: UIView!
    @IBOutlet weak var venderCollcetionView: UICollectionView!
    
    @IBOutlet weak var noticeImageView: UIImageView!
    @IBOutlet weak var noticeView: UIView! {
        didSet {
            noticeView.layer.cornerRadius = 10.0
            noticeView.backgroundColor = UIColor.init(hexString: "1a1a1a")
        }
    }
    @IBOutlet weak var noticeCollectionView: UICollectionView!
    @IBOutlet weak var gameCollectionView: UICollectionView!
    
    var timer: Timer?{
        didSet{
            
            guard let timer = timer else {
                return
            }
            RunLoop.current.add(timer, forMode: .common)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        setupView()
        setupViewModel()
        regiestCell()
    }
    
    func textSize(text : String , font : UIFont , maxSize : CGSize) -> CGSize{
        return text.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font : font], context: nil).size
    }
    
    @IBAction func personalAction(_ sender: Any) {
        ViewControllerManager.present(to: Target.personal)
    }
    
    @IBAction func vipAction(_ sender: Any) {
        
    }
    
    @IBAction func giftAction(_ sender: Any) {
        
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        
    }
    
    @IBAction func rankAction(_ sender: Any) {
        
    }
    
    @IBAction func settingAction(_ sender: Any) {
        ViewControllerManager.present(to: Target.setting, sender: self, animated: false)
    }
    
    @IBAction func recommendAction(_ sender: Any) {
        
    }
    
    @IBAction func bonusAction(_ sender: Any) {
        
    }
    
    @IBAction func messageAction(_ sender: Any) {
        
    }
    
    @IBAction func serviceAction(_ sender: Any) {
        
    }
    
    @IBAction func depositAction(_ sender: Any) {
        
    }
}

extension LobbyViewController: ViewControllerable {
    func setup() {
        
    }
    
    func setupView() {
    
        let colors = [UIColor(hexString: "0e033a").cgColor,
                      UIColor(hexString: "210b5f").cgColor,
                      UIColor(hexString: "3b2292").cgColor]
        let gradient = UIColor.GradientMaker(colors: colors, locations: [0, 0.5, 1], direction: .topToBottom)
        footerView.applyGradient(gradientMaker: gradient)
        topView.applyGradient(gradientMaker: gradient)
        venderView.applyGradient(gradientMaker: gradient)
        
        
        let leftColors = [UIColor(hexString: "13161e").cgColor,
                          UIColor(hexString: "604117").cgColor,
                          UIColor(hexString: "13161e").cgColor]
        let leftGradient = UIColor.GradientMaker(colors: leftColors, locations: [0, 0.5, 1], direction: .topToBottom)
        leftView.applyGradient(gradientMaker: leftGradient)
    }
    
    func setupViewModel() {
        
    }
}

extension LobbyViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.noticeCollectionView {
            let textFont = UIFont.systemFont(ofSize: 12)
            let textMaxSize = CGSize(width: CGFloat(MAXFLOAT), height: 16)
            let textLabelSize = self.textSize(text:"dequeueReusableCell" , font: textFont, maxSize: textMaxSize)
            return CGSize(width: ceil(textLabelSize.width), height: 16.0)
        } else if collectionView == self.venderCollcetionView {
            return CGSize(width: 108.0, height: 37.0)
        } else {
            let height = gameCollectionView.frame.height / 2 - 8
            let width = height / 99
            
            return CGSize(width: 127 * width, height: height)
        }
    }
}

extension LobbyViewController: CollectionViewControllerable {
    func regiestCell() {
        venderCollcetionView.register(LobbyVenderCell.loadNib(), forCellWithReuseIdentifier: LobbyVenderCell.identifier)
        noticeCollectionView.register(LobbyNoticeCell.loadNib(), forCellWithReuseIdentifier: LobbyNoticeCell.identifier)
        gameCollectionView.register(LobbyMainCell.loadNib(), forCellWithReuseIdentifier: LobbyMainCell.identifier)
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.scrollNotice), userInfo: nil, repeats: true)
    }
    
    @objc func scrollNotice() {
        let deltaX = 0.5 * (ScreenWidth / 320)
        noticeCollectionView.contentOffset.x = noticeCollectionView.contentOffset.x + deltaX
        if noticeCollectionView.contentOffset.x > noticeCollectionView.contentSize.width {
                self.noticeCollectionView.contentOffset.x = -ScreenWidth + 38
        }
    }
}

extension LobbyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if noticeCollectionView == collectionView {
            return 10
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if noticeCollectionView == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LobbyNoticeCell.identifier, for: indexPath) as! LobbyNoticeCell
            cell.titleLabel.text = "dequeueReusableCell"
            return cell
        } else if venderCollcetionView == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LobbyVenderCell.identifier, for: indexPath) as! LobbyVenderCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LobbyMainCell.identifier, for: indexPath) as! LobbyMainCell
            return cell
        }

    }
    
    
}
