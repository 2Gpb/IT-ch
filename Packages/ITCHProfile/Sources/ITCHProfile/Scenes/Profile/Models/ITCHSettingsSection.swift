//
//  ITCHSettingsSection.swift
//  ITCHProfile
//
//  Created by Peter on 02.05.2025.
//

import ITCHUIComponents

struct ITCHSettingsSection {
    var rows: [ITCHSettingsRowModel]? = []
    var accountModel: ITCHAccountModel?
}

enum ITCHSettingsRowModel {
    case header(String)
    case footer
    case setting(ITCHSettingsModel)
}
