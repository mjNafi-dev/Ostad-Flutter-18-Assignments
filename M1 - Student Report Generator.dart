/*
Requirements

String studentName = "Rahim"; // Can you use Any Name
int marks = 75; // Can Use any marks

-- marks to grade system --
[Use if else]
Marks     Grade
80+       A
70-79     B
60-69     C
Below 60  F

-- grade description --
[switch-case]
Grade     Description
A         Excellent
B         Good job
C         Trt harder next time
F         Failure is the pillar of success

-- Expected output --
Student Report
Name: Rahim
Marks: 75
Grade: B
Good Job

*/

void main(){
  //full name of the student
  String fullName;
  String firstName = 'Mahir';
  String? middleName = 'Jabid';
  String lastName = 'Nafi';
  fullName = '$firstName $middleName $lastName';
  print('Name:\t$fullName');// print full name

  //Marks of the student
  int marks;
  marks = 73;
  String grade;
  print('Marks:\t$marks');
  
  //if-else statement to determine grade
  if(marks>=80){
    grade = 'A';
  }
  else if (marks >=70 && marks <80){ //eitay just smaller than
    grade = 'B';
  }
  else if (marks >=60 && marks <=69){ //eitay smaller than or equal to
    grade = 'C';
  }
  else{
    grade = 'F';
  }

  //switch-caes statement to print grade description
  switch (grade){
    case ('A'):
      print('Grade:\tA\nExcellent');
    case ('B'):
      print('Grade:\tB\nGood job');
    case ('C'):
      print('Grade:\tC\nTry harder next time');
    case ('F'):
      print('Grade:\tF\nFailure is the pillar of success');
  }
}