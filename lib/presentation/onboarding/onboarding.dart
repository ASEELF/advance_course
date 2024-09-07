import 'package:advanced_course/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:advanced_course/presentation/resources/assets_manager.dart';
import 'package:advanced_course/presentation/resources/color_manager.dart';
import 'package:advanced_course/presentation/resources/routes_manager.dart';
import 'package:advanced_course/presentation/resources/strings_manager.dart';
import 'package:advanced_course/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController = PageController(initialPage: 0);

OnBoardingViewModel _viewModel =OnBoardingViewModel();
_bind(){
  _viewModel.start();
}

@override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SlideViewObject>(
        stream: _viewModel.outputSliderViewObject
        , builder: (context,snapshot){
          return _getContentWidget(snapshot.data);

    }


    );
  }

  Widget _getContentWidget(SlideViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: colorManager.white,
        appBar: AppBar(
          backgroundColor: colorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: colorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numOfSlides,
            onPageChanged: (index) {
             _viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(sliderViewObject.sliderObject);
            }),
        bottomSheet: Container(
          color: colorManager.white,
          height: AppSize.s100,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.loginRoute);
                    },
                    child: Text(
                      AppStrings.skip,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleSmall,
                      textAlign: TextAlign.end,
                    ),
                  )),
              // add layout for indicator and arrows
              _getBottomSheetWidget(sliderViewObject)
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SlideViewObject sliderViewObject) {
    return Container(
      color: colorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightarrowIc),
              ),
              onTap: () {
                // go to next slide
                _pageController.animateToPage(_viewModel.goPrevious(),
                    duration: const Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          ),

          // circles indicator
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                  padding:const  EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i,sliderViewObject.currentIndex),
                )
            ],
          ),

          // right arrow
          Padding(
            padding:const  EdgeInsets.all(AppPadding.p14),
            child:
            GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(_viewModel.goNext(),
                    duration: const Duration(milliseconds: DurationConstant.d300),
                    curve: Curves.bounceInOut);
              },
            ),
          )
        ],
      ),
    );
  }


  Widget _getProperCircle(int index, int _currentIndex) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc); // selected slider
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc); // unselected slider
    }
  }

  @override
  void dispose(){
   _viewModel.dispose();
    super.dispose();
  }

}


class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;

  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image)
        // image widget
      ],
    );
  }
}
