

Pod::Spec.new do |s|
  s.name             = 'LGFCollectionLayout'
  s.version          = '0.1.0'
  s.summary          = 'A short description of LGFCollectionLayout'
  s.description      = <<-DESC
			宽度自使用的layout
                       DESC

  s.homepage         = 'https://github.com/LDreame/LGFCollectionLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qddios2' => '1679606091@qq.com' }
  s.source           = { :git => 'https://github.com/LDreame/LGFCollectionLayout.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'

  s.source_files = 'LGFCollectionLayout/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LGFCollectionLayout' => ['LGFCollectionLayout/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
