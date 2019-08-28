import Foundation
public enum HTTPTask{
    case request
    case requestParameters(BodyParameters :Parameters?,URLParameters :Parameters?)
    case requestParametersAndHeader(BodyParameters :Parameters?,URLParameters :Parameters?,Headers: HTTPHeaders?)
}
