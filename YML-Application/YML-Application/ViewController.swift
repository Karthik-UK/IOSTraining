import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var images :[String] = ["1","2","3","4"]
    var heading:[String] = ["Molekule","The Home Depot","PayPal","State Farm"]
    var imageLogo :[String] = ["1logo","2logo","3logo","4logo"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as? CollectionViewCell
        
        cell?.imageView.image =  UIImage(named: self.images[indexPath.row])
        cell?.headTitle.text = heading[indexPath.row]
        cell?.logoImage.image = UIImage(named: self.imageLogo[indexPath.row])
        //            cell?.backgroundColor = UIColor.blue
        //cell?.frame.size = cell?.bounds.size
        //cell?. = UIScreen.main.bounds.width
        
        
        //cell?.headTitle.numberOfLines = 1
        //cell?.headTitle.frame = CGRect(x: self.view.bounds.size.width/2,y: 50,width: self.view.bounds.size.width, height: self.view.bounds.size.height) // x , y, width , height
         //cell?.headTitle.textAlignment = .left
         //cell?.headTitle.sizeToFit()
         //cell?.headTitle.backgroundColor = UIColor.red
        
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Compute the dimension of a cell for an NxN layout with space S between
        // cells.  Take the collection view's width, subtract (N-1)*S points for
        // the spaces between the cells, and then divide by N to find the final
        // dimension for the cell's width and height.

//        let cellsAcross: CGFloat = 3
//        let spaceBetweenCells: CGFloat = 1
//        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
        return UIScreen.main.bounds.size
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: screenWidth, height: screenWidth)


