import 'package:flutter/material.dart';
import 'app/app.dart';

class test extends StatelessWidget {
  const test({super.key});
  void update(int n){
    MyApp.instance.appState=n;
  }

  void get(){
    print(MyApp.instance.appState);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


void main() {
  var t1=const test();

  print('from main');

t1.get();
t1.update(10);

}