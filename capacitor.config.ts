import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.ultinotooltech.jobcard',
  appName: 'ULTINO TOOL TECH',
  webDir: 'dist',
  bundledWebRuntime: false,
  server: { androidScheme: 'https' },
  android: { allowMixedContent: false },
  plugins: {
    SplashScreen: { launchAutoHide: true },
  },
};

export default config;
