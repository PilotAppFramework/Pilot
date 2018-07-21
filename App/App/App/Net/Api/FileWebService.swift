import Moya
import SwiftyJSON
import CryptoSwift


//static let provider:MoyaProvider<FileWebService> = APIProviderManager.makeNotRequiredTokenProvider()

enum FileWebService {
    ///  下载文件
    case download(url: URL, toLocalUrl:URL)
}

extension FileWebService{
    var localLocation: URL {
        switch self {
        case let .download(_,toLocalUrl):
            return toLocalUrl
        }
    }
    var downloadDestination: DownloadDestination {
        return { _, _ in return
            (self.localLocation, [.removePreviousFile, .createIntermediateDirectories]) }
    }
}

extension FileWebService: TargetType {
    var baseURL: URL {
        switch self {
        case .download(let url,_):
            return url
        }
    }
    var path: String {
        switch self {
        case .download(_):
            return ""
        }
    }
    var method: Moya.Method {
        switch self {
        case .download(_):
            return .get
        }
    }
    var parameters: [String: Any]? {
        switch self {
        case .download:
            return nil
        }
    }
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    var task: Task {
        switch self {
        case .download(_):
            return .downloadDestination(downloadDestination)
        }
    }
    var sampleData: Data {
        return Data()
    }
    var headers: [String: String]? {
        return nil
    }
}
