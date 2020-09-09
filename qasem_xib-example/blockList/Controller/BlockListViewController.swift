//
//  BlockListViewController.swift
//  qasem_xib-example
//
//  Created by Qasem Zreaq on 9/6/20.
//  Copyright © 2020 Qasem Zreaq. All rights reserved.
//

import UIKit
import Kingfisher

class BlockListViewController: UIViewController {
    
    @IBOutlet weak var liveButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var exploreButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    var cell = BlockTableViewCell()
    let defaults = UserDefaults.standard
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var BlcokCount: UILabel!
    var blockUsers = [users]()
    var blockCount : Int?
    let BlockManager = BlockListManager()
    var imageUrl = "http://momyt.website/"
    @IBOutlet weak var blockListTable: UITableView!
    private var flag:Bool = false

    override func viewDidLoad() {

        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        blockListTable.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ?  UIColor(hex: 0x001638) :  UIColor(hex:0xEEEEEE )
        view.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor(hex: 0x001638) : UIColor(hex:0xEEEEEE )
        blockListTable.dataSource = self
        blockListTable.delegate = self
        BlockManager.Blockdelegate = self
        blockListTable.layer.setAffineTransform(CGAffineTransform(scaleX: -1, y: -1))
        
        if  self.traitCollection.userInterfaceStyle == .dark {

            backButton.setImage(backButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
            liveButton.setImage(liveButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
            profileButton.setImage(profileButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
            chatButton.setImage(chatButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
            notificationButton.setImage(notificationButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
            exploreButton.setImage(exploreButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
            searchButton.setImage(searchButton.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)

        }
        else {
            
            backButton.setImage(backButton.imageView?.image?.withRenderingMode(.alwaysOriginal), for: .normal)
            liveButton.setImage(liveButton.imageView?.image?.withRenderingMode(.alwaysOriginal), for: .normal)
            profileButton.setImage(profileButton.imageView?.image?.withRenderingMode(.alwaysOriginal), for: .normal)
            chatButton.setImage(chatButton.imageView?.image?.withRenderingMode(.alwaysOriginal), for: .normal)
            notificationButton.setImage(notificationButton.imageView?.image?.withRenderingMode(.alwaysOriginal), for: .normal)
            exploreButton.setImage(exploreButton.imageView?.image?.withRenderingMode(.alwaysOriginal), for: .normal)
            searchButton.setImage(searchButton.imageView?.image?.withRenderingMode(.alwaysOriginal), for: .normal)

        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        blockListTable.register(UINib(nibName: "BlockTableViewCell", bundle: nil), forCellReuseIdentifier:"BlockCell")
        UserManager.signin()
        BlockManager.blockList(offset: "0", limit: "20")
        
    }
           
    

    
    @IBAction func toogle(_ sender: Any) {
        if flag {
            view2.isHidden = true
            view1.isHidden = false
        }else {
            view2.isHidden = false
            view1.isHidden = true
        }
        
        flag = !flag
    }
    
}

//MARK:- blockList Table View Delegate And Data Source

extension BlockListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        blockUsers.count
        
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = blockListTable.dequeueReusableCell(withIdentifier: "BlockCell", for: indexPath) as! BlockTableViewCell
        
        cell.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor(hex: 0xEEEEEE) : UIColor(hex:0x001638 )
        cell.contentView.layer.setAffineTransform(CGAffineTransform(scaleX: -1, y: -1))
        cell.userName.text = blockUsers[indexPath.row].name
        cell.profilePicture.layer.cornerRadius = cell.profilePicture.frame.size.height / 2
        cell.UnblockButton.layer.cornerRadius = 15
        cell.UnblockButton.layer.borderWidth = 1
        cell.Block.layer.borderWidth = 1
        cell.Block.layer.cornerRadius = 15
        cell.ButtonDelegate = self
        cell.Block.layer.masksToBounds = false
        cell.UnblockButton.layer.masksToBounds = false
        cell.userName.textColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor(hex: 0xEEEEEE) : UIColor(hex:0x001638 )
        cell.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor(hex: 0x001638) : UIColor(hex:0xEEEEEE )
        cell.index = indexPath
        //MARK:- DARK MODE AND LIGHT Mode For Buttons
        
        cell.Block.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor(hex: 0xEEEEEE) : UIColor(hex:0x001638 )
        let color  = self.traitCollection.userInterfaceStyle == .dark ? UIColor(hex: 0x001638) : UIColor(hex:0xEEEEEE )
        cell.Block.setTitleColor(color, for: .normal)
        cell.Block.layer.borderColor = self.traitCollection.userInterfaceStyle == .dark ? CGColor(srgbRed: 213, green: 1, blue: 1, alpha: 1)
            : CGColor(srgbRed: 123, green: 12, blue: 123, alpha: 1)
        
        let color2 = self.traitCollection.userInterfaceStyle == .dark ? UIColor(hex: 0xEEEEEE) : UIColor(hex:0x001638 )
        cell.UnblockButton.setTitleColor(color2, for: .normal)
        cell.UnblockButton.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor(hex:0x001638 ) : UIColor(hex:0xEEEEEE )
//        cell.UnblockButton.layer.borderColor = self.traitCollection.userInterfaceStyle == .dark ? CGColor(srgbRed: 0, green: 1, blue: 1, alpha: 1)
//            : CGColor(srgbRed: 7, green: 12, blue: 9, alpha: 1)
        
        let imageUrl = self.imageUrl + blockUsers[indexPath.row].profilePicture
        if blockUsers[indexPath.row].profilePicture == "" {
            cell.profilePicture.kf.cancelDownloadTask() // (!)
            cell.profilePicture.image = UIImage(named: "blockedUser")
        }
        else {
            
            cell.profilePicture.kf.setImage(with: URL(string: imageUrl))
        }
        
        if blockUsers[indexPath.row].followStatus == 0 {
            
            cell.UnblockButton.isHidden = false
            cell.Block.isHidden = true
        }
        else {
            
            cell.UnblockButton.isHidden = true
            cell.Block.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        blockListTable.deselectRow(at: indexPath, animated: true)

        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 85
        
    }
    

    
}

//MARK: - block Manager Delegate

extension BlockListViewController : blockListManager {
    
    func updataBlockListTable(_ blockModel: CurrentUserBlockListModel) {
                             
        DispatchQueue.main.async {
            
            
            
            self.blockUsers = blockModel.users
            self.blockListTable.reloadData()
            self.BlcokCount.text = "\(blockModel.total) Blocked User"
            
        }
    }
    
}

extension UIColor {
     convenience init(hex: Int) {
       let components = (
         R: CGFloat((hex >> 16) & 0xff) / 255,
         G: CGFloat((hex >> 08) & 0xff) / 255,
         B: CGFloat((hex >> 00) & 0xff) / 255
       )
       self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
     }
   }

//MARK: - Block List Button Delegates
extension BlockListViewController : ButtonPressed {
    func goToUserProfile() {
    
        self.navigationController?.pushViewController(UserProfile(), animated: true)
        
        print("Goooooo")

    }
    
    
    func blockPressed(index: IndexPath, blockButton: UIButton,unblockButton:UIButton,currentCell: UITableViewCell) {
        let userId = blockUsers[index.row].id
        UserManager.blockUser(userId: String(userId))
        blockUsers[index.row].followStatus =  0
        unblockButton.isHidden = false
        blockButton.isHidden = true
        blockButton.backgroundColor = UIColor.red
        blockListTable.reloadData()

    }
    
    func UnblockPressed(index: IndexPath, blockButton: UIButton, unblockButton:UIButton, currentCell: UITableViewCell) {
        
        let userId = blockUsers[index.row].id
        UserManager.unBlockUser(userId: String(userId))
        blockUsers[index.row].followStatus =  1
        unblockButton.isHidden = true
        blockButton.isHidden = false
        blockListTable.reloadData()

        }

        
    }
    
   
        


    
    
    

    
    

