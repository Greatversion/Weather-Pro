class NetworkModel {
    NetworkModel({
        required this.location,
        required this.current,
        required this.forecast,
        required this.alerts,
    });

    final Location? location;
    final Current? current;
    final Forecast? forecast;
    final Alerts? alerts;

    factory NetworkModel.fromJson(Map<String, dynamic> json){ 
        return NetworkModel(
            location: json["location"] == null ? null : Location.fromJson(json["location"]),
            current: json["current"] == null ? null : Current.fromJson(json["current"]),
            forecast: json["forecast"] == null ? null : Forecast.fromJson(json["forecast"]),
            alerts: json["alerts"] == null ? null : Alerts.fromJson(json["alerts"]),
        );
    }

}

class Alerts {
    Alerts({
        required this.alert,
    });

    final List<dynamic> alert;

    factory Alerts.fromJson(Map<String, dynamic> json){ 
        return Alerts(
            alert: json["alert"] == null ? [] : List<dynamic>.from(json["alert"]!.map((x) => x)),
        );
    }

}

class Current {
    Current({
        required this.lastUpdated,
        required this.tempC,
        required this.tempF,
        required this.isDay,
        required this.condition,
        required this.windKph,
        required this.windDegree,
        required this.windDir,
        required this.pressureMb,
        required this.precipMm,
        required this.humidity,
        required this.cloud,
        required this.feelslikeC,
        required this.feelslikeF,
    });

    final String? lastUpdated;
    final num? tempC;
    final num? tempF;
    final num? isDay;
    final Condition? condition;
    final num? windKph;
    final num? windDegree;
    final String? windDir;
    final num? pressureMb;
    final num? precipMm;
    final int? humidity;
    final num? cloud;
    final num? feelslikeC;
    final num? feelslikeF;

    factory Current.fromJson(Map<String, dynamic> json){ 
        return Current(
            lastUpdated: json["last_updated"],
            tempC: json["temp_c"],
            tempF: json["temp_f"],
            isDay: json["is_day"],
            condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
            windKph: json["wind_kph"],
            windDegree: json["wind_degree"],
            windDir: json["wind_dir"],
            pressureMb: json["pressure_mb"],
            precipMm: json["precip_mm"],
            humidity: json["humidity"],
            cloud: json["cloud"],
            feelslikeC: json["feelslike_c"],
            feelslikeF: json["feelslike_f"],
        );
    }

}

class Condition {
    Condition({
        required this.text,
        required this.icon,
    });

    final String? text;
    final String? icon;

    factory Condition.fromJson(Map<String, dynamic> json){ 
        return Condition(
            text: json["text"],
            icon: json["icon"],
        );
    }

}

class Forecast {
    Forecast({
        required this.forecastday,
    });

    final List<Forecastday> forecastday;

    factory Forecast.fromJson(Map<String, dynamic> json){ 
        return Forecast(
            forecastday: json["forecastday"] == null ? [] : List<Forecastday>.from(json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
        );
    }

}

class Forecastday {
    Forecastday({
        required this.date,
        required this.day,
        required this.astro,
        required this.hour,
    });

    final DateTime? date;
    final Day? day;
    final Astro? astro;
    final List<Hour> hour;

    factory Forecastday.fromJson(Map<String, dynamic> json){ 
        return Forecastday(
            date: DateTime.tryParse(json["date"] ?? ""),
            day: json["day"] == null ? null : Day.fromJson(json["day"]),
            astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
            hour: json["hour"] == null ? [] : List<Hour>.from(json["hour"]!.map((x) => Hour.fromJson(x))),
        );
    }

}

class Astro {
    Astro({
        required this.sunrise,
        required this.sunset,
    });

    final String? sunrise;
    final String? sunset;

    factory Astro.fromJson(Map<String, dynamic> json){ 
        return Astro(
            sunrise: json["sunrise"],
            sunset: json["sunset"],
        );
    }

}

class Day {
    Day({
        required this.maxtempC,
        required this.mintempC,
        required this.avgtempC,
        required this.maxwindKph,
        required this.totalprecipMm,
        required this.avghumidity,
        required this.dailyChanceOfRain,
        required this.condition,
    });

    final num? maxtempC;
    final num? mintempC;
    final num? avgtempC;
    final num? maxwindKph;
    final num? totalprecipMm;
    final int? avghumidity;
    final num? dailyChanceOfRain;
    final Condition? condition;

    factory Day.fromJson(Map<String, dynamic> json){ 
        return Day(
            maxtempC: json["maxtemp_c"],
            mintempC: json["mintemp_c"],
            avgtempC: json["avgtemp_c"],
            maxwindKph: json["maxwind_kph"],
            totalprecipMm: json["totalprecip_mm"],
            avghumidity: json["avghumidity"],
            dailyChanceOfRain: json["daily_chance_of_rain"],
            condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
        );
    }

}

class Hour {
    Hour({
        required this.time,
        required this.tempC,
        required this.isDay,
        required this.condition,
        required this.windKph,
        required this.windDir,
        required this.pressureMb,
        required this.precipMm,
        required this.humidity,
        required this.cloud,
        required this.feelslikeC,
        required this.willItRain,
    });

    final String? time;
    final num? tempC;
    final num? isDay;
    final Condition? condition;
    final num? windKph;
    final String? windDir;
    final num? pressureMb;
    final num? precipMm;
    final int? humidity;
    final num? cloud;
    final num? feelslikeC;
    final num? willItRain;

    factory Hour.fromJson(Map<String, dynamic> json){ 
        return Hour(
            time: json["time"],
            tempC: json["temp_c"],
            isDay: json["is_day"],
            condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
            windKph: json["wind_kph"],
            windDir: json["wind_dir"],
            pressureMb: json["pressure_mb"],
            precipMm: json["precip_mm"],
            humidity: json["humidity"],
            cloud: json["cloud"],
            feelslikeC: json["feelslike_c"],
            willItRain: json["will_it_rain"],
        );
    }

}

class Location {
    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime,
    });

    final String? name;
    final String? region;
    final String? country;
    final num? lat;
    final num? lon;
    final String? tzId;
    final num? localtimeEpoch;
    final String? localtime;

    factory Location.fromJson(Map<String, dynamic> json){ 
        return Location(
            name: json["name"],
            region: json["region"],
            country: json["country"],
            lat: json["lat"],
            lon: json["lon"],
            tzId: json["tz_id"],
            localtimeEpoch: json["localtime_epoch"],
            localtime: json["localtime"],
        );
    }

}
