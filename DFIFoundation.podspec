#
#  Be sure to run `pod spec lint DFIFoundation.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "DFIFoundation"
  s.version      = "0.0.1"
  s.summary      = "A short description of DFIFoundation."
  
  s.description  = <<-DESC
                   DESC

  s.homepage     = "http://EXAMPLE/DFIFoundation"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  
  s.author       = { "sdaheng" => "shidaheng@gmail.com" }

  s.platform     = :ios, "8.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/sdaheng/DFIFoundation.git", :tag => "0.0.1" }

  s.source_files  = "DFIFoundation/**/*.{h,m}"

  s.public_header_files = ["DFIFoundation/DFIFoundationDefines.h",
			   "DFIFoundation/NSString+check.h",
			   "DFIFoundation/NSString+stringValueCategory.h",
			   "DFIFoundation/NSDate+categories.h",
			   "DFIFoundation/DFIQueue.h",
			   "DFIFoundation/DFIStack.h",
			   "DFIFoundation/DFIUnitConvert.h",
			   "DFIFoundation/DFIErrorHandler.h",
			   "DFIFoundation/DFIExceptionHandler.h",
			   "DFIFoundation/DFICryptor.h",
			   "DFIFoundation/DFITimerTypes.h",
			   "DFIFoundation/DFITimer.h",
			   "DFIFoundation/DFICountDownTimer.h",
			   "DFIFoundation/DFIFileOperationManager.h",
			   "DFIFoundation/DFIRemoteNotificationRouter.h"] 

  s.requires_arc = true

end
