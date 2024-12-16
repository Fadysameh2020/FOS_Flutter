import 'package:flutter/material.dart';
import 'package:fos_app/core/app_localiziations/app_localizations.dart';
import 'package:fos_app/core/styles/app_colors.dart';
import 'package:fos_app/core/styles/text_styles.dart';
import 'package:intl/intl.dart' as intl;

import '../models/user_model.dart';
import 'app_router/routes.dart';
import 'app_strings/app_strings.dart';
import 'networks/local/secure_cache_helper.dart';
import 'networks/remote/socket_service.dart';
import 'package:flutter/widgets.dart';

final SocketService socketService = SocketService();

UserModel? userData;
var primaryColor = AppColors.primaryColor;


const String termsAndConditionsLink =
    '';
const String policyAndPrivacyLink = '';
const String supportMail = '';
const String supportNumber = '';
const String imageUrl =
    "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=1380&t=st=1714321794~exp=1714322394~hmac=4928f07d1e86d8e39c1141f06d70be14ac9268b6e05c9fd9775a3acc431209fd";
TextDirection arabicDirectionality = TextDirection.rtl;
TextDirection englishDirectionality = TextDirection.ltr;
late bool isLoggedIn;
late bool isEnglishLocale;

Future<String?> getToken() async {
  return await SecureCacheHelper.getData(key: 'token');
}

Future<void> saveToken({required String token}) async {
  await SecureCacheHelper.saveData(key: 'token', value: token);
  await checkLoginStatus();
}

Future<void> removeToken() async {
  await SecureCacheHelper.removeData(key: 'token');
  await checkLoginStatus();
}

Future<void> checkLoginStatus() async {
  isLoggedIn = await getToken() != null ? true : false;
}

const double appPadding = 16;

String checkDateTime({DateTime? dateTime}) {
  String formattedDateTime = '';

  if (dateTime != null) {
    final now = DateTime.now();
    final yesterday = now.subtract(Duration(days: 1));
    if (dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year) {
      formattedDateTime = intl.DateFormat('hh:mm a').format(dateTime);
    } else if (dateTime.day == yesterday.day &&
        dateTime.month == yesterday.month &&
        dateTime.year == yesterday.year) {
      BuildContext context =
      AppRouter.router.routerDelegate.navigatorKey.currentContext!;
      formattedDateTime = AppStrings.yesterday.tr(context);
    } else {
      formattedDateTime = intl.DateFormat('dd-MM-yy').format(dateTime);
    }
  }

  return formattedDateTime;
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return '$minutes:$seconds';
}

String convertNumbersToArabic(String input) {
  const westernArabicNumerals = '0123456789';
  const easternArabicNumerals = '٠١٢٣٤٥٦٧٨٩';

  return input.split('').map((char) {
    final index = westernArabicNumerals.indexOf(char);
    return index != -1 ? easternArabicNumerals[index] : char;
  }).join('');
}

TextSpan formatPlateNumberWithDividers(String plateNumber) {
  // Convert numbers to Arabic
  String convertedPlateNumber = convertNumbersToArabic(plateNumber);

  List<TextSpan> spans = [];
  StringBuffer buffer = StringBuffer();
  bool? lastCharWasNumber;

  for (int i = 0; i < convertedPlateNumber.length; i++) {
    String char = convertedPlateNumber[i];
    bool isCurrentCharNumber = _isArabicNumber(char);

    if (lastCharWasNumber == null) {
      lastCharWasNumber = isCurrentCharNumber;
    }

    if (lastCharWasNumber != isCurrentCharNumber) {
      // Add buffer content to spans
      spans.add(TextSpan(text: buffer.toString()));
      // Add divider
      spans.add(TextSpan(
        text: ' | ',
        style: TextStyle(
          color: Colors.black, // Divider color
        ),
      ));
      // Clear the buffer and reset it with the current character
      buffer.clear();
    }

    buffer.write(char);
    lastCharWasNumber = isCurrentCharNumber;
  }

  // Add the final part
  spans.add(TextSpan(text: buffer.toString()));

  return TextSpan(children: spans, style: MyTextStyles.textStyle18Medium);
}

// Helper function to check if a character is an Arabic numeral
bool _isArabicNumber(String char) {
  return '٠١٢٣٤٥٦٧٨٩'.contains(char);
}

String getPlateNumbers(String plateNumber) {
  // Extract numbers and convert them to Arabic numerals
  String numbers = plateNumber.replaceAll(RegExp(r'[^\d]'), '');
  String arabicNumbers = convertNumbersToArabic(numbers);

  // Add spaces between the Arabic numerals
  return arabicNumbers
      .split('')
      .reversed
      .join(' ');
}

String getPlateLetters(String plateNumber) {
  // Extract letters only
  String letters = plateNumber.replaceAll(RegExp(r'[\d]'), '');

  // Add spaces between the letters
  return letters.split('').join(' ');
}

final RegExp urlRegExp = RegExp(
  r'^(https?:\/\/)?' // Optional scheme (http or https)
  r'(([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,})' // Domain name
  r'(:\d+)?' // Optional port
  r'(\/[-a-zA-Z0-9@:%._\+~#=]*)*' // Optional path
  r'(\?[;&a-zA-Z0-9%_.,~+=-]*)?' // Optional query parameters
  r'(\#[-a-zA-Z0-9_]*)?$', // Optional fragment
  caseSensitive: false,
  multiLine: false,
);

bool isLink({required text}) {
  return RegExp(
    r'((https?|ftp)://[^\s/$.?#].[^\s]*)',
    caseSensitive: false,
  )
      .allMatches(text)
      .toList()
      .isNotEmpty;
}
