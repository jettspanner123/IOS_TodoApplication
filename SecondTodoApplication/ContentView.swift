import SwiftUI


struct NavbarOptions: Hashable {
    var name: String
    var link: String
}

struct ContentView: View {
    
    @State var isNavbarOpen: Bool = false
    @State var inBetween: Bool = false
    
    
    var NavbarOptionsArray: [NavbarOptions] = [
        NavbarOptions(name: "Todos", link: ""),
        NavbarOptions(name: "Notes", link: ""),
        NavbarOptions(name: "Social", link: ""),
        NavbarOptions(name: "Something", link: ""),
    ]
    
    
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "person.fill")
                        .padding(15)
                        .imageScale(.large)
                        .background(.white.opacity(0.7))
                        .foregroundStyle(.black)
                        .clipShape(Circle())
                    Spacer()
                    Image(systemName: "line.3.horizontal")
                        .padding(20)
                        .imageScale(.large)
                        .background(!isNavbarOpen ? .white.opacity(0.7) : .white)
                        .foregroundStyle(.black)
                        .clipShape(Circle())
                        .offset(x: isNavbarOpen ? -175 : 0)
                        .onTapGesture {
                            withAnimation(.spring().delay(0.15)) {
                                isNavbarOpen.toggle()
                            }
                        }
                }
                .frame(maxWidth: .infinity)
                .padding(
                    EdgeInsets(top: 60, leading: 30, bottom: 0, trailing: 25)
                )
                Spacer()
            }
            .offset(x: isNavbarOpen ? 200 : 0)
            .scaleEffect(isNavbarOpen ? 0.9 : 1)
            .ignoresSafeArea()
            .background(Color("Green"))
            
            
            // this is the navigation bar
            VStack {
                
                                
                HStack {
                    Image(systemName: "person.fill")
                    .imageScale(.large)
                    .padding()
                    .background(.black)
                    .clipShape(Circle())
                    .offset(x: -40)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(
                    EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0)
                )
                VStack {
                    ForEach(NavbarOptionsArray, id: \.self) {
                        options in
                        HStack {
                            Text("\(options.name)")
                                .foregroundStyle(.black)
                                .font(.system(size: 30, weight: .regular))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: 130)
                        .onTapGesture {
                            withAnimation() {
                                inBetween = true
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                                withAnimation() {
                                    inBetween = false
                                }
                            })
                        }
                        
                        Divider()
                    }
                }
                Spacer()
            }
            .padding(
                EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0)
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .offset(x: isNavbarOpen ? -100 : -400)
            
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("Orange")
            )
            .offset(y: inBetween ? 0 :-820)
            .zIndex(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Green"))
        
    }
}

#Preview {
    ContentView()
}
