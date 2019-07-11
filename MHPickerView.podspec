Pod::Spec.new do |spec|

  spec.name         = "MHPickerView"
  spec.version      = "1.0.4"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.summary      = "广西心理通用picker"
  spec.homepage     = "https://github.com/jishaowei"
  spec.author       = { "xiaofengwork" => "jishaoweixiaofeng@163.com" }
  spec.source       = { :git => "https://github.com/jishaowei/MHPickerView.git", :tag => spec.version }
  spec.source_files = "MHPickerView/MHPickerView/*.{h,m}"
  spec.requires_arc = true
  spec.platform     = :ios, "9.0"
  spec.resource     = "MHPickerView/MHPickerView/AddressData/*.{xml}","MHPickerView/MHPickerView/ImageSources/*.{png}"
  spec.dependency "Masonry"

end