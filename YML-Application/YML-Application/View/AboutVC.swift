import UIKit

class AboutVC: BaseVC, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var gridCollectionView: UICollectionView!
    var button = ["Our Clients","Location","Expertise","Leadership"]
    @IBAction func rightClick(_ sender: Any) {
        let collectionBounds = imageCollectionView.bounds
        let contentOffset = CGFloat(floor(imageCollectionView.contentOffset.x + collectionBounds.size.width))
        moveCollectionToFrame(contentOffset: contentOffset)
    }
    
    
    @IBAction func leftClick(_ sender: Any) {
   
        let collectionBounds = imageCollectionView.bounds
        let contentOffset = CGFloat(floor(imageCollectionView.contentOffset.x - collectionBounds.size.width))
        moveCollectionToFrame(contentOffset: contentOffset)
    }
    
    func moveCollectionToFrame(contentOffset : CGFloat) {
        
        let frame: CGRect = CGRect(x : contentOffset ,y : 0 ,width : imageCollectionView.frame.width,height : imageCollectionView.frame.height)
        imageCollectionView.scrollRectToVisible(frame, animated: true)
    }
    

    let aboutUsModel  = AboutVm()
    
    func numberOfSections(gridCollectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ CollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if CollectionView == imageCollectionView{
            return  aboutUsModel.AboutInfo.count}
          else
        {return 4
        }    }
 
    func collectionView(_ CollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if CollectionView == imageCollectionView{
            
        let cell =  imageCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: "AboutusCell"), for: indexPath as IndexPath) as? AboutusCell
            cell?.imageOutlet.image = UIImage(named: aboutUsModel.AboutInfo[indexPath.row].images)
            return cell ?? UICollectionViewCell()}
        else{
            
        let cell1 =  gridCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: "AboutGridCell"), for: indexPath as IndexPath) as? AboutGridCell
            cell1?.buttonLabel.setTitle(button[indexPath.row], for: .normal) 
        return cell1 ?? UICollectionViewCell()
        
    }
    }
    
    func collectionView(_ CollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if  CollectionView == imageCollectionView{
        return imageCollectionView.bounds.size
        }
        else {
            return CGSize(width: (gridCollectionView.frame.width-10)/2, height: (gridCollectionView.frame.height-10)/2)
        }
        
    }
    func collectionView(_ imageCollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutUsModel.page()
    }
    

}
