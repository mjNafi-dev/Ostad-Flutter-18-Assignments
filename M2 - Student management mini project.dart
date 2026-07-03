/* 
1. Create a list of all student names
2. Create a set if enrolled courses 
3. Create a map where:
    key = student name
    value = student age
4. Use a collection if to add a student named "Rahim" only if isNewStudent = true.
5. Use the Spread Operator (...) to combine two student lists.
6. Print: all student names; courses; ages
 */
void main() {
  //Courses
  Set<String> course = {
    "English Language",
    "English Literature",
    "Math",
    "Physics",
    "Chemistry",
    "Art",
  };
  //Map of student and their ages
  Map<String, int> studentAges = {
    "Inam": 19,
    "Sohit": 18,
    "Rehayanth": 18,
    "Avinam": 21,
    "Muskan": 17,
  };
  //List of students
  List <String> students = studentAges.keys.toList();

  //name of the stydent to be added
  String addStudent = 'Nafi';
  int addAge=22;

  //checking if it's a duplicate
  bool newStudent=true;
  for (int i=0; i<students.length; i++){
    if(students[i]==addStudent){
      newStudent=false;
      break;
    }
  }

  //new list of added students
  List<String> newStudents = [if (newStudent) addStudent];
  if (newStudent){
    studentAges[addStudent] = addAge;
  }

  //spread operator
  List<String> allStudents = [...newStudents,...students];

  //printing ALL
  print('Students:\n$allStudents\n');
  print('Courses:\n$course\n');
  print('Student ages:');
  studentAges.forEach((name,age){print('$name -> $age');});
}
//askjdjkasbd