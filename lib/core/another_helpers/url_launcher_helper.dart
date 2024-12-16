import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncher{
  Future<void> launchLink(String link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'There was a problem to open the url: $url';
    }
  }

  Future<void> launchCall(String phoneNumber) async {
    Uri telephoneUrl = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(telephoneUrl)) {
      await launchUrl(telephoneUrl);
    } else {
      throw "Error occured trying to call that number.";
    }
  }

  Future<void> launchEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      //query: 'subject=App Feedback&body=App Version 3.23', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw "Error occured trying to call that number.";
    }
  }
}