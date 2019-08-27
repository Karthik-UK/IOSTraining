import Foundation
struct Root: Decodable{
    let data: [Data]
}

struct Data: Decodable{
    let domain: String
    let position: String
    let location: String
}
