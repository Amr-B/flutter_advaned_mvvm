// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:advanced_flutter_tutorial/domain/models.dart';
import 'package:advanced_flutter_tutorial/domain/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_tutorial/domain/presentation/resources/color_manager.dart';
import 'package:advanced_flutter_tutorial/domain/presentation/resources/constant_manager.dart';
import 'package:advanced_flutter_tutorial/domain/presentation/resources/strings_manager.dart';
import 'package:advanced_flutter_tutorial/domain/presentation/resources/values_manager.dart';
import 'package:advanced_flutter_tutorial/domain/presentation/routes/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:advanced_flutter_tutorial/domain/presentation/routes/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  final OnboardingViewmodel _viewModel = OnboardingViewmodel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return const SizedBox.shrink();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
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
          },
        ),
        bottomSheet: Container(
          height: AppSize.s100,
          color: ColorManager.primary,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: const Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // left arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _viewModel.goPrevious(),
                duration:
                    const Duration(milliseconds: AppConstants.sliderAnimation),
                curve: Curves.bounceInOut,
              );
            },
            child: SizedBox(
              width: AppSize.s20,
              height: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.leftArrowIc),
            ),
          ),
        ),

        // indicators
        Row(
          children: List.generate(
            sliderViewObject.numOfSlides,
            (index) => Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: _getProperCircle(index, sliderViewObject.currentIndex),
            ),
          ),
        ),

        // right arrow
        Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _viewModel.goNext(),
                duration:
                    const Duration(milliseconds: AppConstants.sliderAnimation),
                curve: Curves.bounceInOut,
              );
            },
            child: SizedBox(
              width: AppSize.s20,
              height: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.rightArrowIc),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    return SvgPicture.asset(
      index == currentIndex
          ? ImageAssets.solidCircleIc
          : ImageAssets.hollowCircleIc,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {super.key});

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
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}
