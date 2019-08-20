import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var images :[String] = ["1","2","3","4"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as? CollectionViewCell
        
        cell?.imageView.image =  UIImage(named: self.images[indexPath.row])
//            cell?.backgroundColor = UIColor.blue
        //cell?.frame.size = cell?.bounds.size
        //cell?. = UIScreen.main.bounds.width
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Compute the dimension of a cell for an NxN layout with space S between
        // cells.  Take the collection view's width, subtract (N-1)*S points for
        // the spaces between the cells, and then divide by N to find the final
        // dimension for the cell's width and height.
        
        let cellsAcross: CGFloat = 3
        let spaceBetweenCells: CGFloat = 1
        let dim = (collectionView.bounds.width - (cellsAcross - 1) * spaceBetweenCells) / cellsAcross
        return CGSize(width: dim, height: dim)
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: screenWidth, height: screenWidth)


