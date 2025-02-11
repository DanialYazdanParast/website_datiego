import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // یا LaunchMode.platformDefault
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> sendEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication, // یا LaunchMode.platformDefault
      );
    } else {
      throw 'Could not launch $email';
    }
  }

  Future<void> makePhoneCall(String number) async {
    final Uri url = Uri.parse("tel:$number");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
