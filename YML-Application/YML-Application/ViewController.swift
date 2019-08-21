import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout ,UIScrollViewDelegate{
    
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonUI: UIButton!
    @IBAction func onClick(_ sender: Any) {
        
        
        
        
     
    }
    var images :[String] = ["","1","2","3","4"]
    var heading:[String] = ["Hello","Molekule","The Home Depot","PayPal","State Farm"]
    var imageLogo :[String] = ["","1logo", "2logo","3logo","4logo"]
    var descriptn: [String] = ["We are a design and innovation agency, creating digital products and experiences that have a lasting impact.","The world's first intelligent air purifier, & the app putting clean air in people's hands. ",  "The ultimate power tool: A best-in-class digital experience for The Home Depot.","Payment giant goes mobile-by-design.","All things insurance, all things banking, all in one app."]
    
    func configurePageControl() {
        self.pageIndicator.numberOfPages = images.count
        self.pageIndicator.currentPage = 0
        self.pageIndicator.tintColor = self.randomclr()
        self.pageIndicator.pageIndicatorTintColor = .black
        self.pageIndicator.currentPageIndicatorTintColor = self.randomclr()
        self.view.addSubview(pageIndicator)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageIndicator.currentPage = Int(pageNumber)
        print(scrollView.contentOffset.x)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as? CollectionViewCell
        
        cell?.imageView.image =  UIImage(named: self.images[indexPath.row])
        cell?.headTitle.text = heading[indexPath.row]
        cell?.logoImage.image = UIImage(named: self.imageLogo[indexPath.row])
        cell?.descriptionTitle.text = descriptn[indexPath.row]
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIScreen.main.bounds.size
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonUI.layer.borderWidth = 2
        buttonUI.layer.borderColor = UIColor.black.cgColor
        configurePageControl()
        
    }
    
    func randomclr()->UIColor{
        let red = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let green = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }

}



