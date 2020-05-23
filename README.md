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
            Button("Photo") {
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
struct ContentView: View {

    @State var showImagePicker: Bool = false
    @State var showCamraPicker: Bool = false
    @State var showActionSheetPicker: Bool = false
    @State var image: UIImage?

    var body: some View {
        VStack {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }

            Button("Photo") {
                self.showActionSheetPicker.toggle()
            }
            .actionSheet(isPresented: $showActionSheetPicker, content: {self.actionSheet})
            .sheet(isPresented: $showCamraPicker) {
                if self.showImagePicker {
                    Cattus(sourceType: .photoLibrary) { image in
                        self.image = image
                    }
                } else {
                    Cattus(sourceType: .camera) { image in
                        self.image = image
                    }
                }
            }
        }
    }

    var actionSheet: ActionSheet {
        ActionSheet(title: Text("iOSDevCenters"), message: Text("SubTitle"), buttons: [
            .default(Text("拍照")) {
                self.showCamraPicker.toggle()
                self.showImagePicker = false
            },
            .default(Text("相册")) {
                self.showCamraPicker.toggle()
                self.showImagePicker = true
            },
            .cancel()
        ])
    }

}
```
