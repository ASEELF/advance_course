import 'dart:async';
import 'package:advanced_course/presentation/base/baseviewmodel.dart';
import '../../domain/model.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs{
   //now we will study a new concept which is stream controller
  final StreamController _streamController= StreamController<SlideViewObject>();
  late final List<SliderObject> _list ;

  int _currentIndex=0;

  @override
  void dispose(){
     _streamController.close();
  }

  void start(){
_list= _getSliderData();
// now gonna send this slider data to our view
  _postDataToView(); }

  @override
  int goNext() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _list.length) {
      _currentIndex = 0; //loop going to first item inside the slider
    }
 return _currentIndex;
  }


  @override
  int goPrevious() {
    int previousIndex = _currentIndex--;
    if (previousIndex == -1) {
      _currentIndex =
          _list.length - 1;
    }
    return _currentIndex;
  }


  @override
  void onPageChanged(int index) {
    _currentIndex= index;
    _postDataToView();

  }


  @override
  Sink get inputSliderViewObject => _streamController.sink;


  //output
  @override
  Stream<SlideViewObject> get outputSliderViewObject => _streamController.stream.map((slideViewObject)=> slideViewObject);


//privates
  List<SliderObject> _getSliderData() => [
    SliderObject(AppStrings.onBoardingSubTitle1,
        AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
    SliderObject(AppStrings.onBoardingSubTitle2,
        AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
    SliderObject(AppStrings.onBoardingSubTitle3,
        AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
    SliderObject(AppStrings.onBoardingSubTitle4,
        AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4)
  ];



  _postDataToView(){
    inputSliderViewObject.add(SlideViewObject(_list[_currentIndex],_list.length,_currentIndex, stream: null));

  }

}


//inputs mean the orders that our view model will recieve from our view
abstract mixin class OnBoardingViewModelInputs{

  void goNext(); //when user clicks on right arrow or swipe left

void goPrevious(); //when the user clicks on left arrow or swape right
void onPageChanged(int index);

Sink get inputSliderViewObject; //to add data to the stream(inputs)

}
//outputs mean the data or results that will be sent from our view model to our view
abstract mixin class OnBoardingViewModelOutputs{
Stream<SlideViewObject> get outputSliderViewObject;

}

class SlideViewObject{
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SlideViewObject(this.sliderObject,this.numOfSlides,this.currentIndex, {required stream});

}