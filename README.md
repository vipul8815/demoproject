# demo

A new Flutter application.

## Getting Started
```
### to generate new icons for android and ios.

replace new images on lib/assets/logo.png (1024px*1024px)  run following commands.
```
cp lib/assets/logo.png ios/Runner/Assets.xcassets/AppIcon.appiconset/ItunesArtwork@2x.png
flutter packages pub get
flutter pub run flutter_launcher_icons:main
```