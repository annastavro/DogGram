//
//  SettingsLabelView.swift
//  DogGram
//
//  Created by Anna Stavro on 6.11.21.
//

import SwiftUI

struct SettingsLabelView: View {
    
    var labelText: String
    var labelImage: String
    
    
    var body: some View {
        VStack {
            HStack {
                
                Text (labelText)
                    .fontWeight(.bold)
                Spacer()
                Image (systemName: labelImage)
                
            }
            
            Divider()
                .padding(.vertical, 4)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "Test label", labelImage: "heart")
            .previewLayout(.sizeThatFits)
    }
}
