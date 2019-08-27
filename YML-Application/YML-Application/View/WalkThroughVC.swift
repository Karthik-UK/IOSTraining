import UIKit
class ViewController: UIViewController{
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var buttonUI: UIButton!
    var storyModel = WalkThroughVM()
    override func viewDidLoad() {
        super.viewDidLoad()
//        var c = AlertStruct.init(title: "fgch", message: "fgfg")
//       
//
//        self.present( ShowAlert(title: c.title, message: c.message), animated: false, completion: nil)
        buttonUI.layer.borderWidth = 2
        buttonUI.layer.borderColor = UIColor.black.cgColor
        storyModel.page()
        configurePageControl()
        
    }
    func configurePageControl() {
        pageIndicator.numberOfPages = storyModel.productInfo.count
        pageIndicator.currentPage = 0
        pageIndicator.tintColor = .orange
        pageIndicator.pageIndicatorTintColor = .black
        pageIndicator.currentPageIndicatorTintColor = .red
        view.addSubview(pageIndicator)
    }}

