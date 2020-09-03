months= {
  "January"   =>  31,
  "February"  =>  29,
  "March"     =>  31,
  "April"     =>  30,
  "May"       =>  31,
  "June"      =>  30,
  "July"      =>  31,
  "Augsut"    =>  31,
  "September" =>  30,
  "October"   =>  31,
  "November"  =>  30,
  "December"  =>  31,
}

months.each do |key, value|
  puts "В #{key}: #{value} дней" if value == 30
end
