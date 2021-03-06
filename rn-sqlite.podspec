require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name     = "rn-sqlite"
  s.version  = package['version']
  s.summary  = package['description']
  s.homepage = "https://github.com/andpor/rn-sqlite"
  s.license  = package['license']
  s.author   = package['author']
  s.source   = { :git => package['repository']['url'], :tag => "v#{s.version}" }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'

  s.preserve_paths = 'README.md', 'LICENSE', 'package.json', 'sqlite.js'
  s.source_files   = "src/ios/*.{h,m}"

  s.dependency 'React'
  s.library = 'sqlite3'
end
