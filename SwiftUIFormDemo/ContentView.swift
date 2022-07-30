//
//  ContentView.swift
//  SwiftUIFormDemo
//
//  Created by Arjav Lad on 30/07/22.
//

import SwiftUI

struct ContentView: View {
	@State private var firstName = ""
	@State private var lastName = ""
	@State private var birthDate = Date()
	@State private var email = ""
	@State private var shouldSendNewsletter = false
	@State private var likes = 0
	@State private var sholdShowUserSavedAlert = false
	
	var body: some View {
		NavigationView {
			Form {
				Section(header: Text("Personal Information")) {
					TextField("First Name", text: $firstName)
					TextField("Last Name", text: $lastName)
					DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
					if shouldSendNewsletter {
						TextField("Email", text: $email)
					}
				}
				
				Section(header: Text("Actions")) {
					Toggle("Send Neweletter", isOn: $shouldSendNewsletter)
					Stepper("Likes", value: $likes, in: 0...100)
						.tint(.blue)
					Link(destination: URL(string: "https://twitter.com/ArjavLad")!) {
						Text("View Profile")
					}
					
					Text("\(likes) Likes")
				}
			}
			.navigationTitle("Account Information")
			.toolbar {
				ToolbarItemGroup {
					Button {
						sholdShowUserSavedAlert = true
					} label: {
						Text("Save")
					}
				}
			}
		}
		.tint(.red)
		.alert(isPresented: $sholdShowUserSavedAlert) {
			Alert(
				title: Text("User Info saved."),
				message: Text("")
			)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.previewDevice("iPhone 13")
	}
}
