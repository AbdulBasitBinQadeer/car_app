import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/standalone.dart' as tz;

import 'Widgets/const.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;
  Timer? _timer;
  String? _selectedCountry;
  DateTime? _localTime;
  List<String> _countries = ['Pakistan', 'USA', 'UK', 'India', 'Australia',]; // Add more countries here
  Map<String, String> _countryTimeZones = {
    'Pakistan': 'Asia/Karachi',
    'USA': 'America/New_York',
    'UK': 'Europe/London',
    'India': 'Asia/Kolkata',
    'Australia': 'Australia/Sydney'
  };

  @override
  void initState() {
    super.initState();

    // Initialize timezone data before using it
    tz.initializeTimeZones();

    _selectedCountry = _countries[0]; // Default to the first country
    _fetchWeather();
    _timer = Timer.periodic(Duration(minutes: 1), (Timer timer) {
      _updateTime();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _fetchWeather() async {
    try {
      Weather? weather = await _wf.currentWeatherByCityName(_selectedCountry!);
      setState(() {
        _weather = weather;
      });
      _updateTime(); // Also update the time after fetching weather data
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  Future<void> _updateTime() async {
    try {
      if (_countryTimeZones.containsKey(_selectedCountry)) {
        String timeZone = _countryTimeZones[_selectedCountry!]!;
        final location = tz.getLocation(timeZone); // Get the timezone location
        setState(() {
          _localTime = tz.TZDateTime.now(location); // Get the current time in the selected timezone
        });
      }
    } catch (e) {
      print('Error updating time: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Color(0xFFFFD04E))),
        backgroundColor: Colors.black,
        title: _locationHeader(),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              _countryDropdown(),
            ],
          ),
        ),

        SizedBox(height: 60),
        _dateTimeInfo(),
        if (_weather != null) ...[
          SizedBox(height: 20),
          _weatherIcon(),
          SizedBox(height: 20),
          _currentTemp(),
          SizedBox(height: 20),
          _extraInfo(),
        ] else
          CircularProgressIndicator(color: Colors.white),
      ],
    );
  }

  Widget _countryDropdown() {
    return DropdownButton<String>(
      value: _selectedCountry,
      dropdownColor: Colors.black,
      icon: Icon(Icons.arrow_downward, color: Colors.white),
      underline: Container(height: 2, color: Colors.white),
      items: _countries.map<DropdownMenuItem<String>>((String country) {
        return DropdownMenuItem<String>(
          value: country,
          child: Text(
            country,
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedCountry = newValue!;
        });
        _fetchWeather(); // Fetch weather data when country is changed
        _updateTime();   // Update the time as well
      },
    );
  }

  Widget _locationHeader() {
    return Text(
      _selectedCountry ?? "",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFD04E),
      ),
    );
  }

  Widget _dateTimeInfo() {
    return Column(
      children: [
        Text(
          _localTime != null
              ? DateFormat("h:mm a").format(_localTime!)
              : "Loading time...",
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 30),
        Text(
          _localTime != null
              ? DateFormat("EEEE, d.M.yyyy").format(_localTime!)
              : "Loading date...",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png"))),
        ),
        Text(
          _weather?.weatherDescription ?? " ",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }

  Widget _currentTemp() {
    return Text(
      "${_weather?.temperature?.celsius?.toStringAsFixed(0)}°C ",
      style: TextStyle(
        fontSize: 90,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFD04E),
      ),
    );
  }

  Widget _extraInfo() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Max: ${_weather?.tempMax?.celsius?.toStringAsFixed(0)}°C",
                style: TextStyle(color: Color(0xFFFFD04E), fontSize: 15),
              ),
              Text(
                "Min: ${_weather?.tempMin?.celsius?.toStringAsFixed(0)}°C",
                style: TextStyle(color: Color(0xFFFFD04E), fontSize: 15),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Wind: ${_weather?.windSpeed?.toStringAsFixed(0)} m/s",
                style: TextStyle(color: Color(0xFFFFD04E), fontSize: 15),
              ),
              Text(
                "Humidity: ${_weather?.humidity?.toStringAsFixed(0)}%",
                style: TextStyle(color: Color(0xFFFFD04E), fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
