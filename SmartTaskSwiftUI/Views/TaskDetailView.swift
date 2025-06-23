//
//  TaskDetailView.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 23/06/2025.
//

import SwiftUI

struct TaskDetailView: View {
    
    let task: Task

    var body: some View {
        
        ZStack {
            // Backgrounnd Layer
            Color("primary_background")
                .ignoresSafeArea()
            
            // Foreground Layer
            VStack(spacing: 15) {
                // Navbar section
                HStack {
                    Button(action: {
                        
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
                        Text("Task Title")
                            .font(.amsiProBold(size: 30))
                            .foregroundColor(Color("failure"))
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 30)
                        
                        Divider()
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("Due date")
                                    .font(.amsiProRegular(size: 10))
                                    .foregroundColor(.gray)
                                Text(task.dueDate ?? "N/A")
                                    .font(.amsiProBold(size: 15))
                                    .foregroundColor(Color("failure"))
                            }
                            Spacer()
                            VStack(alignment: .trailing, spacing: 7) {
                                Text("Days left")
                                    .font(.amsiProRegular(size: 10))
                                    .foregroundColor(.gray)
                                Text("5")
                                    .font(.amsiProBold(size: 15))
                                    .foregroundColor(Color("failure"))
                            }
                        }
                        .padding(.vertical, 7)
                        
                        Divider()
                        
                        Text("dskda d df dcdcdcd df f fv v fv fv fv fv fv fv fv fv fv fv fv f vfv f v fvfvfvfvfvfvfvf vf v  gr gw r f qref ef rg rg rwgrt gt g wfqe f r wf r ef rfg rewf rfrfrfgrfg rfg  rfg  r wgw r f rgf rg erew fe ferfer fref erfr f erf f ")
                            .font(.amsiProRegular(size: 15))
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .padding(.vertical, 7)
                        
                        Divider()
                            .background(Color("myprimarycolor"))
                        
                        Text("Status")
                            .font(.amsiProBold(size: 15))
                            .foregroundColor(Color("failure"))
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(10)
                }
                
                // Other Message Section
                HStack {
                    Button {
                        
                    } label: {
                        Text("Resolve")
                            .font(.amsiProBold(size: 15))
                            .padding()
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity)
                            .background(Color("success"))
                            .cornerRadius(5)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Can't resolve")
                            .font(.amsiProBold(size: 15))
                            .padding()
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity)
                            .background(Color("failure"))
                            .cornerRadius(5)
                    }
                }
                
                Image("cross_icon")
                
                Spacer()
                
            }  // Vstack End
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
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
    ))
}
