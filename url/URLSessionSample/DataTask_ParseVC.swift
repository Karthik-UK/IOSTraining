import UIKit

class MenuItem{
    var itemId:String?
    var shortName:String?
    var longName:String?
    var specialInstructions:String?
    var url:String?
}

class SubMenuItem{
    var itemId: String?
    var shortName:String?
    var longName:String?
    var itemDescription:String?
    var priceSmall:String?
    var priceLarge:String?
    var smallPortionName:String?
    var largePortionName:String?
}

class DataTask_ParseVC: UIViewController {

    var menuItems = [MenuItem]()
    var subMenuItems = [SubMenuItem]()

    let menuURL = "https://knowstack-angularjs.herokuapp.com/categories.json"
    let subMenuURL = "https://knowstack-angularjs.herokuapp.com/menu_items.json?category="

    let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
    var dataTask:URLSessionDataTask?
    var subMenuDataTask:URLSessionDataTask?

    override func viewDidLoad() {
        super.viewDidLoad()

        loadMenuItems()
    }
    
    
    func loadMenuItems(){
        menuItems = []
        let searchURL = URL(string:  menuURL)
        let urlRequest = URLRequest(url: searchURL!)
        dataTask = defaultSession.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            self.updateMenuItems(data: data!)
        })
        dataTask?.resume()
    }
    
    func loadSubMenuItems(searchCriteia:String){
        //print("loading sub menu items")
        subMenuItems = []
        let searchURL = URL(string: (subMenuURL + searchCriteia))
        let urlRequest = URLRequest(url: searchURL!)
        //print(urlRequest)
        subMenuDataTask = defaultSession.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            self.updateSubMenuItems(data: data!)
        })
        subMenuDataTask?.resume()
    }
    
    func updateMenuItems(data:Data?){
        if let data = data{
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue:0)) as! [AnyObject]
                
                for item in response{
                    let newMenuItem = MenuItem()
                    newMenuItem.itemId = "\(String(describing: item["id"] as! Int))"
                    //newMenuItem.itemId = item["id"] as? String
                    newMenuItem.shortName = item["short_name"] as? String
                    newMenuItem.longName = item["name"] as? String
                    newMenuItem.specialInstructions = item["special_instructions"] as? String
                    newMenuItem.url = item["url"] as? String
                    menuItems.append(newMenuItem)
                }
                DispatchQueue.main.async {
                    print("updateSearchResults = \(Thread.isMainThread ? "Main Thread":"Background Thread")")
//                    self.menuItemTableView.reloadData()
                }
            }
            catch let error as NSError{
                print("The error in the catch block is \(error)")
            }
            catch
            {
                print("Catch Block")
            }
        }
    }
    
    func updateSubMenuItems(data:Data?){
        if let data = data{
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue:0)) as! [String:AnyObject]
                if let results = response["menu_items"] as? [AnyObject]{
                    for item in results{
                        let newSubMenu = SubMenuItem()
                        newSubMenu.itemId = "\(String(describing: item["id"] as! Int))"
                        newSubMenu.shortName =  item["short_name"] as? String
                        newSubMenu.longName =  item["name"] as? String
                        newSubMenu.itemDescription =  item["description"] as? String
                        newSubMenu.priceSmall =  item["price_small"] as? String//"\(String(describing: item["price_small"] as! Int))"
                        newSubMenu.priceLarge =  item["price_large"] as? String//"\(String(describing: item["price_large"] as! Int))"
                        newSubMenu.smallPortionName =  item["small_portion_name"] as? String
                        newSubMenu.largePortionName =  item["large_portion_name"] as? String
                        subMenuItems.append(newSubMenu)
                    }
                }
                DispatchQueue.main.async {
                    print("updateSearchResults = \(Thread.isMainThread ? "Main Thread":"Background Thread")")
//                    self.subMenuItemTableView.reloadData()
                }
            }
            catch let error as NSError{
                print("The error in the catch block is \(error)")
            }
            catch
            {
                print("Catch Block")
            }
        }
    }

}
