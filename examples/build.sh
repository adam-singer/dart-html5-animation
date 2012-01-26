#!/bin/bash
# ~/Documents/DartEditor/dart/dart-sdk/bin/frogc --out=./eventdemo.dart.app.js ./eventdemo.dart 
#DART_SDK=~/Documents/DartEditor/dart/dart-sdk/
#DART_SDK=/Users/adam/Documents/DartEditor/snapshots/dart-macos-2380
#FROGC=$DART_SDK/bin/frogc
#~/dart_bleeding/dart/out/Debug_ia32/dartc --out ./circle.dart.js ./circle.dart 
# building these examples with dartc cause frogc fails on some of the canvas stuff
#DARTC=~/dart_bleeding/dart/out/Debug_ia32/dartc
MINFROG=~/dart_bleeding/dart/frog/minfrog
for htmlFile in `find . -type f -name "*.html"`
do
    htmlDirectory=${htmlFile%/*}
    htmlFileName=${htmlFile##*/}
    name=`echo "$htmlFileName" | cut -d'.' -f1;`
    #echo "RUNNING: $FROGC --out=$htmlDirectory/$name.dart.app.js $htmlDirectory/$name.dart"
    #$FROGC --out=$htmlDirectory/$name.dart.app.js $htmlDirectory/$name.dart
    #echo "RUNNING: $DARTC --out $htmlDirectory/$name.dart.app.js $htmlDirectory/$name.dart"
    #$DARTC --out $htmlDirectory/$name.dart.app.js $htmlDirectory/$name.dart
    echo "RUNNING: $MINFROG --compile-only --out=$htmlDirectory/$name.dart.app.js $htmlDirectory/$name.dart"
    $MINFROG --compile-only --out=$htmlDirectory/$name.dart.app.js $htmlDirectory/$name.dart
    rm -rf out
done;
