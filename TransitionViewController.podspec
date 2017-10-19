Pod::Spec.new do |s|
  s.name             = 'TransitionViewController'
  s.version          = '1.1.0'
  s.summary          = 'Customize blur transiton effect with Xib.'

  s.description      = 'Use blur transiton effect in 2 steps. '\
                       '1. Subclass your dialog view controller. '\
                       '2. Chose tranistion style you want. '\

  s.homepage         = 'https://github.com/gliyao/TransitionViewController'
  s.screenshots     = 'https://github.com/gliyao/TransitionViewController/blob/master/Resources/darkBlurPopupView.png?raw=true', 'https://github.com/gliyao/TransitionViewController/blob/master/Resources/balck05PopupView.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Liyao Chen' => 'gliyao@gmail.com' }
  s.source           = { :git => 'https://github.com/gliyao/TransitionViewController.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/gliyao'

  s.ios.deployment_target = '8.0'
  s.source_files = 'TransitionViewController/Classes/**/*'
  s.frameworks = 'UIKit'
end
