Gem::Specification.new do |s|
    s.name         = 'webmanager'
    s.version      = '0.0.1'
    s.licenses     = ['MIT']
    s.summary      = "This open a web"
    s.description  = File.read(File.join(File.dirname(__FILE__),'../README'))
    s.authors      = ["Maria Valero"]
    s.email        = 'Maria.Campana@workshare.com'
    s.files        = Dir['**/**']
    s.requirements = ['rspec','nokogiri']
    s.platform     = Gem::Platform::RUBY
    s.required_ruby_version = '>=2.1.0'
    s.executables = ['webmanager']
    s.test_files  = Dir["spec/*_spec.rb"]
    s.has_rdoc    = false
    # s.homepage     = 'https://rubygems.org/gems/example'
end
