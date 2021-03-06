import SwiftUI

struct AddWordView: View {
    
    @Binding var showAddWordView: Bool
    @State var word = Word(name: "", translate: "", analogy: "", shortAnalogy: "")
    @Binding var dict: Dictionary
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.1)
            VStack {
                ZStack {
                    Button(action: {
                        showAddWordView = false
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
                                        showAddWordView = false
                                    }, label: {
                                        Text("Cancel")
                                    })
                                    Spacer()
                                    Button(action: {
                                        dict.words.append(word)
                                        showAddWordView = false
                                    }, label: {
                                        Text("Save")
                                    })
                                    
                                }
                            }
                            .padding()
                        )
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct AddWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordView(showAddWordView: .constant(true), dict: .constant(Dictionary(name: "")))
    }
}
