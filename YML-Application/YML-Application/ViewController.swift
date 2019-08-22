import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonUI: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonUI.layer.borderWidth = 2
        buttonUI.layer.borderColor = UIColor.black.cgColor
        configurePageControl()
    }
  
    //random colour generator
    func randomclr()->UIColor{
        let red = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let green = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    //Structure for all static images,labels etc.
    struct constantThings {
        let images :[String] = ["","1","2","3","4"]
        let headings:[String] = ["Hello","Molekule","The Home Depot","PayPal","State Farm"]
        let imageLogos :[String] = ["","1logo", "2logo","3logo","4logo"]
        let descriptions: [String] = ["We are a design and innovation agency, creating digital products and experiences that have a lasting impact.","The world's first intelligent air purifier, & the app putting clean air in people's hands. ",  "The ultimate power tool: A best-in-class digital experience for The Home Depot.","Payment giant goes mobile-by-design.","All things insurance, all things banking, all in one app."]
    }
    let const = constantThings()
    
    //function to configure pageindicator
    func configurePageControl() {
        pageIndicator.numberOfPages = const.images.count
        pageIndicator.currentPage = 0
        pageIndicator.tintColor = self.randomclr()
        pageIndicator.pageIndicatorTintColor = .black
        pageIndicator.currentPageIndicatorTintColor = self.randomclr()
        view.addSubview(pageIndicator)
    }}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageIndicator.currentPage = Int(pageNumber)
        print(scrollView.contentOffset.x)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return const.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath as IndexPath) as? CollectionViewCell
        
        cell?.imageView.image =  UIImage(named: const.images[indexPath.row])
        cell?.headTitle.text = const.headings[indexPath.row]
        cell?.logoImage.image = UIImage(named: const.imageLogos[indexPath.row])
        cell?.descriptionTitle.text = const.descriptions[indexPath.row]
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIScreen.main.bounds.size
}
}
