//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Aldrich Co on 7/15/20.
//  Copyright © 2020 Aldrich Co. All rights reserved.
//

import SwiftUI

struct Event: Identifiable {
	var id = UUID()
	var date: String
	var name: String
	var location: String
	var isFree: Bool
	var thumbImage: String
}

struct ContentView: View {
	
	let imageName = "filip-gielda-QKrLdkoYDrc-unsplash"
	
	let heading = "MEXICO CITY"
	let subText = "Heart of Mexico tourism"
	
	// Carousel
	let carouselTitle = "THINGS TO SEE"
	let carouselMoreTitle = "More"
	
	let carouselImages = [
		"davis-vargas-2vSNlKHn9h0-unsplash",
		"davis-vargas-2vSNlKHn9h0-unsplash",
		"davis-vargas-2vSNlKHn9h0-unsplash",
		"davis-vargas-2vSNlKHn9h0-unsplash",
		"davis-vargas-2vSNlKHn9h0-unsplash",
		"davis-vargas-2vSNlKHn9h0-unsplash",
	]
	
	var events: [Event] = [
		Event(date: "Today",
			  name: "Mecixo Home Show Autumn 2020",
			  location: "Queen Alexandria AOC Covfefe Center",
			  isFree: true,
			  thumbImage: "davis-vargas-2vSNlKHn9h0-unsplash"),
		
		Event(date: "Today",
			  name: "Mecixo Home Show Autumn 2020",
			  location: "Queen Alexandria AOC Covfefe Center",
			  isFree: true,
			  thumbImage: "davis-vargas-2vSNlKHn9h0-unsplash"),
		
		Event(date: "Today",
			  name: "Mecixo Home Show Autumn 2020",
			  location: "Queen Alexandria AOC Covfefe Center",
			  isFree: true,
			  thumbImage: "davis-vargas-2vSNlKHn9h0-unsplash"),
	]
	
	var body: some View {
		NavigationView {
			
			GeometryReader { geometry in
				
				ScrollView {
					
					VStack(alignment: .leading, spacing: 4) {
						
						Image(self.imageName)
							.resizable()
							.frame(width: geometry.size.width, height: 240, alignment: .center)
							.scaledToFit()
							.padding(.bottom, 20)
						
						HStack {
							
							VStack(alignment: .leading, spacing: 2) {
								Text(self.heading)
									.font(.system(size: 24, weight: .black))
								
								Text(self.subText)
									.font(.system(size: 16, weight: .regular))
								
							}
							.padding(.horizontal, 20)
							
							Spacer()
							
							VStack(alignment: .trailing, spacing: 2) {
								Text("18ºC")
									.font(.system(size: 24, weight: .black))
								
								Text("Cloudy")
									.font(.system(size: 16, weight: .regular))
							}
							.foregroundColor(.gray)
							.padding(.horizontal, 20)
						}
						.padding(.bottom, 20)
						
						// this is the divider line to the next section
						Color(white: 0.2)
							.frame(width: 100, height: 1)
							.padding(.leading, 20)
							.padding(.bottom, 24)
						
						// --- (Carousel) TOUR PACKAGES
						
						// ----- Header
						HStack {
							Text(self.carouselTitle)
								.font(.system(size: 18, weight: .medium))
								.padding(.leading, 20)
							Spacer()
							
							Text(self.carouselMoreTitle)
								.padding(.trailing, 20)
						}
						
						ScrollView(.horizontal) {
							HStack {
								ForEach(0..<self.carouselImages.count) {
									Image(self.carouselImages[$0])
										.resizable()
										.aspectRatio(contentMode: .fill)
										.frame(width: geometry.size.width * 0.65, height: 140)
										.cornerRadius(4)
										.padding(.horizontal, 1)
									
								}
							}
							.padding(.vertical, 16)
							.padding(.horizontal, 20)
						}
						EventsList(events: self.events)
					}
				}
				.edgesIgnoringSafeArea(.all)
			}
			.navigationBarTitle("Hey")
		}
    }
}

struct EventsList: View {
	
	// Events List
	let eventsHeaderTitle = "Mexico City Events"
	let eventsSubHeaderTitle = "Relevant"
	
	var events: [Event]
	
	var body: some View {
		
		ScrollView(showsIndicators: false) {
			
			
			VStack {
				// (List) CITY EVENTS
				// ----- Header
				HStack {
					Text(self.eventsHeaderTitle)
						.font(.system(size: 24, weight: .black))
						.padding(.leading, 20)
					
					Spacer()
					
					Text(self.eventsSubHeaderTitle)
						.padding(.trailing, 20)
				}
				
				
				ForEach(events) { (event: Event) in
					HStack {
						Image(event.thumbImage)
							.resizable()
							.frame(width: 96, height: 96)
							.scaledToFit()
							.cornerRadius(4)
							.padding(.leading, 20)
						
						
						VStack(alignment: .leading) {
							Text(event.date)
								.font(.system(size: 12, weight: .regular))
								.padding(.bottom, 6)
							
							Text(event.name)
								.font(.system(size: 15, weight: .bold))
								.padding(.bottom, 12)
							
							Text(event.location)
								.font(.system(size: 12, weight: .regular))
						}
						.padding(.trailing, 20)
						
						Spacer()
					}
				}
			}
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
	
	static let sampleEvent = Event(date: "SAT, 17 SEP 12:00",
								   name: "Mecixo Home Show Autumn 2020",
								   location: "Queen Alexandria AOC Covfefe Center",
								   isFree: true,
								   thumbImage: "davis-vargas-2vSNlKHn9h0-unsplash")
	
	static var events: [Event] = {
		(0...10).map { (_) -> Event in
			sampleEvent
		}
	}()

	
	static var previews: some View {
		ContentView()
		// EventsList(events: events)
	}
}
