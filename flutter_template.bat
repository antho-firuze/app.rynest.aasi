ECHO OFF

cd lib

mkdir app
cd app
echo "// Dart Extensions" > extensions.dart
echo "// Dependencies Injections" > injection.dart
echo "// Routes " > router.dart
cd ..

mkdir ui
cd ui
mkdir shared
mkdir views
mkdir widgets
cd ..

mkdir constants
mkdir models
mkdir services

PAUSE