import SwiftUI



struct AccountView: View {
    
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var image :UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                Group {
                Button(action: {
                    showSheet = true
                }) {
                    Image(uiImage: image ?? UIImage(named: "placeholder")!)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }.padding()
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Select Photo"),
                                message: Text("Choose"), buttons: [
                                    .default(Text("Photo Library")) {
                                        showImagePicker = true
                                        sourceType = .photoLibrary
                                    },
                                    .default(Text("Camera")) {
                                        showImagePicker = true
                                        sourceType = .camera
                                    },
                                    .cancel()
                                ])
                }
                }
                Text("name")
                
                
            }
            .navigationBarHidden(true)
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $image, isShown: $showImagePicker, sourceType: sourceType)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
