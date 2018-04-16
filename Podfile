# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'JFB' do
  use_frameworks!
  inhibit_all_warnings!
  
  pod 'Eureka'
  pod 'SwiftLint'
  pod 'Material', '~> 2'
  pod 'NSStringMask', '~> 1.2'
  
  swift4 = ['Eureka', 'SwiftLint', 'Material']
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      swift_version = nil
      
      if swift4.include?(target.name)
        swift_version = '4.0'
        else
        swift_version = '3.2'
      end
      
      if swift_version
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = swift_version
          config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = ''
        end
      end
    end
  end
  
end

target 'JFBTests' do
  inherit! :search_paths
end
