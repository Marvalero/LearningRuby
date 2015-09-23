# -*- encoding: utf-8 -*-
# stub: haml 2.2.24 ruby lib

Gem::Specification.new do |s|
  s.name = "haml"
  s.version = "2.2.24"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Nathan Weizenbaum", "Hampton Catlin"]
  s.date = "2010-04-27"
  s.description = "      Haml (HTML Abstraction Markup Language) is a layer on top of XHTML or XML\n      that's designed to express the structure of XHTML or XML documents\n      in a non-repetitive, elegant, easy way,\n      using indentation rather than closing tags\n      and allowing Ruby to be embedded with ease.\n      It was originally envisioned as a plugin for Ruby on Rails,\n      but it can function as a stand-alone templating engine.\n"
  s.email = "haml@googlegroups.com"
  s.executables = ["haml", "html2haml", "sass", "css2sass"]
  s.extra_rdoc_files = ["VERSION_NAME", "CONTRIBUTING", "README.md", "REMEMBER", "MIT-LICENSE", "VERSION", "REVISION"]
  s.files = ["CONTRIBUTING", "MIT-LICENSE", "README.md", "REMEMBER", "REVISION", "VERSION", "VERSION_NAME", "bin/css2sass", "bin/haml", "bin/html2haml", "bin/sass"]
  s.homepage = "http://haml-lang.com/"
  s.rdoc_options = ["--title", "Haml", "--main", "README.rdoc", "--exclude", "lib/haml/buffer.rb", "--line-numbers", "--inline-source"]
  s.rubyforge_project = "haml"
  s.rubygems_version = "2.2.2"
  s.summary = "An elegant, structured XHTML/XML templating engine. Comes with Sass, a similar CSS templating engine."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<yard>, [">= 0.5.3"])
      s.add_development_dependency(%q<maruku>, [">= 0.5.9"])
    else
      s.add_dependency(%q<yard>, [">= 0.5.3"])
      s.add_dependency(%q<maruku>, [">= 0.5.9"])
    end
  else
    s.add_dependency(%q<yard>, [">= 0.5.3"])
    s.add_dependency(%q<maruku>, [">= 0.5.9"])
  end
end
