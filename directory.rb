@students=[]
def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  # create an empty array
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
  add_to_stus(name, "November")
  puts "Now we have #{@students.count} students"
  # get another name from the user
  name = STDIN.gets.chomp
  end
  # return the array of students
  @students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)\n"
  end
end

def print_footer
  puts "Overall, we have #{@students.length} great students"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_file
    when "4"
      try_load_file
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_file
  ARGV.first.nil? ? filename="students.csv" : filename=ARGV.first
  file=File.open("students.csv","w")
  @students.each do |student|
    student_data=[student[:name],student[:cohort]]
    #sep with commas
    csv_value=student_data.join(",")
    #write to file line by line
    file.puts csv_value
  end
  file.close
  puts "File saved"
end

def add_to_stus(new_name, cohort_id)
  @students << {name: new_name, cohort: cohort_id.intern}
end

def try_load_file
  arg=ARGV.first 
  #return if arg.nil?
  if arg.nil?
    load_file; puts "No file name specified, loaded students.csv"
  elsif File.exists?(arg)
    load_file(arg); puts "#{arg} specified and exists. File loaded"
  else
    puts "Filename does not exist. Process terminated."; Exit
  end
end

def load_file(arg="students.csv")
  file=File.open(arg,"r")
  file.readlines.each do |line|
    name, cohort= line.chomp.split(",")
    cohort ? add_to_stus(name, cohort) : "Blank file"
  end
  file.close
end

interactive_menu
