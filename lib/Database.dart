import 'dart:convert';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBase extends ChangeNotifier {
  String initial_city = 'Select City';
  bool isLoggedIn = false;

  Future<bool> checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = await prefs.getString('id');
    if (id != '' && id != '0') {
      isLoggedIn = true;
    }
    notifyListeners();
    return isLoggedIn;
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    isLoggedIn = false;
    notifyListeners();
  }

  getPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      if (await Permission.location.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
      }

// You can request multiple permissions at once.
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
      print(statuses[Permission.location]);
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    } else {
      print('is not dnied');
    }
  }

  double x = 0.0;
  double y = 0.0;

  Map<String, dynamic> _mapLogin = {};
  bool _errorLogin = false;
  String _errorMessageLogin = '';

  Map<String, dynamic> get mapLogin => _mapLogin;

  bool get errorLogin => _errorLogin;

  String get errorMessageLogin => _errorMessageLogin;

  Future<void> userLogin(String phone, String password) async {
    String completeurl =
        'https://bingo-agency.com/mrworker/API/loginapi.php?phone=' +
            phone +
            '&password=' +
            password;
    print(completeurl);
    final response = await http.get(
      Uri.parse('https://bingo-agency.com/mrworker/API/loginapi.php?phone=' +
          phone +
          '&password=' +
          password),
    );
    if (response.statusCode == 200) {
      try {
        _mapLogin = jsonDecode(response.body);
        _errorLogin = false;
        if (_mapLogin.isNotEmpty && _mapLogin['message'] == "True") {
          print('yes its true from db');
          print(_mapLogin['user'][0]['id'].toString());
          id = _mapLogin['user'][0]['id'].toString();
          name = _mapLogin['user'][0]['name'].toString();
          phone = _mapLogin['user'][0]['phone'].toString();

          addAuth(id, name, email, password, phone, image);
        }
      } catch (e) {
        _errorLogin = true;
        _errorMessageLogin = e.toString();
        _mapLogin = {};
      }
    } else {
      _errorLogin = true;
      _errorMessageLogin = 'Error : It could be your Internet connection.';
      _mapLogin = {};
    }
    notifyListeners();
  }

  Map<String, dynamic> _mapRegister = {};
  bool _errorRegister = false;
  String _errorMessageRegister = '';

  Map<String, dynamic> get mapRegister => _mapRegister;

  bool get errorRegister => _errorRegister;

  String get errorMessageRegister => _errorMessageRegister;

  Future<void> userRegister(String name, String email, String password,
      String phone, String image) async {
    String completeurl =
        'https://bingo-agency.com/mrworker/API/registrationapi.php?name=' +
            name +
            '&email=' +
            email +
            '&password=' +
            password +
            '&phone=' +
            phone +
            '&image=' +
            image;
    print(completeurl);
    final response;

    // var response = await http.get(
    //   Uri.parse(completeurl),
    // );
    if (Profilepicture != null) {
      String base64Image = base64Encode(Profilepicture!.readAsBytesSync());
      String fileName = Profilepicture!.path.split("/").last;
      print(Profilepicture.toString() + 'picture printing');

      response = await http.post(Uri.parse(completeurl), body: {
        "image": base64Image,
        "name": fileName,
      });
      if (response.statusCode == 200) {
        print(response.body.toString() + "  printing mapregister");

        try {
          _mapRegister = jsonDecode(response.body);
          print(_mapRegister.toString());
          _errorRegister = false;
          if (_mapRegister.isNotEmpty && _mapRegister['message'] == "True") {
            print(
                'yes its true from db and following is printing user object.');
            id = _mapRegister['user']['id'];
            name = _mapRegister['user']['name'].toString();
            email = _mapRegister['user']['email'].toString();
            phone = _mapRegister['user']['phone'].toString();
            image = _mapRegister['user']['image'].toString();
            print(_mapRegister.toString());
            addAuth(id, name, email, password, phone, image);
          }
        } catch (e) {
          _errorRegister = true;
          _errorMessageRegister = e.toString();
          _mapRegister = {};
        }
      } else {
        _errorRegister = true;
        _errorMessageRegister = 'Error : It could be your Internet connection.';
        _mapRegister = {};
      }
    }

    notifyListeners();
  }

  Map<String, dynamic> mapUserRegister = {};
  Map<String, dynamic> get _mapUserRegister => mapUserRegister;

  Future<void> uploadImage(
    String name,
    String email,
    String password,
    String phone,
    String Bio,
    String speciality,
    String fb_link,
    String whatsapp,
    String city,
  ) async {
    String URL =
        'https://bingo-agency.com/mrworker/API/registrationapi.php?name=' +
            name +
            '&email=' +
            email +
            '&password=' +
            password +
            '&phone=' +
            phone +
            '&about=' +
            Bio +
            '&speciality=' +
            speciality +
            '&city=' +
            city +
            '&facebook=' +
            fb_link +
            '&whatsapp=' +
            whatsapp;
    // String URL = 'https://bingo-agency.com/mrworker/API/registrationapi.php?nameKhurshid%20khan&email=deshdrama@gmail.com&password=pakistan&phone=03126550536';
    print(URL);
    final response;

    if (Profilepicture == null) {
      String base64Image = 'false';

      String fileName = 'false';
      response = await http
          .post(Uri.parse(URL), body: {"image": base64Image, "name": fileName});
      print(response.toString() + 'printing avatar');
    } else {
      String base64Image = base64Encode(Profilepicture!.readAsBytesSync());
      String fileName = Profilepicture!.path.split("/").last;

      response = await http
          .post(Uri.parse(URL), body: {"image": base64Image, "name": fileName});
      print('something is picked');
      print(Profilepicture.toString());
    }

    if (response.statusCode == 200) {
      mapUserRegister = response.body;
      print('prinitng From Map' + mapUserRegister.toString());
      print('its 200');
      print(response.body.toString());

      id = _mapRegister['user']['id'];
      name = _mapRegister['user']['name'].toString();
      email = _mapRegister['user']['email'].toString();
      phone = _mapRegister['user']['phone'].toString();
      image = _mapRegister['user']['image'].toString();
      print(_mapRegister.toString());
      addAuth(id, name, email, password, phone, image);
      print(id.toString() + 'printing id');

      var abPost = jsonDecode(response.body);
      print(abPost.toString() + 'ab post');
      notifyListeners();
    }
  }

  //
  // Future<void> uploadImage() async {
  //   //show your own loading or progressing code here
  //
  //   String uploadurl = "http://192.168.64.2/first/addpost.php";
  //   //dont use http://localhost , because emulator don't get that address
  //   //insted use your local IP address or use live URL
  //   //hit "ipconfig" in windows or "ip a" in linux to get you local IP
  //   // List<int> imageBytes = Profilepicture!.readAsBytesSync();
  //   // String baseimage = base64Encode(imageBytes);
  //
  //
  //   var response = await http.post(Uri.parse(uploadurl), body: {
  //     "image": 'baseimage',
  //
  //   });
  //   print(response.body.toString()+'printing responce');
  //   try{
  //
  //    print(uploadurl.toString());
  //     //convert file image to Base64 encoding
  //
  //
  //     if(response.statusCode == 200){
  //       print('its 200');
  //       var jsondata = json.decode(response.body);
  //
  //       //decode json data
  //       if(jsondata["error"]){ //check error sent from server
  //         print(jsondata["msg"]);
  //         //if error return from server, show message from server
  //       }else{
  //         print("Upload successful");
  //       }
  //     }else{
  //       print("Error during connection to server");
  //       //there is error during connecting to server,
  //       //status code might be 404 = url not found
  //     }
  //   }catch(e){
  //     print("Error during converting to Base64");
  //     //there is error during converting file image to base64 encoding.
  //   }
  //   notifyListeners();}
  //
  var id;
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  String image = '';
  void _getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? '';
    email = prefs.getString('email') ?? '';
    password = prefs.getString('password') ?? '';
    id = prefs.getString('id') ?? '';

    phone = prefs.getString('phone') ?? '';
    image = prefs.getString('image') ?? '';

    notifyListeners();
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("password");
    prefs.remove("image");
    prefs.remove("phone");
    notifyListeners();
  }

  void addAuth(id, name, email, password, phone, image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);

    prefs.setString('name', name);
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setString('phone', phone);
    prefs.setString('image', image);
    print('auth added ');
    notifyListeners();
  }

  Future<String> getImage() async {
    _getAuth();

    return image;
  }

  Future<String> getName() async {
    _getAuth();
    return name;
  }

  Future<String> getEmail() async {
    _getAuth();
    // notifyListeners();
    return email;
  }

  // var city ;
  Map<String, dynamic> _mapLocation = {};
  bool _errorLocation = false;
  String _errorMessageLocation = '';

  Map<String, dynamic> get mapLocation => _mapLocation;

  bool get errorLocation => _errorLocation;

  String get errorMessageLocation => _errorMessageLocation;

  Future<void> Getlocation(String lat, String lng) async {
    // String completeurl = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' +
    //     lat+',' + lng+'&key=AIzaSyA_LoRMvCG3IiIXtGcEybX6eyd0ijKFZAw&sensor=false';
    // print(completeurl);
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=' +
            lat +
            ',' +
            lng +
            '&key=AIzaSyA_LoRMvCG3IiIXtGcEybX6eyd0ijKFZAw&sensor=false'));

    if (response.statusCode == 200) {
      try {
        _mapLocation = jsonDecode(response.body);

        _errorLocation = false;
        if (_mapLocation.isNotEmpty) {
          print('its working from here');

          var city = _mapLocation['results'][0]['address_components'][2]
                  ['long_name']
              .toString();
          print(_mapLocation['results'][0]['address_components'][2]['long_name']
              .toString());
          getCityLocation();

          // addlocation( lat , lng);

        }
      } catch (e) {
        _errorLogin = true;
        _errorMessageLogin = e.toString();
        _mapLogin = {};
      }
    } else {
      _errorLogin = true;
      _errorMessageLogin = 'Error : It could be your Internet connection.';
      _mapLogin = {};
    }
    notifyListeners();
  }

  late Map<double, dynamic> map;

  void getCurrentlocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    x = await position.latitude;
    y = await position.longitude;
    Getlocation(x.toString(), y.toString());
    print(lastPosition.toString() + 'last position');
    notifyListeners();
  }

  var Cityname = null ?? 'Select City';
  getCityName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Cityname = prefs.getString('Cityname') ?? '';
    notifyListeners();
    return Cityname = prefs.getString('Cityname') ?? '';
  }

  Future<void> getCityLocation() async {
    var gotten_city = await _mapLocation['results'][0]['address_components'][2]
            ['long_name']
        .toString();
    Cityname = gotten_city;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Cityname', Cityname);
    Cityname = prefs.getString('Cityname') ?? '';
    print('printing city name' + Cityname);

    notifyListeners();
  }

  File? Profilepicture;
  Future setProfileImage(img) async {
    Profilepicture = img;

    print('Profile picture Updating');

    notifyListeners();
  }

  Map<String, dynamic> _mapPopular = {};
  bool _errorPopular = false;
  String _errorMessagePopular = '';

  Map<String, dynamic> get mapPopular => _mapPopular;

  bool get errorPopular => _errorPopular;

  String get errorMessagePopular => _errorMessagePopular;

  Future<void> get fetchPopular async {
    final response = await http.get(
      Uri.parse('https://bingo-agency.com/mrworker/API/popular'),
    );
    if (response.statusCode == 200) {
      try {
        _mapPopular = jsonDecode(response.body);
        _errorPopular = false;
      } catch (e) {
        _errorPopular = true;
        _errorMessagePopular = e.toString();
        _mapPopular = {};
      }
    } else {
      _errorPopular = true;
      _errorMessagePopular = 'Error : It could be your Internet connection.';
      _mapPopular = {};
    }
    notifyListeners();
  }

  Map<String, dynamic> _mapCategory = {};
  bool _errorCategory = false;
  String _errorMessageCategory = '';

  Map<String, dynamic> get mapCategory => _mapCategory;

  bool get errorCategory => _errorCategory;

  String get errorMessageCategory => _errorMessageCategory;

  Future<void> get fetchCategory async {
    final response = await http.get(
      Uri.parse('https://bingo-agency.com/mrworker/API/categories.php'),
    );

    if (response.statusCode == 200) {
      try {
        _mapCategory = jsonDecode(response.body);
        _errorCategory = false;
      } catch (e) {
        _errorCategory = true;
        _errorMessageCategory = e.toString();
        _mapCategory = {};
      }
    } else {
      _errorCategory = true;
      _errorMessageCategory = 'Error : It could be your Internet connection.';
      _mapCategory = {};
    }
    notifyListeners();
  }

  Map<String, dynamic> _mapSearch = {};
  bool _errorSearch = false;
  String _errorMessageSearch = '';

  Map<String, dynamic> get mapSearch => _mapSearch;

  bool get errorSearch => _errorSearch;

  String get errorMessageSearch => _errorMessageSearch;

  Future<void> Search(String curl, String city) async {
    final response = await http.get(
      Uri.parse('https://bingo-agency.com/mrworker/API/search?' +
          'city=' +
          city +
          '&type_tag=' +
          curl),
    );
    if (response.statusCode == 200) {
      try {
        _mapSearch = jsonDecode(response.body);
        _errorSearch = false;
      } catch (e) {
        _errorSearch = true;
        _errorMessageSearch = e.toString();
        _mapSearch = {};
      }
    } else {
      _errorSearch = true;
      _errorMessageSearch = 'Error : It could be your Internet connection.';
      _mapSearch = {};
    }

    notifyListeners();
    // return _mapSearch;
  }

  Map<String, dynamic> _mapRecommendation = {};
  bool _errorRecommendation = false;
  String _errorMessageRecommendation = '';

  Map<String, dynamic> get mapRecommendation => _mapRecommendation;

  bool get errorRecommendation => _errorRecommendation;

  String get errorMessageRecommendation => _errorMessageRecommendation;

  Future<void> get fetchRecommendation async {
    final response = await http.get(
      Uri.parse('https://bingo-agency.com/mrworker/API/search.php'),
    );
    if (response.statusCode == 200) {
      try {
        _mapRecommendation = jsonDecode(response.body);
        _errorRecommendation = false;
      } catch (e) {
        _errorRecommendation = true;
        _errorMessageRecommendation = e.toString();
        _mapRecommendation = {};
      }
    } else {
      _errorRecommendation = true;
      _errorMessageRecommendation =
          'Error : It could be your Internet connection.';
      _mapRecommendation = {};
    }
    notifyListeners();
  }

  String selectedvalue = ' Select Category';

  // Future<void> setCategory(value) async {
  //   value = selectedvalue;
  //   notifyListeners();
  // }
  void setCategory(city) async {
    selectedvalue = city.toString();
    notifyListeners();
  }

  String selectedCity = 'Select City';
  void setCity(city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String selectedCity = (prefs.getString('initial_city') ?? 'islamabad');
    selectedCity = city.toString();
    notifyListeners();
  }

  Future<String> SetCityForSearchbar(city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    await prefs.setString('city', city);
    // String stringValue = (prefs.getString('initial_city') ?? 'Islamabad');
    initial_city = city.toString();
    notifyListeners();
    return initial_city;
  }

  Future<String> getCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = await (prefs.getString('city') ?? 'Islamabad');
    initial_city = stringValue;
    notifyListeners();
    return initial_city;
  }

  Map<String, dynamic> _mapSearch1 = {};
  bool _errorSearch1 = false;
  String _errorMessageSearch1 = '';

  Map<String, dynamic> get mapSearch1 => _mapSearch1;

  bool get errorSearch1 => _errorSearch1;

  String get errorMessageSearch1 => _errorMessageSearch1;

  Future<void> Search1(String curl, String city) async {
    final response = await http.get(
      Uri.parse('https://bingo-agency.com/mrworker/API/search?' +
          'city=' +
          city +
          '&type_tag=' +
          curl),
    );
    if (response.statusCode == 200) {
      try {
        _mapSearch1 = jsonDecode(response.body);
        _errorSearch1 = false;
      } catch (e) {
        _errorSearch1 = true;
        _errorMessageSearch1 = e.toString();
        _mapSearch1 = {};
      }
    } else {
      _errorSearch1 = true;
      _errorMessageSearch1 = 'Error : It could be your Internet connection.';
      _mapSearch1 = {};
    }

    notifyListeners();
  }

  Map<String, dynamic> _mapViewmore = {};
  bool _errorViewmore = false;
  String _errorMessageViewmore = '';

  Map<String, dynamic> get mapViewmore => _mapViewmore;

  bool get errorViewmore => _errorViewmore;

  String get errorMessageViewmore => _errorMessageViewmore;

  Future<void> get ViewAll async {
    final response = await http.get(
      Uri.parse('https://bingo-agency.com/mrworker/API/view_more_users.php'),
    );
    if (response.statusCode == 200) {
      try {
        _mapViewmore = jsonDecode(response.body);
        _errorViewmore = false;
      } catch (e) {
        _errorViewmore = true;
        _errorMessageViewmore = e.toString();
        _mapViewmore = {};
      }
    } else {
      _errorViewmore = true;
      _errorMessageViewmore = 'Error : It could be your Internet connection.';
      _mapViewmore = {};
    }
    notifyListeners();
  }

  void initialValues() {
    _mapRegister = {};
    _errorRegister = false;
    _errorMessageRegister = '';
    _mapLogin = {};
    _errorLogin = false;
    _errorMessageLogin = '';
    getCurrentlocation();
    _mapPopular = {};
    _errorMessagePopular = '';
    _errorPopular = false;
    _mapCategory = {};
    _errorMessageCategory = '';
    _errorCategory = false;
    _mapSearch = {};
    _errorSearch = false;

    _errorMessageSearch = '';

    notifyListeners();
  }
}
