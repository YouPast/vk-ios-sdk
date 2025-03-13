

PROJECT_NAME="VK-ios-sdk"
SCHEME_NAME="Framework"
FRAMEWORK_NAME="VKSdkFramework"


rm -rf build

xcodebuild clean archive \
-project "${PROJECT_NAME}.xcodeproj" \
-scheme $SCHEME_NAME \
-sdk iphoneos \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES 


xcodebuild clean archive \
-project "${PROJECT_NAME}.xcodeproj" \
-scheme $SCHEME_NAME \
-sdk iphoneos \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES 


xcodebuild -create-xcframework \
-framework "./build/iphonesimulator.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
-framework "./build/iphoneos.xcarchive/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
-output "./build/${FRAMEWORK_NAME}.xcframework"
