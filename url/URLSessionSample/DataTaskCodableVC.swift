import UIKit

class DataTaskCodableVC: UIViewController {
    private let menuURL = "https://knowstack-angularjs.herokuapp.com/categories.json"
    private let subMenuURL = "https://knowstack-angularjs.herokuapp.com/menu_items.json?category="

    override func viewDidLoad() {
        super.viewDidLoad()
        getMenuItems()

    }
    
    func getMenuItems() {
        guard let gitUrl = URL(string: menuURL) else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let menuItems = try decoder.decode([MenuItems].self, from: data)
                print(menuItems)
                
            } catch let err {
                print("Err", err)
            }
            }.resume()

    }
    

}

struct MenuItems: Codable {
    let itemId:Int?
    let shortName:String?
    let longName:String?
    let specialInstructions:String?
    let url:String?
    
    private enum CodingKeys: String, CodingKey {
        case itemId = "id"
        case shortName = "short_name"
        case longName = "name"
        case specialInstructions = "special_instructions"
        case url = "url"
        
    }
}

struct SubMenuItems {
    let itemId: String?
    let shortName:String?
    let longName:String?
    let itemDescription:String?
    let priceSmall:String?
    let priceLarge:String?
    let smallPortionName:String?
    let largePortionName:String?
    
    private enum CodingKeys: String, CodingKey {
        case itemId
        case shortName
        case longName
        case itemDescription
        case priceSmall
        case priceLarge
        case smallPortionName
        case largePortionName        
    }

}
