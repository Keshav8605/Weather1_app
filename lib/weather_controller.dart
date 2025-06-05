import 'package:get/get.dart';

class WeatherController extends GetxController {
  var epochCode = 0.obs;
  var todaysDate = ''.obs;
  var currentDate = ''.obs;
  var currentTime = ''.obs;
  var currentTemp = ''.obs;
  var currentWCName = ''.obs;
  var currentWindSpeed = ''.obs;
  var currentHumidity = ''.obs;
  var currentUvIndex = ''.obs;
  var currentVisibility = ''.obs;
  var sunrise = ''.obs;
  var sunset = ''.obs;
  var currentlocation = ''.obs;
  var weatherday = ''.obs;

  // Observable map to hold complete weather data (keeping original functionality)
  var weatherData = <String, dynamic>{}.obs;

  // Getter for easy access
  Map<String, dynamic> get data => weatherData;

  int get getEpochCode => epochCode.value;
  String get getTodaysDate => todaysDate.value;
  String get getCurrentDate => currentDate.value;
  String get getCurrentTime => currentTime.value;
  String get getCurrentTemp => currentTemp.value;
  String get getCurrentWCName => currentWCName.value;
  String get getCurrentWindSpeed => currentWindSpeed.value;
  String get getCurrentHumidity => currentHumidity.value;
  String get getCurrentUvIndex => currentUvIndex.value;
  String get getCurrentVisibility => currentVisibility.value;
  String get getSunrise => sunrise.value;
  String get getSunset => sunset.value;
  String get getcurrentlocation => currentlocation.value;

  // Individual setter methods
  void setWeatherData(Map<String, dynamic> value) => weatherData.value = value;
  void setEpochCode(int value) => epochCode.value = value;
  void setTodaysDate(String value) => todaysDate.value = value;
  void setCurrentDate(String value) => currentDate.value = value;
  void setCurrentTime(String value) => currentTime.value = value;
  void setCurrentTemp(String value) => currentTemp.value = value;
  void setCurrentWCName(String value) => currentWCName.value = value;
  void setCurrentWindSpeed(String value) => currentWindSpeed.value = value;
  void setCurrentHumidity(String value) => currentHumidity.value = value;
  void setCurrentUvIndex(String value) => currentUvIndex.value = value;
  void setCurrentVisibility(String value) => currentVisibility.value = value;
  void setSunrise(String value) => sunrise.value = value;
  void setSunset(String value) => sunset.value = value;
  void setcurrentlocation(String value) => currentlocation.value = value;

}
