import 'package:flutter/material.dart';

// Basic colors used
const Color kPrimary = Color(0xFFFF6E00);
const Color kPrimaryDark = Color(0xFF333333);
const Color kAccent = Color(0xFF1C1919);
const Color kAlertRed = Color(0xFF8B0000);

// Asset images
const String defaultAvatar = "assets/images/default-avatar.jpg";
const String ktmBlackLogo = "assets/images/ktm-black-logo.png";
const String ktmWhiteLogo = "assets/images/ktm-white-logo.png";
const String ktmOrangeLogo = "assets/images/ktm-orange-logo.png";
const String readyToRaceBlack = "assets/images/ready-to-race-black.png";

// List of asset images for carousel slides
const List<AssetImage> carouselList = [
  AssetImage("assets/images/ktm-1.jpg"),
  AssetImage("assets/images/ktm-2.jpg"),
  AssetImage("assets/images/ktm-3.jpg"),
  AssetImage("assets/images/ktm-4.jpg"),
  AssetImage("assets/images/ktm-5.jpg"),
];

// KTM bikes data url
const ip = "192.168.29.32";

// Bike Data Urls
const bikesUrl = 'http://$ip/ktm/lib/bike-data/fetchData.php';
const bikesImgUrl = 'http://$ip/ktm/images/';
const bikeBookingUrl = "https://www.ktm.com/en-in/book/book-your-bike.html";

// KTM Centre Data Urls
const ktmCenterUrl = 'http://$ip/ktm/lib/ktm-centers/fetchCenterData.php';

// Manage users url
const addUserUrl = "http://$ip/ktm/lib/user-data/insert_user.php";
const userLoginUrl = "http://$ip/ktm/lib/user-data/login_user.php";

// Bike manual
const manualUrl = "https://www.ktm.com/en-in/service/manuals.html";
