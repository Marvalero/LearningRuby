# Files:

  - devices.rb: module LocalNetwork{ #create the singleton object @devices }
  - mainserver.rb: module LocaNetwork{ #create a class singleton
    MainServer # extend InputsOutputs }
  - inputs_outputs.rb: module InputsOutputs { define methods }
  - refinator.rb: module TestNetwork { module Refinator { # refine
    MainServer } }
  - switch.rb: module LocalDevices { include Port, add_port}
  - router.rb: module LocalDevices{ include Port, add_port}
  - port.rb: module Port{ ClassMethods{add_port}, see_all_ports,
    self.included{host_class.extend(ClassMethod)} }
  - user.rb: defining a User with an Struct
