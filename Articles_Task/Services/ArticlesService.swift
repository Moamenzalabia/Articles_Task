//
//  ArticlesService.swift
//  Articles_Task
//
//  Created by Moamen Abd Elgawad on 08/03/2022.
//

import Foundation
import Moya

/// This is the enum used to create articles request service.
enum ArticlesService {
    case fetchArticles
}

extension ArticlesService: TargetType {
    
    var baseURL: URL {
        let baseUrl = URLsConstants.String.BaseURL.baseUrl
        guard let url = URL(string: baseUrl) else {
            fatalError("URL cannot be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
            case .fetchArticles:
                return "1.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .fetchArticles:
                return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
            case .fetchArticles:
                var params: [String: Any] = [:]
                params["api-key"] = "KWhH0CfXeLHCZgjlhSr9HTVvPP7jPFPE"
                return .requestParameters(
                    parameters: params,
                    encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
