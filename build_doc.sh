xcodebuild docbuild -scheme Tutorials \
-destination generic/platform=iOS \
OTHER_DOCC_FLAGS="--transform-for-static-hosting --output-path docs --hosting-base-path zeewanderer.github.io/SwiftUITutorials"