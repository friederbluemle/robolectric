#!/bin/sh
#
# This script installs the Android Support v4 jar in your local Maven repository.
#
# Usage:
#   install-support-jar.sh
#
# Assumptions:
#  1. You've got one or more Android SDKs installed locally.
#  2. Your ANDROID_HOME environment variable points to the Android SDK install dir.
#  3. You have installed the Android Support (compatibility) libraries from the SDK installer.

jarLocation="$ANDROID_HOME/extras/android/m2repository/com/android/support/support-v4/19.1.0/support-v4-19.1.0.jar"
if [ ! -f "$jarLocation" ]; then
  jarLocation="$ANDROID_HOME/extras/android/support/v4/android-support-v4.jar"
  if [ ! -f "$jarLocation" ]; then
    echo "support-v4 artifact not found!";
    exit 1;
  fi
fi

echo "Installing com.android.support:support-v4 from $jarLocation"
mvn -q install:install-file -DgroupId=com.android.support -DartifactId=support-v4 \
  -Dversion=19.1.0 -Dpackaging=jar -Dfile="$jarLocation"

jarLocation="$ANDROID_HOME/extras/android/m2repository/com/android/support/appcompat-v7/19.1.0/appcompat-v7-19.1.0.jar"
if [ ! -f "$jarLocation" ]; then
  jarLocation="$ANDROID_HOME/extras/android/support/v7/appcompat/libs/android-support-v7-appcompat.jar"
  if [ ! -f "$jarLocation" ]; then
    echo "appcompat-v7 artifact not found!";
    exit 1;
  fi
fi

echo "Installing com.android.support:appcompat-v7 from $jarLocation"
mvn -q install:install-file -DgroupId=com.android.support -DartifactId=appcompat-v7 \
  -Dversion=19.1.0 -Dpackaging=jar -Dfile="$jarLocation"

echo "Done!"
