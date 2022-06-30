xcodebuild build -scheme Tutorials -destination generic/platform=iOS
xcodebuild docbuild -scheme Tutorials \
-destination generic/platform=iOS \
OTHER_DOCC_FLAGS="--transform-for-static-hosting --output-path docs --hosting-base-path SwiftUITutorials"