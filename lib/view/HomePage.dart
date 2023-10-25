import 'package:weather/export.dart';
import 'package:weather/services/weather_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _weatherService = WeatherService('804eda314c51f1f00cfae43cdf3f2371');
  Weather? _weather;

  _fetchWeather() async{
    //Get the current city
    String cityName = await _weatherService.getCurrentCity();
    //Get weather for city
    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    catch(e){
      print(e);
    }
  }

  String getWeatherAnimation(String? mainCondition){
    if(mainCondition == null ){
      return 'assets/sunny.json';
    }

    switch(mainCondition.toLowerCase()){
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/sunny.json';
      case 'drizzle':
        return 'assets/winter.json';
      case 'rain':
      case 'shower rain':
        return 'assets/rainy.json';
      case 'thunderstorm':
        return 'assets/thunder_rain.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }

  }

  //init state
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "city...",style: GoogleFonts.lato(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              // color: Colors.orangeAccent
            ),),
            SizedBox(height: 20,),
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition),height: 200, width: MediaQuery.of(context).size.width*1),
            SizedBox(height: 20,),
            Text('${_weather?.temperature.round()} °C',style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                // color: Colors.orangeAccent
            ),),
            SizedBox(height: 20,),
            Text(_weather?.mainCondition ?? "",style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                // color: Colors.orangeAccent
            ),)
          ],
          ),
      ),
      ),
    );
  }
}
