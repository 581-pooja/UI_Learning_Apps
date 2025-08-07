//
//  Home.swift
//  AppStoreAnimation
//
//  Created by Pooja4 Bhagat on 20/12/24.
//

import SwiftUI
struct Home: View {
    // MARK: Animation Properties
    @State var currentItem: Today?
    @State var showDetailPage: Bool = false
    
    // Matched Geometry Effect
    @Namespace var animation
    
    // MARK: Detail Animation Properties
    @State var animatedView: Bool = false
    @State var animatedContent : Bool = false
    @State var scrollOffset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 0){
                HStack(alignment: .bottom){
                    VStack(alignment: .leading, spacing: 8){
                        Text("Friday 20 DECEMBER")
                            .font(.callout)
                            .foregroundColor(.gray)
                        
                        Text("Today")
                            .font(.largeTitle.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading) // The .frame modifier in SwiftUI is used to specify the size and alignment of a view within its parent container.
                    
                    Button{
                        
                    } label:{
                        Image(systemName: "person.circle.fill")
                            .font(.largeTitle)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                .opacity(showDetailPage ? 0 : 1)
                
                ForEach(todayItems){ item in
                    Button{
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                            currentItem = item
                            showDetailPage = true
                        }
                    } label: {
                        CardView(item: item)
                        // For Matched Geometry Effect We Didnt applied Padding
                        // Instead Applying Scaling
                        // Approx Scaling Value to match padding
                            .scaleEffect(currentItem?.id == item.id && showDetailPage ? 1: 0.93)
                    }
                    .buttonStyle(ScaledButtonStyle())
                    .opacity(showDetailPage ? (currentItem?.id == item.id ? 1 : 0) : 1)
                }
            }
            .padding(.vertical)
        }
        .overlay{
            if let currentItem = currentItem, showDetailPage{
                DetailView(item: currentItem)
                    .ignoresSafeArea(.container, edges: .top)
            }
        }
        // For color at background at details page
        .background(alignment: .top){
            Color(red: 35/255, green: 38/255, blue: 46/255)
                .frame(height: animatedView ? nil : 350, alignment: .top)
                .scaleEffect(animatedView ? 1 : 0.93)
                .opacity(animatedView ? 1 : 0)
                .ignoresSafeArea()
        }
    }
    
    // MARK: CardView
    @ViewBuilder
    func CardView(item: Today) -> some View{
        VStack(alignment: .leading, spacing: 15){
            ZStack(){
                // Banner Image
                GeometryReader{ proxy in
                    let size = proxy.size
                    
                    Image(item.appLogo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 30))
                        .position(x: size.width/2, y: size.height/2)
                }
                .frame(height: 400)
                
                LinearGradient(colors: [
                    .black.opacity(0.5),
                    .black.opacity(0.2),
                    .clear
                ], startPoint: .top, endPoint: .bottom)
                
                VStack(alignment: .leading, spacing: 8){
                    Text(item.platformTitle.uppercased())
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text(item.bannerTitle)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(.primary)
                .padding()
                // for Animated Hero Action till the top
                .offset(y: currentItem?.id == item.id && animatedView ? safeArea().top : 0)
            }
            
            HStack(spacing: 12){
                Image(item.appLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                
                VStack(alignment: .leading, spacing: 4){
                    Text(item.platformTitle.uppercased())
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(item.appName)
                        .fontWeight(.bold)
                    Text(item.appDescription)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                Button{
                    
                } label: {
                    Text("GET")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background{
                            Capsule().fill(.ultraThinMaterial)
                        }
                }
            }
            .padding([.bottom, .horizontal])
        }
        .background(Color(red: 35/255, green: 38/255, blue: 46/255))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(radius: 5)
        .matchedGeometryEffect(id: item.id, in: animation) // try
    }
    
    // MARK: Detail View
    func DetailView(item: Today)-> some View{
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                CardView(item: item)
                VStack(spacing: 15){
                    // Dummy Text
                    Text(dummyText)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                        .padding(.bottom, 20)
                    
                    Divider()
                    Button{
                        
                    } label: {
                        Label {
                            Text ("Share Story")
                        } icon: {
                            Image(systemName: "square. and .arrow.up.fill")
                        }
                        .foregroundColor(.primary)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background{
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .fill(.ultraThinMaterial)
                        }
                    }
                }
                .padding()
                .opacity(animatedContent ? 1 : 0)
                .scaleEffect(animatedView ? 1 : 0, anchor: .top)
            }
            .offset(y: scrollOffset > 0 ? scrollOffset: 0)
            .opacity(animatedContent ? 1 : 0)
        }
        .overlay(alignment: .topTrailing, content: {
            Button {
                // closing view
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                    animatedView = false
                    animatedContent = false
                }
                
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.05)){
                    currentItem = nil
                    showDetailPage = false
                }
            }
        label: {
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .foregroundStyle(.white)
        }
        .padding()
        .padding(.top, safeArea().top)
        .offset(y: -10)
        .opacity(animatedView ? 1:0)
        })
        .onAppear{
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7)){
                animatedView = true
            }
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7).delay(0.05)){
                animatedContent = true
            }
        }
    }
    
    
}

#Preview {
    Home()
        .preferredColorScheme(.dark)
}

// Mark : ScaledButton style
struct ScaledButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.94: 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

// Safe Area Value
extension View{
    func safeArea() -> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene
        else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        return safeArea
    }
    
    // MARK: ScrollView Offset
    func offset(offset: Binding<CGFloat>) -> some View{
        return self
            .overlay{
                GeometryReader{ proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    Color.clear
                        .preference(key: OffsetKey.self, value: minY)
                }
                .onPreferenceChange(OffsetKey.self, perform: { value in
                    offset.wrappedValue = value
                })
            }
    }
}

// MARK: Offset Key
struct OffsetKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
