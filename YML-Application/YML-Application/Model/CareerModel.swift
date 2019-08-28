import Foundation
struct Root: Decodable{
    let data: [Opening]
}

struct Opening: Decodable{
    let domain: String
    let position: String
    let location: String
}
