//
//  BrowseView.swift
//  DogGram
//
//  Created by Anna Stavro on 4.11.21.
//

import SwiftUI

struct BrowseView: View {
    
    var posts = PostArrayObject()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
          CarouselView()
            ImageGridView(posts: posts)
            
        })
        .navigationTitle("Browse")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
        BrowseView()
    }
}
}
