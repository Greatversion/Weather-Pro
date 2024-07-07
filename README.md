Sure! Here’s a detailed README file for your weather app project. This README covers the project description, features, setup instructions, usage, and additional notes.

---

# Weather Plus - Flutter Weather Forecast App

Weather Plus is a powerful and elegant weather forecast application built using Flutter. It allows users to search for weather information by city and displays detailed weather data including current temperature, weather conditions, humidity, and wind speed. The app uses the OpenWeatherMap API to fetch real-time weather data.

## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
-
## Features

1. **City Search**: Users can search for weather information by entering a city name.
2. **Current Weather Display**: Displays the current temperature, weather condition, humidity, and wind speed for the selected city.
3. **Weather Icon**: Shows an icon representing the current weather condition.
4. **Forecast**: Displays weather forecast for upcoming days.
5. **Recent Searches**: Keeps track of the last five searched cities and displays them below the search bar for quick access.
6. **Error Handling**: Properly handles API request errors and displays user-friendly messages.
7. **Responsive Design**: Adapts to different screen sizes, providing a seamless experience on both mobile and tablet devices.
8. **Refresh Button**: Allows users to refresh the weather data to get the latest updates.
9. **Persistent Data**: Saves the last searched cities using `SharedPreferences`, maintaining the recent searches even after the app is closed.
10. **Glass Effect UI**: Uses a glassmorphic effect for various UI components, enhancing the visual appeal.

## Screenshots

Add screenshots of your app in different states here to give users a visual overview.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (Ensure you have the latest stable version)
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/) with Flutter and Dart plugins installed.

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/weatherapp.git
   cd weatherapp
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Add API Key:**
   - Sign up for an API key from [OpenWeatherMap](https://home.openweathermap.org/users/sign_up).
   - Create a file named `.env` in the root of your project.
   - Add your API key to this file:

     ```plaintext
     WEATHER_API_KEY=your_openweathermap_api_key
     ```

4. **Run the app:**

   ```bash
   flutter run
   ```



