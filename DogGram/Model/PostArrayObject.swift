//
//  PostArrayObject.swift
//  DogGram
//
//  Created by Anna Stavro on 4.11.21.
//

import Foundation
class PostArrayObject: ObservableObject {
    
    @Published var dataArray =  [PostModel]()
    
    init() {
        
        print("FETCH FROM DATABASE HERE")
        let post1 = PostModel(postID: "", userID: "", username: "Edwin Stavro", caption: "This is a caption!", dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        let post2 = PostModel(postID: "", userID: "", username: "Rudy Shakhnovich", caption: nil, dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        let post3 = PostModel(postID: "", userID: "", username: "Iskra Frakin", caption: "This is a really really long caption!", dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        let post4 = PostModel(postID: "", userID: "", username: "Raki Lucky", caption:nil, dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }
    
    ///USED FOR SINGLE POST SELECTION
    init(post: PostModel){
        self.dataArray.append(post)
    }
}
