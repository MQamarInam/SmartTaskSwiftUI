//
//  TaskDetailView.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 23/06/2025.
//

import SwiftUI

struct TaskDetailView: View {
    
    let task: Task
    @State private var resolutionStatus: TaskResolutionStatus = .unresolved
    @State private var animateImage: Bool = false
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TaskViewModel
    
    private var statusText: String {
        switch resolutionStatus {
        case .unresolved:
            return "Unresolved"
        case .resolved:
            return "Resolved"
        case .cantResolve:
            return "Can't resolve"
        }
    }
    
    private var statusColor: Color {
        switch resolutionStatus {
        case .unresolved:
            return .primaryBackground
        case .resolved:
            return Color(.success)
        case .cantResolve:
            return Color(.failure)
        }
    }

    var body: some View {
        
        let daysLeft = viewModel.calculateDaysLeft(from: task.dueDate, comparedTo: task.targetDate)
        
        ZStack {
            // Backgrounnd Layer
            Color("primary_background")
                .ignoresSafeArea()
            
            // Foreground Layer
            VStack(spacing: 15) {
                // Navbar section
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("left_arrow")
                            .padding(.leading, -5)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("Task Detail")
                        .font(.amsiProBold(size: 15))
                        .foregroundColor(.white)
                    Spacer()
                    // Placeholder to balance layout
                    Image("left_arrow")
                        .opacity(0)
                        .padding(.trailing, -5)
                }
                .padding(.bottom, 20)
                
                // Detail Section
                ZStack {
                    Image("detail_background")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    
                    VStack {
                        Text(task.title)
                            .font(.amsiProBold(size: 20))
                            .foregroundColor(statusColor)
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 30)
                        
                        Divider()
                            .frame(height: 2)
                            .background(Color("seperator"))
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("Due date")
                                    .font(.amsiProRegular(size: 10))
                                    .foregroundColor(.gray)
                                Text(task.dueDate ?? "N/A")
                                    .font(.amsiProBold(size: 15))
                                    .foregroundColor(statusColor)
                            }
                            Spacer()
                            VStack(alignment: .trailing, spacing: 7) {
                                Text("Days left")
                                    .font(.amsiProRegular(size: 10))
                                    .foregroundColor(.gray)
                                Text(daysLeft)
                                    .font(.amsiProBold(size: 15))
                                    .foregroundColor(statusColor)
                            }
                        }
                        .padding(.vertical, 7)
                        
                        Divider()
                            .frame(height: 2)
                            .background(Color("seperator"))
                        
                        Text(task.description)
                            .font(.amsiProRegular(size: 15))
                            .multilineTextAlignment(.leading)
                            .frame(minHeight: 60, alignment: .topLeading)
                            .lineLimit(nil)
                            .padding(.vertical, 7)
                        
                        Divider()
                            .frame(height: 2)
                            .background(Color("seperator"))
                        
                        Text(statusText)
                            .font(.amsiProBold(size: 15))
                            .foregroundColor(statusColor)
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("\(task.priority ?? 0)")
                    }
                    .padding(10)
                }
                
                // Other Message Section
                VStack(spacing: 16) {
                    if resolutionStatus == .unresolved {
                        HStack {
                            Button {
                                resolutionStatus = .resolved
                            } label: {
                                Text("Resolve")
                                    .font(.amsiProBold(size: 15))
                                    .padding()
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .background(Color("success"))
                                    .cornerRadius(5)
                            }

                            Button {
                                resolutionStatus = .cantResolve
                            } label: {
                                Text("Can't resolve")
                                    .font(.amsiProBold(size: 15))
                                    .padding()
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .background(Color("failure"))
                                    .cornerRadius(5)
                            }
                        }
                    } else {
                        Image(resolutionStatus == .resolved ? "tick_icon" : "cross_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .scaleEffect(animateImage ? 1.0 : 0.7)
                            .opacity(animateImage ? 1.0 : 0.7)
                            .animation(.easeOut(duration: 0.4), value: animateImage)
                            .padding(.top, 30)
                    }
                }
                .onAppear {
                    resolutionStatus = UserDefaults.standard.getStatus(for: task.id)
                }
                .onChange(of: resolutionStatus) { old, new in
                    if new != .unresolved {
                        UserDefaults.standard.saveStatus(new, for: task.id)
                        animateImage = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                            animateImage = true
                        }
                    }
                }
                
                Spacer()
                
            }  // Vstack End
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
        }
        
    }
}


#Preview {
    TaskDetailView(task: Task(
        id: "1",
        targetDate: "2025-07-01",
        dueDate: "2025-07-10",
        title: "Sample Task Title",
        description: "This is a sample task description for preview.",
        priority: 1
    ),
        viewModel: TaskViewModel()
    )
}
