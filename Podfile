# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'SwiftSocket' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'Socket.IO-Client-Swift', '~> 15.2.0'
  pod 'SwiftNIO'
  # Pods for SwiftSocket

  post_install do |installer|
      installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.0'
        end
      end
    end
end
