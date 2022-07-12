# Uncomment the next line to define a global platform for your project
# platform :ios, '12.0'

def network_pod
  pod 'ReachabilitySwift'
  pod 'Moya', '~> 15.0'
  # pod 'Socket.IO-Client-Swift', '~> 15.2.0'
  pod 'netfox'
end

def ui_pod
  pod 'IQKeyboardManagerSwift', '~> 6.5.4'
  pod 'Kingfisher', '~> 5.0'
  pod 'LCNibBridge', '~> 1.0'
  pod 'lottie-ios'
  pod 'HorizonCalendar'
end

def util_pod
  pod 'CryptoSwift'
end

def assets_pod
  pod 'R.swift'
end

def analytics_pod
  pod 'Firebase/Analytics'
  pod 'Firebase/Crashlytics'
end

target 'Thaigi-HV' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  # Pods for TFChessApp
  network_pod
  ui_pod
  util_pod
  assets_pod
  analytics_pod

  target 'Thaigi-HVTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Thaigi-HVUITests' do
    # Pods for testing
  end
  post_install do |pi|
      pi.pods_project.targets.each do |t|
        t.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
      end
  end
end
