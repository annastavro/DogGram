//
//  PostView.swift
//  DogGram
//
//  Created by Anna Stavro on 3.11.21.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    var showHeaderAndFooter: Bool
    
    @State var postImage: UIImage = UIImage(named: "dog1")!
    
    @State var animateLike: Bool = false
    @State var addHeartAnimationToView : Bool
    @State var showActionSheet: Bool = false
    @State var actionSheetType: PostActionSheetOption = .general
    
    enum PostActionSheetOption {
        
        case general
        case reporting
    }
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            
            //MARK: HEADER
            
            if showHeaderAndFooter {
                
                HStack {
                    
                    NavigationLink(
                        destination: ProfileView(isMyProfile: false, profileDisplayName:post.username, profileUserID: post.userID),
                        label: {
                            Image(uiImage: postImage)
                                .resizable()
                                .scaledToFill()
                        
                                .frame(width: 30, height: 30, alignment: .center)
                            .cornerRadius(15)
                        
                            Text (post.username)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                        })
                    
                
                Spacer()
                
                    
                    Button(action: {
                        
                        showActionSheet.toggle()
                        
                    }, label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    })
                    .accentColor(.primary)
                    .actionSheet(isPresented: $showActionSheet, content: {
                        
                        getActionSheet()
                        
                    })
                
                }
                
            .padding(.all, 6)
                
        }
            
            
            //MARK: IMAGE
            
            ZStack{
                
                Image("dog1")
                    .resizable()
                    .scaledToFit()
                
                
                if addHeartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                    
                    
                }
              
                
            }
            
            
            
            //MARK: FOOTER
            
            if showHeaderAndFooter {
                
                HStack(alignment: .center, spacing: 20, content: {
                    
                    Button(action: {
                        
                        if post.likedByUser {
                          
                            //unlike post
                            unlikePost()
                        } else {
                            
                            //like
                            likePost()
                            
                        }
                        
                    }, label: {
                        
                        Image (systemName: post.likedByUser ? "heart.fill" : "heart")
                             .font(.title3)
                    })
                    
                    .accentColor(post.likedByUser ? .red : .primary)
                   
             
                    //MARK: COMMENT ICON
                    NavigationLink(
                        destination: CommentsView(),
                        label: {
                            Image (systemName: "bubble.middle.bottom")
                                .font(.title3)
                                .foregroundColor(.primary)
                        })
                    
                    Button(action: {
                        sharePost()
                    }, label: {
                        Image (systemName: "paperplane")
                            .font(.title3)
                    })
                    .accentColor(.primary)
                    
                    Spacer()
                    
                })
                
                .padding(.all, 6)
                if let caption = post.caption {
                    
                HStack {
                        Text (caption)
                        Spacer(minLength: 0)
                }
                
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 6)
                }
                
            }
                
           
        })
    }
    
    //MARK: FUNCTIONS
    func likePost(){
        //update the local data
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likedByUser: true)
        
        self.post = updatedPost
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            animateLike = false
        }
        
    }
    
    func unlikePost(){
        
        //update the local data
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likedByUser: false)
        
        self.post = updatedPost
    }
    
    func getActionSheet() -> ActionSheet {
        
        switch self.actionSheetType {
        case .general:
            return ActionSheet(title: Text("What would you like to do?"), message: nil, buttons: [
            
                .destructive(Text("Report"), action: {
                    self.actionSheetType = .reporting
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.showActionSheet.toggle()
                    }
                   
                }),
                
                .default(Text("Learn more..."), action: {
                    print("LEARN MORE PRESSED")
                }),
                
                .cancel()
            ])
        case.reporting:
            return ActionSheet(title: Text("Why are you reporting this post?"), message: nil, buttons: [
            
                .destructive(Text("This is inappropriate"), action: {
                    reportPost(reason: "This is inappropriate")
                    
                }),
                
                .destructive(Text("This is spam"), action: {
                    reportPost(reason: "This is spam")
                    
                }),
                
                .destructive(Text("It made me uncomfortable"), action: {
                    reportPost(reason: "It made me uncomfortable")
                    
                }),
                
                .cancel({
                    self.actionSheetType = .general
                })
            
            ])
            
        }
        
        
        
    }
    
    func reportPost (reason: String) {
        print("REPORT POST NOW")
    }
    func sharePost() {
        
        
        let message = "Check out this post on DogGram!"
        let image = postImage
        let link = URL(string: "https://www.google.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
}


struct PostView_Previews: PreviewProvider {
    
    
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Edwin Stavro", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
    
    
    
    static var previews: some View {
        PostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
            .previewLayout(.sizeThatFits)
    }
}
