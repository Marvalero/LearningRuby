
class Watch
  def initialize
    Time.now.to_s.match(/(\d\d:\d\d:\d\d)/)
    @@watch = $1
    run
  end
  def get
    @@watch
  end
  def set(value)
    if value.match(/\d\d:\d\d:\d\d/)
      @@watch=value
    else
      raise RuntimeError("Incorrect time")
    end
  end
  def run
    Fiber.new do
      while true
        sleep(1)
        @@watch = @@watch.split(":")
        if @@watch.last=="59"
          @@watch[3]="00"
          if @@watch[1]=="59"
            @@watch[1]="00"
            if @@watch[0] == "23"
              @@watch[0] = "00"
            else
              @@watch[0] = (@@watch[0].to_i + 1).to_s
            end
          else
            @@watch[1] = (@@watch[1].to_i+1).to_s
          end
        else
          @@watch[-1] = (@@watch[-1].to_i + 1).to_s
        end
        @@watch = @@watch.join
      end
    end
  end
end
