#!/usr/bin/ruby

class Bd
  attr_reader :users
  @users = []
  def self.<< user
    @users << user
  end
  def self.[](offset)
    @users[offset]
  end
  def self.each(&block)
    @users.each(&block)
  end
  def self.collect(&block)
    @users.collect(&block)
  end
  def self.select(&block)
    @users.select(&block)
  end
  def self.to_s
    @users.to_s
  end
end

