import 'package:flutter/material.dart';
import '/utils/location_helper.dart';
import '/services/weather_service.dart';
import '/widgets/weather_card.dart';
import '/widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = "Loading...";
  num temperature = 0;
  num humidity = 0;
  num windSpeed = 0;
  num cloudCover = 0;
  num pressure = 0;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _fetchWeatherByLocation();
  }

  void _fetchWeatherByLocation() async {
    final position = await getCurrentLocation();
    if (position != null) {
      final weatherData = await fetchWeatherByLocation(position);
      if (weatherData != null) {
        setState(() {
          cityName = weatherData['name'];
          temperature = weatherData['main']['temp'] - 273.15;
          humidity = weatherData['main']['humidity'];
          windSpeed = weatherData['wind']['speed'];
          cloudCover = weatherData['clouds']['all'];
          pressure = weatherData['main']['pressure'];
          isLoaded = true;
        });
      }
    }
  }

  void _fetchWeatherByCity(String city) async {
    final weatherData = await fetchWeatherByCity(city);
    if (weatherData != null) {
      setState(() {
        cityName = weatherData['name'];
        temperature = weatherData['main']['temp'] - 273.15;
        humidity = weatherData['main']['humidity'];
        windSpeed = weatherData['wind']['speed'];
        cloudCover = weatherData['clouds']['all'];
        pressure = weatherData['main']['pressure'];
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E88E5),
              Color(0xFF64B5F6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: _buildWeatherContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weather App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: Icon(Icons.refresh, color: Colors.white),
                onPressed: _fetchWeatherByLocation,
              ),
            ],
          ),
          SizedBox(height: 16),
          SearchField(onSubmitted: _fetchWeatherByCity),
        ],
      ),
    );
  }

  Widget _buildWeatherContent() {
    if (!isLoaded) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.white),
            SizedBox(height: 16),
            Text(
              'Getting weather information...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildMainWeatherInfo(),
            SizedBox(height: 24),
            _buildDetailedWeatherInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainWeatherInfo() {
    return Column(
      children: [
        Text(
          cityName,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              temperature > 20 ? Icons.wb_sunny : Icons.cloud,
              size: 50,
              color: Colors.orange,
            ),
            SizedBox(width: 16),
            Text(
              '${temperature.toStringAsFixed(1)}°C',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailedWeatherInfo() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildWeatherDetailCard(
          'Humidity',
          '$humidity%',
          Icons.water_drop,
          Colors.blue,
        ),
        _buildWeatherDetailCard(
          'Wind Speed',
          '$windSpeed m/s',
          Icons.air,
          Colors.green,
        ),
        _buildWeatherDetailCard(
          'Cloud Cover',
          '$cloudCover%',
          Icons.cloud_queue,
          Colors.grey,
        ),
        _buildWeatherDetailCard(
          'Pressure',
          '$pressure hPa',
          Icons.speed,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildWeatherDetailCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}