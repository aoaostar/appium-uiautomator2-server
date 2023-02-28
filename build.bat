@echo off
.\gradlew clean assembleServerDebug assembleServerDebugAndroidTest && ^
RD /S /Q .\apks & MKDIR .\apks && ^
copy /Y app\build\outputs\apk\server\debug\appium-uiautomator2-server-v*.apk .\apks && ^
copy /Y app\build\outputs\apk\androidTest\server\debug\appium-uiautomator2-server-debug-androidTest.apk .\apks  && ^
npm run sign-apk && ^
for /R .\apks %%s in (*.apk) do (
	adb install %%s
)