#!/usr/bin/ruby

module LocalNetwork
 # 2- Our singleton object
  @devices = "clients"
  #    a- Add a method: first way
  def @devices.add_device
    @num= 0 unless defined? @num
    @num= @num+ 1
  end
  #    b- Add a method: second way
  class << @devices
    def rm_device
      @num= 1 unless defined?
      @num= num- 1
    end
  end
  #    c- Get the singleton object
  # singleton = class << devices
  #               self
  #             end

end

