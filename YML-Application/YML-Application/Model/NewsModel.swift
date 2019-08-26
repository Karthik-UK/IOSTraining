
import Foundation
class News
{
    let imagenews: String
    let categorynews: String
    let descriptionnews: String
    let urlnews: String
    
    
    init(image: String, category: String, description: String, url: String) {
        self.imagenews = image
        self.categorynews = category
        self.descriptionnews = description
        self.urlnews = url
    }
}
