@students = []

def input_students
  puts "Please enter the names of the students to enter."
  puts "To finish, just hit return."
  # create an empty array 
  # students = []
  cohorts = [:january, :april, :august, :november]
  # get the first name
  name = STDIN.gets.chomp
  # while the name is empty, repeat this code
  while !name.empty? do
    # when a valid name is entered, then asks for a valid cohort
    puts "Please enter cohort"
    cohort = gets.chomp.to_sym
    while !cohort.empty? do
      if cohorts.include?(cohort)
        @students << {name: name, cohort: cohort}
        cohort = ""
      else 
        puts "Cohort not found. Please enter a valid cohort, or press enter to skip."
        cohort = STDIN.gets.chomp.to_sym
      end
    end
      if @students.length == 1
        puts "We now have 1 student."
      else
        puts "We now have #{@students.length} students."
      end
    puts "Please enter another name, or press enter to skip. "
    name = gets.chomp
  end
end


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "Please enter an option: "
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      try_load_students
    when "9"
      exit
    else
      puts "Invalid selection, please try again"
  end
end

def print_header 
  puts "--------------------------------"
  puts "The students of Villains Academy"
  puts "--------------------------------"
end


def print_students_list
  if @students.length > 0
    puts "Please enter the cohort to group by, or press enter to see the whole list."
    print_by_cohort
    print_all_students
  else
    puts "We do not have any students."
  end
end

def print_by_cohort
  view_cohort = gets.chomp.to_sym
  while !view_cohort.empty? do 
    @students.each_with_index do |student,index|
      if student[:cohort] == view_cohort
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]})"
      end
    end
    puts "Please enter another cohort to view, or press enter to see the whole list."
    view_cohort = gets.chomp.to_sym
  end
end

def print_all_students
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]})"
  end
end

def print_footer
  if !@students.empty?
    if @students.count == 1
      puts "In total, we have 1 student."
    else
      puts "In total, we have #{@students.length} students."
    end
  end
end

def save_students
  file = File.open("students.csv","w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename,"r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit 
  end
end

# nothing happens until we call the methods
load_students
interactive_menu