import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var textToEnter: UITextField!
    
    @IBAction func whenPressed(_ sender: Any) {
        
        let transitionToVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        transitionToVC.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(transitionToVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}
