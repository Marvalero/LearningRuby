# -*- encoding: utf-8 -*-
# stub: outoftime-sunspot 0.9.8 ruby lib

Gem::Specification.new do |s|
  s.name = "outoftime-sunspot"
  s.version = "0.9.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mat Brown", "Peer Allan", "Dmitriy Dzema", "Benjamin Krause"]
  s.date = "2009-09-13"
  s.description = "Library for expressive, powerful interaction with the Solr search engine"
  s.email = "mat@patch.com"
  s.executables = ["sunspot-solr", "sunspot-configure-solr"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "bin/sunspot-configure-solr", "bin/sunspot-solr"]
  s.homepage = "http://github.com/outoftime/sunspot"
  s.rdoc_options = ["--charset=UTF-8", "--webcvs=http://github.com/outoftime/sunspot/tree/master/%s", "--title", "Sunspot - Solr-powered search for Ruby objects - API Documentation", "--main", "README.rdoc"]
  s.rubygems_version = "2.2.2"
  s.summary = "Library for expressive, powerful interaction with the Solr search engine"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mwmitchell-rsolr>, ["= 0.9.6"])
      s.add_runtime_dependency(%q<daemons>, ["~> 1.0"])
      s.add_runtime_dependency(%q<optiflag>, ["~> 0.6.5"])
      s.add_runtime_dependency(%q<haml>, ["~> 2.2"])
      s.add_development_dependency(%q<rspec>, ["~> 1.1"])
      s.add_development_dependency(%q<ruby-debug>, ["~> 0.10"])
    else
      s.add_dependency(%q<mwmitchell-rsolr>, ["= 0.9.6"])
      s.add_dependency(%q<daemons>, ["~> 1.0"])
      s.add_dependency(%q<optiflag>, ["~> 0.6.5"])
      s.add_dependency(%q<haml>, ["~> 2.2"])
      s.add_dependency(%q<rspec>, ["~> 1.1"])
      s.add_dependency(%q<ruby-debug>, ["~> 0.10"])
    end
  else
    s.add_dependency(%q<mwmitchell-rsolr>, ["= 0.9.6"])
    s.add_dependency(%q<daemons>, ["~> 1.0"])
    s.add_dependency(%q<optiflag>, ["~> 0.6.5"])
    s.add_dependency(%q<haml>, ["~> 2.2"])
    s.add_dependency(%q<rspec>, ["~> 1.1"])
    s.add_dependency(%q<ruby-debug>, ["~> 0.10"])
  end
end
