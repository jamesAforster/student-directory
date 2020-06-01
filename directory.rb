student_count = 11
# let's put all of the students into an array so that we can access them
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
]
# and then print them
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts students
end
# finally, we print the total
puts "Overall, we have #{students.count} great students"
