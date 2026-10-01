# Build the APK without Android Studio

1. Upload this project to a GitHub repository.
2. Open **Actions** and select **Build Android APK**.
3. Click **Run workflow**.
4. When it finishes, open the workflow run and download **ULTINO-TOOL-TECH-debug-apk**.
5. Extract the artifact and install `app-debug.apk` on the Android phone.

The workflow creates the Capacitor Android project in the cloud, installs the Android platform, syncs the web build, and runs Gradle. Android Studio is not required on your computer.

For Supabase, put the project's URL and publishable/anon key into the app's Cloud Sync settings on the phones, then sign the phones into the same workshop account. Do not put a Supabase service-role key into the app.
