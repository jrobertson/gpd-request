Gem::Specification.new do |s|
  s.name = 'gpd-request'
  s.version = '0.3.0'
  s.summary = 'GPD-Request is a convenient Net::HTTP wrapper'
    s.authors = ['James Robertson']
  s.files = Dir['lib/gpd-request.rb'] 
  s.signing_key = '../privatekeys/gpd-request.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/gpd-request'
  s.required_ruby_version = '>= 2.1.2'
end
