//
//  CommunityView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/10/03.
//

import SwiftUI

struct CommunityView: View {
    private let messages = [ "코딩테스트 공부하려고 하는데...", "수능 100일 남았을때 팁"]
    
    var body: some View {
        NavigationView {
            List(messages, id: \.self) { message in
                NavigationLink(destination: DetailsView(message: message)) {
                    Text(message)
                }
            }.navigationBarTitle("Community")
            
                .navigationBarItems(
                    trailing:
                        NavigationLink(
                            destination: WritingView(),
                            label: {
                                Image(systemName: "pencil")
                                
                            })
                )
        }
    }
}

struct DetailsView: View {
    let message: String

    @State var comment: String = ""

    var body: some View {
        VStack{
            VStack{

                HStack{
                    Text(message)
                        .font(.semiBold)

                    Spacer()
                }
                .padding(.top,20)
                
                Divider()
                    .background(.blue)
                
                Text("코딩 테스트를 공부하려고 하는데 어떤 언어를 선택하면 좋을지 모르겠어서, 의견 듣고 싶어서 글을 올립니다. 지금 상황으로썬 제가 자바를 해 본 적이 없어서 C++이랑 파이썬 중에 고려하고 있습니다만...아무래도 C언어는 조금 그렇겠죠? 만약에 한다면 무슨 언어 추천하시는지 전문가들의 의견이 궁금합니다.")
                    .font(.medium16)
                    .padding(.top,20)
                
                Spacer()
                
                Divider()
                    .background(.blue)
                    .padding(.bottom,20)
                                
                HStack{
                    Text("저는 개인적으로 파이썬 추천합니다.")
                        .font(.medium16)
                    Spacer()
                }
                .padding(.horizontal,10)
                .padding(.vertical,8)
                .background(Color.gray10)
                .cornerRadius(8)
                
                Spacer()
                
                HStack{
                    TextField("댓글 작성", text: $comment)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(3)
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "paperplane")
                    })
                }
                .padding(.bottom,30)

            }
            .padding(.horizontal,20)
            .background(Color.white)
            .cornerRadius(12)

            Spacer()
        }
        .padding(.horizontal,20)
        .background(Color.lightBlue)
    }
    
}


struct WritingView: View {
    @State private var title: String = ""
    @State private var text: String = ""

    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            
            VStack{
                Spacer()
                Spacer()
                HStack{
                    Text("제목")
                        .font(.bold16)
                    Spacer()
                }
                TextField("Enter your tilte", text: $title)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                
                Spacer()
                HStack{
                    Text("내용")
                        .font(.bold16)
                    Spacer()
                }
                
                VStack{
                    TextEditor(text: $text)
                        .font(.medium16)
                        .onChange(of: text) { value in
                            print("텍스트 = \(text) ")
                        }
                    
                }
                .padding(.bottom,30)
                .cornerRadius(6)
                
                Spacer()
                
                HStack{
                    Spacer()
                    Text("글쓰기")
                        .font(.bold16)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.vertical,10)
                .background(Color.symbolBlue)
                .cornerRadius(12)
                
                Spacer()
                
            }
            .padding(.horizontal,20)
        }
        .background(Color.lightBlue)
    }
}
#Preview {
    CommunityView()
}
