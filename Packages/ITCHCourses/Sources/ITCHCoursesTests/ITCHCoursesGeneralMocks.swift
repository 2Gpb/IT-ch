//
//  ITCHCoursesGeneralMocks.swift
//  ITCHCourses
//
//  Created by Peter on 04.06.2025.
//

import ITCHCore
import ITCHUtilities

final class ITCHSecureServiceMock: ITCHSecureSessionLogic {
    var tokenToReturn: ITCHAccessToken?

    func set(tokensModel: ITCHAccessToken) { tokenToReturn = tokensModel}
    func get() -> ITCHAccessToken? { tokenToReturn }
    func clearTokens() {}
}

final class ITCHUserRoleServiceMock: ITCHUserRoleLogic {
    var roleToReturn: ITCHUserInfo?
    
    func set(for token: String, with email: String) { }
    
    func get() -> ITCHUserInfo? {
        roleToReturn
    }
    
    func clearRole() { }
}
