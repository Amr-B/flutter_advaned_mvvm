// > onboarding models
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.image, this.title, this.subTitle);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
