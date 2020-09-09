import UIKit

protocol ButtonPressed {
    
    func blockPressed (index: IndexPath,blockButton: UIButton, unblockButton:UIButton,currentCell:UITableViewCell)
    func UnblockPressed (index: IndexPath, blockButton: UIButton, unblockButton:UIButton,currentCell:UITableViewCell)
    func goToUserProfile ()
}
class BlockTableViewCell: UITableViewCell {

    private var blockToggle = true
    var ButtonDelegate : ButtonPressed?
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var UnblockButton: UIButton!
    @IBOutlet weak var Block: UIButton!
    @IBOutlet weak var userName: UILabel!
    var index : IndexPath?
    
    override func awakeFromNib() {
            
        super.awakeFromNib()

    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

    }
  
    @IBAction func unblockUser(_ sender: Any) {
        
        ButtonDelegate?.UnblockPressed(index: index!,blockButton: Block, unblockButton: UnblockButton,currentCell: self)
    
        
    }
    

    @IBAction func showUserProfile(_ sender: Any) {
        
        ButtonDelegate?.goToUserProfile()
        
    }
    
     
    @IBAction func blockUser(_ sender: Any) {
        
        ButtonDelegate?.blockPressed(index: index!, blockButton: Block, unblockButton: UnblockButton,currentCell: self)
        
    }
    
//    override func prepareForReuse() {
//        profilePicture.image = nil
//        self.Block.isHidden = self.UnblockButton.isHidden == true  ?  false : true
//        self.UnblockButton.isHidden = self.Block.isHidden == true ? false : true
//    }

}
