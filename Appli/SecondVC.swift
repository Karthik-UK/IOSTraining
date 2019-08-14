
import UIKit

class SecondVC: UIViewController {

    
   
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var viewToChange: UIView!
    
    @IBAction func onCloseBttn(_ sender: Any) {
        NotificationCenter.default.removeObserver(self)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
       
        super.viewDidDisappear(animated)
        print("disappear")
    }
    
    @objc func willResignActive(_ notification: Notification) {
        view.backgroundColor = randomcolour()
        tempLabel.text = "ColouredBack"
        
    }
    
    @objc func actionTapped(_ sender: UITapGestureRecognizer) {
        viewToChange.backgroundColor = randomcolour()
        
    }
    
    func randomcolour()->UIColor{
        let red = CGFloat(drand48())
        let blue = CGFloat(drand48())
        let green = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1)}

    override func viewDidLoad() {
        super.viewDidLoad()
//        tempLabel.center.x = self.view.frame.maxX/2
//        tempLabel.center.y = self.view.frame.maxY - self.view.frame.maxY*(0.5)
//
//        viewToChange.center.x = self.view.frame.maxX/2
//        viewToChange?.center.y = self.view.frame.maxY - self.view.frame.maxY*(0.5)
//
        
        let tap = UITapGestureRecognizer(target: self, action: Selector(("actionTapped:")))
        tempLabel.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willResignActive), name: UIApplication.willResignActiveNotification, object: nil)
        
       
    }
    
    deinit {
        print("\(self)")
    }

    
    
    }
   

