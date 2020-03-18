import 'dart:io';
import 'dart:math';
main(){
  String name;
  List flutterguys=[];
  List pythonguys=[];
  List fluttergroup=[];
  List pythongroup=[];
  List mentors=[];
  List flutterMentors=[];
  List pythonMentors=[];
  var mapping=new Map();
  var mentorMapping=new Map();
  var studentMapping=new Map();
  var i;
  

  print('enter name');
  name= stdin.readLineSync();
  var person1=LearningPlatform(name);
  print(person1.addStacks(mapping));
  person1.setMentorOrLearner(mentorMapping,studentMapping);
  
  print('enter name');
  name= stdin.readLineSync();
  var person2=LearningPlatform(name);
  print(person2.addStacks(mapping));
  person2.setMentorOrLearner(mentorMapping,studentMapping);
  
  print('enter name');
  name= stdin.readLineSync();
  var person3=LearningPlatform(name);
  print(person3.addStacks(mapping));
  person3.setMentorOrLearner(mentorMapping,studentMapping);

  print('enter name');
  name= stdin.readLineSync();
  var person4=LearningPlatform(name);
  print(person4.addStacks(mapping));
  person4.setMentorOrLearner(mentorMapping,studentMapping);

  print('\n');
  print('the mapping of mentors and learners is');
  print(mapping);
  print('list of mentors with their time');
  print(mentorMapping);
  print('the student mapping with the skills they want to learn');
  print(studentMapping);
  for(var x in studentMapping.keys){
    if(studentMapping[x]=='flutter'){
      flutterguys.add(x);
    }
    else{
      pythonguys.add(x);
    }
  }
  for(var d  in mapping.keys){
    if(mapping[d]=='flutter'){
      fluttergroup.add(d);
    }
    else{
      pythongroup.add(d);
    }
    
  }
  for(var f in mentorMapping.keys){
    mentors.add(f);
  }
  for(i in mentors){
    if(fluttergroup.contains(i)) {
      flutterMentors.add(i);
    }
    else{
      pythonMentors.add(i);
      }
   }
  print('\n');
  print('the flutter students are');
  print(flutterguys);
  print('\n');
  print('the flutter mentors are');
  print(flutterMentors);
  print('\n');
  print('the python students are');
  print(pythonguys);
  print('\n');
  print('the python mentors are');
  print(pythonMentors);

var obj=new LearningPlatform.mentorAllocation(flutterMentors,pythonMentors,flutterguys,pythonguys) ;
obj.getMentor();

}
class LearningPlatform{
  String name;
  String mentorOrLearner;
  String skills;
  List skillList=[];
  List mentorlist=[];
  List studentlist=[];
  String time;
  List flutterMentors;
  List pythonMentors;
  List pythonguys;
  List flutterguys;
  // var a=new Map();
LearningPlatform(String name)  {
  this.name=name;
  }
LearningPlatform.mentorAllocation(List flutterMentors,List pythonMentors,List flutterguys,List pythonguys){
  this.flutterMentors=flutterMentors;
  this.pythonMentors=pythonMentors;
  this.flutterguys=flutterguys;
  this.pythonguys=pythonMentors;
} //named constructor
addStacks(Map mapping){
  //adding area of expertise 
  print('enter skills flutter/python');
  skills=stdin.readLineSync();
  skillList.add(skills);
  
  
  mapping.addAll({name:skills});
  
  
  
  
    return skillList;
}
setMentorOrLearner(Map mentorMapping,Map studentMapping){
  //setting mentor or learner
  print('are you a mentor or learner');
  String mentorOrLearner= stdin.readLineSync();
  if(mentorOrLearner=='mentor'){
      
      print('enter available time');
      String time= stdin.readLineSync();
      mentorMapping.addAll({name:this.setAvailableTime(time)});
      
      }
  else{
      studentMapping.addAll({name:skills});
      
    }
}
setAvailableTime(time){
  //setting available time
    this.time=time;
    return time;
    
  }


getMentor(){
    //allocating mentors to flutter students as well as python students
    var flutterMentorAllocation=new Map();
    var pythonMentorAllocation=new Map();
    Random random=new Random();
    for(var i in flutterguys){
      int randomNumber=random.nextInt(flutterMentors.length)+0;
      flutterMentorAllocation.addAll({i:flutterMentors[randomNumber]});
    }
    for(var i in pythonguys){
      int randomNumber=random.nextInt(pythonMentors.length)+0;
      pythonMentorAllocation.addAll({i:pythonMentors[randomNumber]});
    }
    print('\n');
    print('The flutter mentor allocation for the flutter students is of the form Flutterstudent:Fluttermentor is:');
    print(flutterMentorAllocation);
    print('\n');
    print('The python mentor allocation for the python students is of the form  PythonStudent:PythonMentor is:');
    print(pythonMentorAllocation);
  }

}