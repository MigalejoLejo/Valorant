


import SwiftUI


struct NavigationButton: View {
    
    let image:String
    let title:String
    let color:Color
    
    var body: some View {
        ZStack{
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 150)
                .opacity(0.8)
            
            VStack{
                Spacer()
                ZStack{
                    Rectangle()
                        .frame(width: 350, height: 40)
                        .foregroundColor(color)
                    Text(title)
                        .foregroundColor(.white)
                        .font(.title)
                        .cornerRadius(5)
                        .bold()
                }
            }
        }
    }
}
