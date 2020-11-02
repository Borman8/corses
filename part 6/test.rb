
  def connect_to_wikipedia
    #...
    raise "Connection error"
  end

  attempt = 0
  begin
    connect_to_wikipedia
  rescue RuntimeError
    attempt += 1
    puts "Check your internet connection! attempt = #{attempt}"
    retry if attempt < 3
  #ensure
    #puts "There was #{attempt} attempts"
  end

