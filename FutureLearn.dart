import 'dart:io';

//الفيوجر بدون ويت الانتظار يعني انك اخذت وصل وسلمته لاصدقائك من دون اخذ المنتج كما في مثال رقم 2 .. اما لو اظفنا الويت فمعناها هاك هذا الوصل مال قهوة وروح كمل شغلك وارجع من تكمل نناديك برقم الوصل علمود تجي تلكي الطلب كامل وتستلمه كما في مثال رقم 3

/*
// كيف نصلح مشكلة ان القيمة للتاسك 2 في التاسك 3 هي نيل كيف نصلحها
مثال رقم 3
void main() {
  performTasks();
}

Future<void> performTasks() async {
  task1();
  String task2result = await task2();
  task3(task2result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration sleep = Duration(seconds: 4);
  String result;
  await Future.delayed(sleep, () {
    result = result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String Task2) {
  String result = 'task 3 data';
  print('Task 3 complete $Task2');
}
*/
/////////
/*
// بعض الاحان تحتاج مهمه الى نتائج مهمه اخرى قد تتاخر في التحميل
// التاسك 2 ستكون نتيجتها نيل في التاسك 3 لان التاسك 2 تحتاج وقت للتنفذ لذلك سيتم تنفيذ التاسك 3 وال3 تعتمد على ال2 لذلك نصف بياانات ال3 ستكون نيل

مثال رقم 2
void main() {
  performTasks();
}

void performTasks() {
  task1();
  String task2result = task2();
  task3(task2result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

String task2() {
  Duration sleep = Duration(seconds: 4);
  String result;
  Future.delayed(sleep, () {
    result = result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String Task2) {
  String result = 'task 3 data';
  print('Task 3 complete $Task2');
}

 */
/////////
/*
void main() {
  performTasks();
}

void performTasks() {
  task1();
  task2();
  task3();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

void task2() {
  Duration sleep = Duration(seconds: 4);
  Future.delayed(sleep, () {
    String result = 'task 2 data';
    print('Task 2 complete');
  });
}

void task3() {
  String result = 'task 3 data';
  print('Task 3 complete');
}


 */
