# Cattus

`Cattus` wraps `UIImagePickerController` for SwiftUI:

## 例子

### Sheet
```swift
struct ImagePickerExampleView: View {

    @State var showImagePicker: Bool = false
    @State var image: UIImage?

    var body: some View {
        VStack {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Button("Pick image") {
                self.showImagePicker.toggle()
            }
        }
        .sheet(isPresented: $showImagePicker) {
            Cattus(sourceType: .photoLibrary) { image in
                self.image = image
            }
        }
    }
}
```

### ActionSheet

```swift
struct ImagePickerExampleView: View {

    @State var showImagePicker: Bool = false
    @State var showCamraPicker: Bool = false
    @State var showPicker: Bool = false
    @State var image: UIImage?

    var body: some View {
        VStack {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text("Pick")
                .onTapGesture {
                    self.showPicker.toggle()
            }
            .actionSheet(isPresented: $showPicker) {
                ActionSheet(title: Text("iOSDevCenters"), message: Text("SubTitle"), buttons: [
                    .default(Text("Save")) { self.showImagePicker.toggle() },
                    .default(Text("Delete")) { self.showCamraPicker.toggle() },
                    .cancel()
                ])
            }
        }
        .sheet(isPresented: $showImagePicker) {
            Cattus(sourceType: .photoLibrary) { image in
                self.image = image
            }
        }
        .sheet(isPresented: $showCamraPicker) {
            Cattus(sourceType: .camera) { image in
                self.image = image
            }
        }
    }
}
```
