//
//  MyPageView.swift
//  FocuStudy
//
//  Created by 최유경 on 2023/10/03.
//

import SwiftUI

enum timeInfo : String, CaseIterable {
    case totalTime = "총 공부"
    case maxTime = "최대 집중"
    case startTime = "시작"
    case endTime = "종료"
}


struct MyPageView: View {
    
    @State var selectedPicker: timeInfo = .totalTime
    @Namespace var animation

    var body: some View {
        NavigationView{
            VStack{
                VStack(spacing:0){
                    HStack{
                        Text("09월 30일 (토)")
                            .font(.bold16)
                            .padding(.horizontal,16)
                            .padding(.top,16)
                        
                        Spacer()
                    }
                    
                    VStack(spacing:0){
                        Image("profile")
                            .resizable()
                            .frame(width: 60,height: 60)
                            .scaledToFit()
                            .clipShape(Circle().inset(by: 5))
                        Text("StopYoon님")
                            .font(.bold16)
                            .padding(.bottom,10)
                    }
                    
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal,20)
                
                VStack{
                    HStack{
                        Text("Focus Time")
                            .font(.bold16)
                            .padding()
                        
                        Spacer()
                    }
                    animate()
                    timeTabView(tabs: selectedPicker)
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal,20)
                
                coinView()
                Spacer()

            }
            .background(Color.systemGray)
            .navigationTitle("My Page")
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination: SettingView(),
                        label: {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(Color.gray80)
                        })
            )
            .navigationBarBackButtonHidden(true)
        
            
        }
        .background(Color.systemGray)

    }
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(timeInfo.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.bold16)
                        .frame(maxWidth: .infinity/4, minHeight: 30)
                        .foregroundColor(selectedPicker == item ? .black : .gray)
                    
                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(.black)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "totalTime", in: animation)
                    }
                    
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }.padding(.horizontal,10)

    }
}

struct timeTabView: View {
    
    var tabs : timeInfo
    
    var body: some View {
        
        switch tabs {
        case .totalTime:
            VStack{
                Text("10:24:11")
                    .font(.bold24)
                    .padding(.vertical,15)
            }
        case .maxTime:
            Text("10:24:12")
                .font(.bold24)
                .padding(.vertical,15)

            
        case .startTime:
            Text("10:24:13")
                .font(.bold24)
                .padding(.vertical,15)

        case .endTime:
            Text("10:24:14")
                .font(.bold24)
                .padding(.vertical,15)

        }
        
    }
    
    
    
}
struct coinView: View {
    var body: some View {
        VStack{
            
            VStack{
                HStack(spacing:0){
                    Text("보유 코인 : ")
                        .font(.bold16)
                    Text("20")
                        .font(.bold16)
                        .foregroundColor(Color.symbolBlue)
                    Text("개")
                        .font(.bold16)
                    
                    Spacer()
                }
                .padding()
            }
            VStack{
                HStack{
                    existedCoinView()
                    notExistedCoinView()
                    existedCoinView()
                    notExistedCoinView()
                    existedCoinView()
                    existedCoinView()
                    existedCoinView()

                }
                HStack{
                    existedCoinView()
                    existedCoinView()
                    notExistedCoinView()
                    notExistedCoinView()
                    existedCoinView()
                    existedCoinView()
                    existedCoinView()

                }
                HStack{
                    existedCoinView()
                    notExistedCoinView()
                    existedCoinView()
                    existedCoinView()
                    existedCoinView()
                    notExistedCoinView()
                    existedCoinView()

                }
                HStack{
                    notExistedCoinView()
                    existedCoinView()
                    notExistedCoinView()
                    notExistedCoinView()
                    existedCoinView()
                    existedCoinView()
                    existedCoinView()

                }
                HStack{
                    notExistedCoinView()
                    existedCoinView()
                    Spacer()
                }
                .padding(.leading,48)
                .padding(.bottom,16)
                
            }
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal,20)
        
    }
}
struct existedCoinView: View {
    var body: some View {
        VStack{
            Image("coin")
                .resizable()
                .frame(width: 30, height: 30)
        }
        .background(Color.blue10)
        .cornerRadius(12)
    }
}

struct notExistedCoinView: View {
    var body: some View {
        Rectangle()
            .frame(width: 30, height: 30)
            .foregroundColor(Color.gray10)
            .cornerRadius(12)
    }
}
