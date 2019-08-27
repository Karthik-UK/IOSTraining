import UIKit
class ViewController: UIViewController{
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonUI: UIButton!
    var productInfo : [constantThings] = []
    var storyModel = WalkThrough()
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonUI.layer.borderWidth = 2
        buttonUI.layer.borderColor = UIColor.black.cgColor
        productInfo = storyModel.page()
        configurePageControl()
    }
    func configurePageControl() {
        pageIndicator.numberOfPages = productInfo.count
        pageIndicator.currentPage = 0
        pageIndicator.tintColor = .orange
        pageIndicator.pageIndicatorTintColor = .black
        pageIndicator.currentPageIndicatorTintColor = .red
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





