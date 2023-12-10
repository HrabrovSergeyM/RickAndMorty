//
//  RMSettingsView.swift
//  RickAndMorty
//
//  Created by Sergey Hrabrov on 10.12.2023.
//

import SwiftUI

struct RMSettingsView: View {
    
    let vm: RMSettingsViewViewModel
    
    init(vm: RMSettingsViewViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        List(vm.cellViewModels) { viewModel in
            HStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primary)
                        .padding(8)
                        .background(Color(viewModel.iconContainerColor))
                        .cornerRadius(6)
                }
                Text(viewModel.title)
                    .padding(.leading, 10)
                Spacer()
            }
            .padding(.vertical, 3)
            .onTapGesture {
                viewModel.onTapHandler(viewModel.type)
            }
        }
    }
}

struct RMSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        RMSettingsView(vm: .init(cellViewModels: RMSettingsOption.allCases.compactMap({
            return RMSettingsCellViewModel(type: $0) { option in
            }
        })))
    }
}
