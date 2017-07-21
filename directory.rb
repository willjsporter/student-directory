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
  puts "Please enter the names, cohort, hobbies and birthday of the students"
  puts "To finish, just hit return twice upon input of final student data"

require 'date'
  students=[]
  stuname=gets.chomp
    cohort_id=gets.chop
    hobbyy=gets.gsub(/\n/, '')
    cohort_id="july" if cohort_id==""
    bday=Date.parse(gets.chop)
  while stuname !="" do
    students.push({name: stuname, cohort: cohort_id.intern, hobbies: hobbyy, birthday: bday})
    puts "Now we have #{students.length} #{students.length==1 ? "student" : "students"}"
    stuname=gets.chomp
    if stuname!=""
    cohort_id=gets.chomp
    hobbyy=gets.chomp
    bday=Date.parse(gets.chomp)
    end
  end
  students
end

students=input_students

def print_header
 puts "The students of Villains Academy"
 puts "-------------".center("The students of Villains Academy".length)
end

=begin
def print_names(students,first_l)
 students.each_with_index do |student,i|
   if student[:name][0]==first_l &&student[:name].length<12
     puts "#{i+1}. #{ student[:name]}, (#{student[:cohort]} cohort)"
   end
  end
end
=end
def cohort_list(students)
  ary=[]
  students.each{|a| ary<<students[a][:cohort] }
  ary
end

#with a while loop - until would be until ==students.length, otherwise same.
def print_names(students,cohortname)
  i=0;
  while i<students.length do
   if students[i][:cohort]==cohortname.intern &&students[i][:name].length<12
     #print out student name, cohort,hobbies and birthday; then center it
     puts "#{i+1}. #{ students[i][:name]}, (#{students[i][:cohort]} cohort, likes #{students[i][:hobbies]}, born #{students[i][:birthday]})".center(80,'*')
   end
   i+=1
  end
end

def print_footer(students)
  print "Overall, we have #{students.length} great #{students.length==1 ? "student" : "students"}"
end
print_header

puts "What cohort are they in?"
print_names(students,gets.chomp)
print_footer(students)
