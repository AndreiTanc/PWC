//
//  ProfileHeaderSettingView.swift
//  PWC
//
//  Created by Andrei Tanc on 20.07.2022.
//

import SwiftUI

struct ProfileHeaderSettingView: View {
    var setting: ProfileSetting
    @Binding var selectedSetting: ProfileSetting
    
    var body: some View {
        Button {
            selectedSetting = setting
        } label: {
            VStack(spacing: 5) {
                Text(setting.rawValue.uppercased())
                    .foregroundColor(selectedSetting == setting ? .init(uiColor: .orangeButton) : .black)
                    .fontWeight(.semibold)
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: selectedSetting == setting ? 2 : 0)
                    .foregroundColor(.init(uiColor: .orangeButton))
            }
        }.padding([.leading], .generalPadding)
    }
}

struct ProfileHeaderSettingView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderSettingView(setting: .profileInfo, selectedSetting: .constant(.profileInfo))
    }
}
