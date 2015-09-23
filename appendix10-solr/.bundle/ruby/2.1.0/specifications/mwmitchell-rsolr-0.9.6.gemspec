# -*- encoding: utf-8 -*-
# stub: mwmitchell-rsolr 0.9.6 ruby lib

Gem::Specification.new do |s|
  s.name = "mwmitchell-rsolr"
  s.version = "0.9.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Matt Mitchell"]
  s.date = "2009-09-12"
  s.description = "RSolr is a Ruby gem for working with Apache Solr!"
  s.email = "goodieboy@gmail.com"
  s.extra_rdoc_files = ["LICENSE", "Rakefile", "README.rdoc", "CHANGES.txt"]
  s.files = ["CHANGES.txt", "LICENSE", "README.rdoc", "Rakefile"]
  s.homepage = "http://github.com/mwmitchell/rsolr"
  s.rubygems_version = "2.2.2"
  s.summary = "A Ruby client for Apache Solr"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<builder>, [">= 2.1.2"])
    else
      s.add_dependency(%q<builder>, [">= 2.1.2"])
    end
  else
    s.add_dependency(%q<builder>, [">= 2.1.2"])
  end
end
