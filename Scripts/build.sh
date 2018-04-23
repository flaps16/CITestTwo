#! /bin/sh

# Example build script for Unity3D project. See the entire example: https://github.com/JonathanPorta/ci-build

# Change this the name of your project. This will be the name of the final executables as well.

project="ci-build"

# echo "Attempting to build $project for Windows"
# /Applications/Unity/Unity.app/Contents/MacOS/Unity \
#   -batchmode \
#   -nographics \
#   -silent-crashes\
#   -logFile $(pwd)/unityWin.log \
#   -projectPath $(pwd) \
#   -buildWindowsPlayer "$(pwd)/Build/windows/$project.app" \
#   -testResults /unityWinTests.xml \
#   -runTests \
#   -quit


# echo 'Logs from windows build'
# cat $(pwd)/unityWin.log

# echo "Attempting to build $project for OS X"
# /Applications/Unity/Unity.app/Contents/MacOS/Unity \
#   -batchmode \
#   -nographics \
#   -silent-crashes\
#   -logFile $(pwd)/unity.log \
#   -projectPath $(pwd) \
#   -buildOSXUniversalPlayer "$(pwd)/Build/osx/$project.app" \
#   -testResults /unityTests.xml \
#   -runTests \
#   -quit


echo "Attempting to test $project"
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -bacthmode \
  -runEditorTests \
#  -runTests \
  -projectPath $(pwd) \
#  -testRestults $(pwd)/restults/testResults.xml \
  -editorTestsResultFile $(pwd)/testResults.xml \
  -testPlatform editmode
  
echo "-----------------------------"
ls $(pwd)
echo "-----------------------------"
echo 'Logs from build'
cat $(pwd)/unity.log
echo "-----------------------------"
find ~/ -type f -name "unityWinTests.xml"
find ~/ -type f -name "unityTests.xml"
echo "-----------------------------"
