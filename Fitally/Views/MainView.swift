//
//  ContentView.swift
//  Fitally
//
//  Created by Mateusz Żełudziewicz on 16/07/2024.
//

import SwiftUI

struct MainView: View {
    @State private var workoutDays: [WorkoutDay] = workoutDaysData
    
    var body: some View {
        TabView {
            ProgressView()
                .tabItem {
                    Image(systemName: "figure.american.football")
                    Text("Progress")
                }
            
            WorkoutView(workoutDays: $workoutDays)
                .tabItem {
                    Image(systemName: "dumbbell.fill")
                    Text("Workout")
                }
            
            AddWorkoutView(workoutDays: $workoutDays)
                .tabItem {
                    Image(systemName: "plus.diamond.fill")
                    Text("Add New")
                }
        }
    }
}

#Preview {
    MainView()
}

