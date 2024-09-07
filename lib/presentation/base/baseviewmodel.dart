

abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs{
    //shared variables and functions in order to be accessible through any model
  //it needs two important values which are : base view model inputs and base view model outputs

}


abstract mixin class BaseViewModelInputs{
  void start(); //will be called while initiallization of view model
  void dispose(); //in order to throw away the viewmodel and die
}

abstract mixin class BaseViewModelOutputs{ //mixin is a class that will going to be extended in flutter many times
  //there is a explanation down for the mixin :) :)
}

//A litter explanation about mixin

//abstract class Animal{
// void breathe(){
//   print("Breathing");
// }
//
// mixin Bark{
//   void bark()=> print("barking");
// }
// mixin Crawl{
//   void bark()=> print("Crawling");
// }
// class Dog extends Animal with Bark{}
// class Snake extends Animal with Crawl{}
//
// void  main(){
//   var dog=Dog();
//   dog.breathe();
//   dog.bark();

//so at the result we are now can use the methods for dog that are in animal and bark
// }


