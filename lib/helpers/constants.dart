import 'package:flutter/material.dart'
    show Alignment, Color, Colors, LinearGradient;
import 'package:flutter/material.dart'
    show Color, Colors, FontWeight, TextStyle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' show MultipartRequest;
import 'package:intl/intl.dart' show DateFormat, NumberFormat;



DateFormat dateFormat = DateFormat('dd-MM-yy');
DateFormat timeFormat = DateFormat('hh:mm:ss a');
NumberFormat numberFormat = NumberFormat('#,##,000.0#');

DateTime get getCurrentDateTime => DateTime.now();
String get getCurrentFormattedDate => dateFormat.format(DateTime.now());
String get getCurrentFormattedTime => timeFormat.format(DateTime.now());

//WebView User Agent
const String webViewUserAgent =
    'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.192 Safari/537.36';

final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
final RegExp phoneValidatorRegExp =
    RegExp(r'^([0-9]{9})|([A-Za-z0-9._%\+\-]+@[a-z0-9.\-]+\.[a-z]{2,3})$');
final RegExp stringIsUrlRegExp = RegExp(
    r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)');

//SignUp Form Error
const String kEmailNullError = 'Please Enter your email';
const String kInvalidEmailError = 'Please Enter Valid Email';
const String kPassNullError = 'Please Enter your password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = "Passwords don't match";
const String kInvaliedInfoError = 'Email or Password Invalied';
const String kFirstNameNullError = 'Please Enter your first name';
const String kLastNameNullError = 'Please Enter your last name';
const String kPhoneNumberNullError = 'Please Enter your phone number';
const String kInvaliedPhoneNumberError = 'Please Enter valid phone number';
const String kAddressNullError = 'Please Enter your address';
const String kCountryNullError = 'Please Select your Country';
const String kStateNullError = 'Please Select your State';

const String baseLink = '';

const String playStoreUrl = 'https://play.google.com/store/apps/details?id= ';

const Map<String, String> headerNoAuth = {'Accept': 'application/json'};

Map<String, String> headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer ...',
};

MultipartRequest postURL(String trail) =>
    MultipartRequest('POST', Uri.parse(baseLink + trail));

MultipartRequest getURL(String trail) =>
    MultipartRequest('GET', Uri.parse(baseLink + trail));

String numberFormateConvert(double? currency) =>
    currency != null ? numberFormat.format(currency) : '';

//Colors
Color white = Colors.white;
Color black = Colors.black;
LinearGradient bgColor = LinearGradient(
  colors: [
    const Color(0xFF019DA2),
    const Color(0xFF009CFF).withOpacity(0.8),
  ],
  begin: Alignment.topLeft, //begin of the gradient color
  end: const Alignment(0.3, 0.3), //end of the gradient color
  //stops: [0, 0.8]
);
const Color textColor = Color(0xFFFFFFFF);

// Color kLightPrimaryColor = Colors.blue.shade900.withOpacity(0.85);
Color kLightPrimaryColor = Color(0xffF5F5F5);

const kPrimaryColor = Color(0xff009CFF);
const kSecondPrimaryColor = Color(0xff019DA2);
const kBackgroundColor = Color(0xffF5F5F5);
const kDividerColor = Color(0xffE4E4E4);
const kActiveStatus = Color(0xff22C375);

double kDefaultPadding = 20.r;

// Text Style
// Text Style
final kHeadingTextStyle = TextStyle(
  fontSize: 28.sp,
  fontWeight: FontWeight.w700,
  color: black,
);

final kTitleTextstyle = TextStyle(
  fontSize: 14.sp,
  color: black.withOpacity(0.84),
  fontWeight: FontWeight.w400,
);

final kHeaderTextstyle = TextStyle(
  fontSize: 28.sp,
  color: kSecondPrimaryColor,
  fontWeight: FontWeight.w700,
);
