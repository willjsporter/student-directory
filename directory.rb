students_hardcoded = [
  {name: "Dr. Hannibal Lecter", cohort: :july},
  {name: "Darth Vader",cohort: :july},
  {name: "Nurse Ratched",cohort: :july},
  {name: "Michael Corleone",cohort: :july},
  {name: "Alex DeLarge",cohort: :july},
  {name: "The Wicked Witch of the West", cohort: :july},
  {name: "Terminator",cohort: :july},
  {name: "Freddy Krueger",cohort: :july},
  {name: "The Joker", cohort: :july},
  {name: "Joffrey Baratheon", cohort: :july},
  {name: "Norman Bates", cohort: :july}
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students=[]
  stuname=gets.chomp
  while stuname !="" do
    students.push({name: stuname, cohort: :julyBlue})
    puts "Now we have #{students.length} students"
    stuname=gets.chomp
  end
  students
end

students=input_students

def print_header
 puts "The students of Villains Academy"
 puts "-------------"
end

def print_names(students)
 students.each do |student|
 puts "#{student[:name]}, (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  print "Overall, we have #{students.length} great students"
end
print_header
print_names(students)
print_footer(students)
