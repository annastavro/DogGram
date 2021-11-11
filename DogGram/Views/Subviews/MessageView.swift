//
//  MessageView.swift
//  DogGram
//
//  Created by Anna Stavro on 4.11.21.
//

import SwiftUI

struct MessageView: View {
    
    @State var comment : CommentModel
    
    var body: some View {
        HStack{
            
            // MARK:PROFILE IMAGE
            
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
            VStack (alignment: .leading, spacing: 4, content: {
                
                
            // MARK:USERNAME
                
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // MARK: CONTENT
                
                Text(comment.content)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.primary)
                    .background(Color.gray)
                    .cornerRadius(10)
            })
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    
    static var comment: CommentModel = CommentModel(commentID: "", userID: "", username: "Edwin Stavro", content: "This photo is really cool!", dateCreated: Date())
    
    
    static var previews: some View {
        MessageView(comment: comment)
            .previewLayout(.sizeThatFits)
    }
}
