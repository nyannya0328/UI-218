//
//  Home.swift
//  UI-218
//
//  Created by にゃんにゃん丸 on 2021/06/02.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab : Trip = trips[0]
    var body: some View {
        ZStack{
            
            
            GeometryReader{proxy in
                
                let frame = proxy.frame(in:.global)
                
                Image(selectedTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: frame.width, height: frame.height)
                    .cornerRadius(0)
                
                
               
                
                
                
            }
            .ignoresSafeArea()
            
            
            VStack{
                
                Text("Let's go With")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom,6)
                
                
                Text("TRIP")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .kerning(1.3)
                    .padding(.bottom)
                
                
                VStack{
                    
                    GeometryReader{proxy in
                        
                        let frame = proxy.frame(in:.global)
                        
                        TabView(selection:$selectedTab){
                            
                            
                            ForEach(trips){trip in
                                
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: frame.width - 10, height: frame.height)
                                    .cornerRadius(10)
                                    .tag(trip)
                                
                                
                                
                                
                            }
                            
                            
                            
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        
                        
                        
                    }
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    
                    Text(selectedTab.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.top,10)
                        .padding(.bottom,120)
                    
                    
                    PageController(currentPage: getIndex(), MaxPage: trips.count)
                    
                    
                    
                    
                }
                .padding(.top)
                .padding(.horizontal,10)
                .padding(.bottom,15)
                .background(Color.white.clipShape(CustomShape()))
                
                .padding(.horizontal,20)
                
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("GET START")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,10)
                        .padding(.horizontal,5)
                        .background(Color.primary)
                        .cornerRadius(20)
                        .shadow(color: .white, radius: 10, x: 0.0, y: 0.0)
                })

                
            }
            .padding()
        }
    }
    
    func getIndex()->Int{
        
        
        let index = trips.firstIndex { trip in
            selectedTab.id == trip.id
        } ?? 0
        
        return index
        
    }
}


struct CustomShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            
            let midWidth = rect.width / 2
            
            path.addLine(to: CGPoint(x:midWidth - 75, y: rect.height))
            
            path.addLine(to: CGPoint(x:midWidth - 75, y: rect.height - 35))
            
            path.addLine(to: CGPoint(x:midWidth + 75, y: rect.height - 35))
            
            
            path.addLine(to: CGPoint(x:midWidth + 75, y: rect.height))
            
            
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
            
            
        }
    }
}

struct PageController : UIViewRepresentable {
    var currentPage : Int
    var MaxPage : Int
    
    func makeUIView(context: Context) -> UIPageControl {
        
        let view = UIPageControl()
        view.backgroundStyle = .minimal
        view.pageIndicatorTintColor = .black
       
        view.numberOfPages = MaxPage
        view.currentPage = currentPage
       
        return view
        
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        uiView.currentPage = currentPage
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
