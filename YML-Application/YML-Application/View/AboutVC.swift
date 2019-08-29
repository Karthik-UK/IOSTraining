
import UIKit

class AboutVC: BaseVC, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    let aboutUsModel  = AboutVm()
    func collectionView(_ imageCollectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  aboutUsModel.AboutInfo.count
     
    }
    
    func collectionView(_ imageCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: "AboutusCell"), for: indexPath as IndexPath) as? AboutusCell
         cell?.imageOutlet.image = UIImage(named: aboutUsModel.AboutInfo[indexPath.row].images)
        return cell ?? UICollectionViewCell()
    
    }
    func collectionView(_ imageCollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return imageCollectionView.bounds.size
    }
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutUsModel.page()

        
    }
    

}
