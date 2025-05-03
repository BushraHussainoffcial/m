import 'package:url_launcher/url_launcher.dart';

class LauncherHelper {
  static void launchEmail(String email, {String text = ''}) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=App Feedback&body=$text', //add subject and body here
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(
        emailLaunchUri,
      );
    }
  }

}