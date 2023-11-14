//
//  StopWatchView.swift
//  FocuStudy
//
//  Created by 최유경 on 11/14/23.
//

import SwiftUI
import Combine

public struct StopWatchView: View {
    
    let date = Date()
    @State var timeRemaining : Int = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var studyTime = 0
    
    
    public var body: some View {
        VStack{
            Text(convertSecondsToTime(timeInSeconds:timeRemaining))
                .font(.bold24)
            
                .onReceive(timer) { _ in
                    timeRemaining += 1
                    HomeView.myStudyTime += 100
                }
            
        }
        .onAppear {
            calcRemain(studyTime: studyTime)
        }
    }
    
    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let hours = timeInSeconds / 3600
        let minutes = (timeInSeconds - hours*3600) / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i:%02i", hours,minutes,seconds)
    }
    
    func calcRemain(studyTime : Int) {
        let calendar = Calendar.current
        let targetTime : Date = calendar.date(byAdding: .second, value: studyTime, to: date, wrappingComponents: false) ?? Date()
        let remainSeconds = Int(targetTime.timeIntervalSince(date))
        self.timeRemaining = remainSeconds
    }
}

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView()
    }
}
