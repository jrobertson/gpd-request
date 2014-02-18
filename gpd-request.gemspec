Gem::Specification.new do |s|
  s.name = 'gpd-request'
  s.version = '0.2.5'
  s.summary = 'GPD-Request is a convenient Net::HTTP wrapper'
    s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb'] 
  s.signing_key = '../privatekeys/gpd-request.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/gpd-request'
end
