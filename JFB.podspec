Pod::Spec.new do |s|
  s.name             = 'JFB'
  s.version          = '0.1'
  s.summary          = "Jera's new way to build form quickly and easily"

  s.description      = <<-DESC
  Jera Form Builder (JFB) bring a new way to build form using *Eureka* enginee
                       DESC

  s.homepage         = 'https://github.com/vitormesquita/JFB'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vitor Mesquita' => 'vitor.mesquita09@gmail.com' }
  s.source           = { :git => 'https://github.com/vitormesquita/JFB.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  
  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files  = "Source/**/*.swift"

    ss.dependency 'Eureka', '~> 4'
    ss.dependency 'Material', '~> 2'
    ss.dependency 'NSStringMask', '~> 1.2'
  end

  s.resource_bundles = {
    'JFB' => ['Assets/*.png']
  }

end
