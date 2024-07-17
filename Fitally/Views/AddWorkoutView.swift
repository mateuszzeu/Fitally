//
//  AddWorkoutView.swift
//  Fitally
//
//  Created by Mateusz Żełudziewicz on 16/07/2024.
//

import SwiftUI

struct AddWorkoutView: View {
    @Binding var workoutDays: [WorkoutDay]
    
    @State private var newExercises: [Exercise] = []
    @State private var newWorkoutDayName: String = ""
    @State private var newWorkoutDayDate: Date = Date()
    @State private var newExerciseName: String = ""
    @State private var newExerciseSets: String = ""
    @State private var newExerciseReps: String = ""
    @State private var newExerciseWeight: String = ""
    @State private var newExerciseInfo: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("New Workout Day")) {
                        TextField("Day Name", text: $newWorkoutDayName)
                        
                        DatePicker("Date", selection: $newWorkoutDayDate, displayedComponents: .date)
                            .datePickerStyle(CompactDatePickerStyle())
                    }
                    
                    Section(header: Text("Add Exercises")) {
                        TextField("Exercise Name", text: $newExerciseName)
                        TextField("Sets", text: $newExerciseSets)
                        TextField("Reps", text: $newExerciseReps)
                        TextField("Weight", text: $newExerciseWeight)
                        TextField("Info (Optional)", text: $newExerciseInfo)
                        
                        Button(action: {
                            let newExercise = Exercise(
                                name: newExerciseName,
                                sets: newExerciseSets,
                                reps: newExerciseReps,
                                weight: newExerciseWeight,
                                info: newExerciseInfo.isEmpty ? nil : newExerciseInfo
                            )
                            newExercises.append(newExercise)
                            newExerciseName = ""
                            newExerciseSets = ""
                            newExerciseReps = ""
                            newExerciseWeight = ""
                            newExerciseInfo = ""
                        }) {
                            Text("Add Exercise")
                        }
                    }
                    
                    Section {
                        List {
                            ForEach(newExercises) { exercise in
                                VStack(alignment: .leading) {
                                    Text(exercise.name)
                                    HStack {
                                        Text("Sets: \(exercise.sets)")
                                        Text("Reps: \(exercise.reps)")
                                        Text("Weight: \(exercise.weight)")
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                }
                            }
                            .onDelete { indexSet in
                                newExercises.remove(atOffsets: indexSet)
                            }
                        }
                    }
                }
                
                Button(action: {
                    let newWorkoutDay = WorkoutDay(
                        name: newWorkoutDayName,
                        date: newWorkoutDayDate,
                        exercises: newExercises
                    )
                    workoutDays.append(newWorkoutDay)
                    newWorkoutDayName = ""
                    newWorkoutDayDate = Date()
                    newExercises = []
                }) {
                    Text("Save Workout Day")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Add Workout")
        }
    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    @State static var workoutDays: [WorkoutDay] = workoutDaysData
    static var previews: some View {
        AddWorkoutView(workoutDays: $workoutDays)
    }
}
