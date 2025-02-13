import 'package:dio/dio.dart';
import 'package:datiego/core/utils/exceptions.dart';

/// **🔍 HttpResponseValidat - اعتبارسنجی پاسخ‌های HTTP**
///
/// این mixin برای بررسی و اعتبارسنجی پاسخ‌های دریافتی از سرور استفاده می‌شود.
/// در صورتی که پاسخ دارای وضعیت **غیر از 200** باشد، یک استثنا از نوع `AppException` پرتاب خواهد شد.
mixin HttpResponseValidat {
  /// **✅ متد بررسی پاسخ HTTP**
  ///
  /// این متد وضعیت پاسخ را بررسی می‌کند و در صورت غیرمجاز بودن، یک `AppException` پرتاب می‌کند.
  ///
  /// **پارامتر:**
  /// - `response` : یک شیء `Response` که از `Dio` دریافت شده است.
  ///
  /// **پرتاب خطا:**
  /// - اگر `statusCode` برابر با `200` نباشد، خطای `AppException` پرتاب می‌شود.
  validatResponse(Response response) {
    if (response.statusCode != 200) {
      throw AppException();
    }
  }
}
