import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonUI: UIButton!
    var productInfo : [constantThings] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonUI.layer.borderWidth = 2
        buttonUI.layer.borderColor = UIColor.black.cgColor
        UIConstants()
        configurePageControl()
    }
    
    //static UI function
    func UIConstants(){
        let helloPage = constantThings(images: "", headings: "Hello", imageLogos: "", descriptions: "We are a design and innovation agency, creating digital products and experiences that have a lasting impact.")
        let moleKule = constantThings(images: "1", headings: "Molekule", imageLogos: "1logo", descriptions: "The world's first intelligent air purifier, & the app putting clean air in people's hands. ")
        let homeDepot = constantThings(images: "2", headings: "The Home Depot", imageLogos: "2logo", descriptions: "The ultimate power tool: A best-in-class digital experience for The Home Depot.")
        let payPal = constantThings(images: "3", headings: "PayPal", imageLogos: "3logo", descriptions: "Payment giant goes mobile-by-design.")
        let stateFarm = constantThings(images: "4", headings: "State Farm", imageLogos: "4logo", descriptions: "All things insurance, all things banking, all in one app.")
        productInfo.append(helloPage)
        productInfo.append(moleKule)
        productInfo.append(homeDepot)
        productInfo.append(payPal)
        productInfo.append(stateFarm)
    }
    
    //random colour generator
    func randomclr()->UIColor{
        let red = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let green = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }

    //function to configure pageindicator
    func configurePageControl() {
        pageIndicator.numberOfPages = productInfo.count
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
        return productInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath as IndexPath) as? CollectionViewCell
        
        cell?.imageView.image =  UIImage(named: productInfo[indexPath.row].images)
        cell?.headTitle.text = productInfo[indexPath.row].headings
        cell?.logoImage.image = UIImage(named: productInfo[indexPath.row].imageLogos)
        cell?.descriptionTitle.text = productInfo[indexPath.row].descriptions
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIScreen.main.bounds.size
}
}


//Structure for all static images,labels etc.
struct constantThings {
    let images :String //= ["","1","2","3","4"]
    let headings:String //= ["Hello","Molekule","The Home Depot","PayPal","State Farm"]
    let imageLogos :String //= ["","1logo", "2logo","3logo","4logo"]
    let descriptions: String// = ["We are a design and innovation agency, creating digital products and experiences that have a lasting impact.","The world's first intelligent air purifier, & the app putting clean air in people's hands. ",  "The ultimate power tool: A best-in-class digital experience for The Home Depot.","Payment giant goes mobile-by-design.","All things insurance, all things banking, all in one app."]
}


