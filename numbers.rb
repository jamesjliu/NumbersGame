#!/usr/bin/env ruby

print "Please enter the number of turns: "
turns=gets.to_i
turns ||=0

score = 0
start = Time.now

turns.times do

  x=Random.rand(1..5)
  y=Random.rand(6..10)
  
  print"#{x} + #{y}="

  answer=gets.to_i

  if answer == x + y
    puts "Correct"
    score += 1
  else
    puts "Incorrect :("
  end
  
  
  
end

if turns==0
  percentage = 0.0
else
  percentage = (score / turns.to_f * 100.0).round(2)
end

finish=Time.now

time = (finish - start).round(2)

puts "Correct Answers = #{score}, Percentage Score = #{percentage} %"
puts "#{time} Seconds"
print "What is your name?:"
name = gets.chomp

filename="scores.txt"

File.open(filename,"a+") do |file|
  file.write "#{score}, #{name}, #{percentage} %, #{time} Seconds, #{turns} turns\n"
end


File.open(filename,"r+") do |file|
  scores=[]
  while entry = file.gets
    scores << entry.split(",")
    scores.sort!.reverse!
  end
  print "These are the top 3 scores"
  puts "#{scores[0,3]}"
end
  

  