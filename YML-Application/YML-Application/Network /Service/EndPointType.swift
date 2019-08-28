import Foundation
protocol EndPointType{
    var BaseURL: URL{get}
    var path:String{get}
    var httpmethod: HTTPMethod{get}
    var task: HTTPTask{get}
    var htttpHeader:HTTPHeader{get}
}
