Gem::Specification.new do |s|
  s.name        = 'safe_email_name'
  s.version     = '1.1.0'
  s.authors     = ['Sunny Ripert']
  s.email       = ['sunny@kisskissbankbank.com']
  s.homepage    = 'https://github.com/KissKissBankBank/safe_email_name'
  s.summary     = 'Escape To and From fields in emails'
  s.description = 'Escape the name in To and From fields in emails'
  s.license     = 'MIT'
  s.files       = ['lib/safe_email_name.rb']

  s.add_dependency 'mail'
  s.add_dependency 'activesupport'
  s.add_development_dependency 'rspec'
end
