def input_students
  puts "Please enter the names of the students to enter."
  puts "To finish, just hit return twice."
  # create an empty array 
  students = []
  cohorts = [:january, :april, :august, :november]
  # get the first name
  name = gets.chomp
  # while the name is empty, repeat this code
  while !name.empty? do
    # when a valid name is entered, then asks for a valid cohort
    puts "Please enter cohort"
    cohort = gets.chomp.to_sym
    while !cohort.empty? do
      if cohorts.include?(cohort)
        students << {name: name, cohort: cohort}
        cohort = ""
      else 
        puts "Cohort not found. Please enter a valid cohort, or press enter to skip."
        cohort = gets.chomp.to_sym
      end
    end
    puts "Please enter another name, or press enter to skip. "
    name = gets.chomp
  end


  # if statement to display the correct grammar when displaying total student number.
  if students.empty?
    puts "We currently have no students."
  elsif students.count == 1
    puts "We now have 1 student."
  else
    puts "We now have #{students.length} students."
  end

  return students

end

def print_header 
  puts "--------------------------------"
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  # puts "Please enter the first letter, or hit return to see the full list: "
  # letter = gets.chomp
  
  # while !letter.empty? do 
  #   students.each_with_index do |student, index|
  #     if student[:name][0] == letter
  #     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]})"
  #     end
  #   end
  #   puts "Please enter the first letter, or hit return to see the full list: "
  #   letter = gets.chomp
  # end
  puts "Please enter the cohort to group by, or press enter to see the whole list."
  view_cohort = gets.chomp.to_sym

  while !view_cohort.empty? do 

    students.each_with_index do |student,index|
      if student[:cohort] == view_cohort
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]})"
      end
    end
    puts "Please enter another cohort to view, or press enter to see the whole list."
    view_cohort = gets.chomp.to_sym
  end

  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]})"
  end

end



def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)