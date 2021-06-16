import SwiftUI

struct EditWordView: View {
    
    @Binding var showEditWordView: Bool
    @State var word = Word(name: "", translate: "", analogy: "", shortAnalogy: "")
    @Binding var dict: Dictionary
    var index: Int 
    
    var body: some View {
        ZStack {
            Button(action: {
                showEditWordView = false
            }){
                Rectangle()
                    .fill(Color.init(.clear))
            }
            RoundedRectangle(cornerRadius: 10)
                .fill (Color(.systemBackground))
                .shadow(radius: 10)
                .frame(width: 300, height: 240)
                .overlay(
                    VStack(alignment: .leading) {
                        
                        TextField("word", text: $word.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("translate", text: $word.translate)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("analogy", text: $word.analogy)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("hint", text: $word.shortAnalogy)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                showEditWordView = false
                            }, label: {
                                Text("Cancel")
                            })
                            Spacer()
                            Button(action: {
                                dict.words[index] = word
                                showEditWordView = false
                            }, label: {
                                Text("Save")
                            })
                        }
                    }
                    .padding()
                )
        }
        .ignoresSafeArea()
        .onAppear() {
            if index != -2 {
                word = dict.words[index]
            }
        }
    }
}

struct EditWordView_Previews: PreviewProvider {
    
    static var dict = Dictionary(name: "Test")
    
    static var previews: some View {
        EditWordView(showEditWordView: .constant(true), dict: .constant(dict), index: -2)
    }
}
