import Foundation
struct Root: Decodable{
    let data: [Open]
}

struct Open: Decodable{
    let domain: String
    let position: String
    let location: String
}
