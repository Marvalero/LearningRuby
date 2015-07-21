#!/usr/bin/ruby

require_relative "write_webpage"
require 'thread'

class Execution
  def create_fiber(*pages)
    reader = WriteWebpage.new
    @fibers = pages.map do |url|
      Fiber.new do
        web = reader.read_from_web(url)
        web.xpath('//h3/a').each { |node| Fiber.yield(node.text) }
        nil
      end
    end
    # Every time we resume a fiber it will return an h3 title
    @fibers.collect {|fiber| fiber.resume}
  end
  def next_fiber_h3
    @fibers.map do |fiber|
      puts "titulo: "
      if title = fiber.resume then title else (@fibers.delete(fiber) and nil) end
    end unless @fibers.nil?
  end

  def create_threads(*pages)
    reader = WriteWebpage.new
    # 1- Mutex
    # mutex = Mutex.new
    # titles = []
    # 2- Using queue
    # queue = Queue.new
    threads = pages.map do |url|
      Thread.new(url) do |url_local|
        reader.read_from_web(url_local).xpath('//h3/a').each_with_index.map do |node,i|
          # 1- Writing titles with a mutex
          # mutex.synchronize do
          #   titles.push(node.text) and puts node.text if i==0
          # end

          # 2- Using queue
          # queue << node.text if i==0

          # Returning value for collect
          # node.text

          # 3- Writing the last title in thread variable
          Thread.current[:first] = node.text if  i==0
        end
      end
    end
    @result_thr = threads.collect {|thr| thr.join and thr.value}
    # 1- Exporting mutex value
    # titles
    # 2- Exporting queue value
    # pages.length.times.map { queue.deq }
    # 3- Exporting thread variables
    threads.map {|thr| thr[:first]}

  end
  def next_thread_h3
    @result_thr.map { |search| search.shift } unless @result_thr.nil?
  end

  def create_processes_write(webpage, file)
    reader = WriteWebpage.new
    fork do
      # In child
      reader.read_from_web(webpage)
      reader.write_in_file(file)
    end
    Process.wait
    ":D"
  end
  def delete_file(file)
    if system("rm #{file}")
      "Deleted"
    else
      "Error"
    end
  end
end
