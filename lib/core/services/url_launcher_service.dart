import 'package:url_launcher/url_launcher.dart';

/// **🔗 UrlLauncherService - سرویس باز کردن لینک‌ها و تعامل با دستگاه**
///
/// این کلاس مسئول باز کردن لینک‌های وب، ارسال ایمیل و برقراری تماس تلفنی است.
/// از `url_launcher` برای اجرای این عملیات استفاده می‌شود.

class UrlLauncherService {
  /// **🌐 باز کردن یک URL در مرورگر خارجی**
  ///
  /// این متد یک URL را دریافت کرده و در صورت معتبر بودن، آن را در مرورگر پیش‌فرض کاربر باز می‌کند.
  ///
  /// - `url`: آدرسی که باید باز شود.
  /// - حالت پیش‌فرض: `LaunchMode.externalApplication` برای باز کردن لینک در مرورگر.
  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // باز کردن لینک در مرورگر خارجی
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  /// **📧 ارسال ایمیل به یک آدرس مشخص**
  ///
  /// این متد برنامه‌ی ایمیل پیش‌فرض دستگاه را با آدرس ایمیل مشخص باز می‌کند.
  ///
  /// - `email`: آدرس ایمیلی که باید به آن پیام ارسال شود.
  Future<void> sendEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication, // باز کردن برنامه‌ی ایمیل
      );
    } else {
      throw 'Could not launch $email';
    }
  }

  /// **📞 برقراری تماس تلفنی**
  ///
  /// این متد شماره تلفن مشخص‌شده را در اپلیکیشن تماس باز می‌کند.
  ///
  /// - `number`: شماره‌ای که باید شماره‌گیری شود.
  Future<void> makePhoneCall(String number) async {
    final Uri url = Uri.parse("tel:$number");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
