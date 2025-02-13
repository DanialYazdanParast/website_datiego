/// کلاس موجودیت مهارت‌ها
///
/// این کلاس برای نمایش مهارت‌ها به کار می‌رود. هر مهارت دارای یک متن (`text`) و یک کد رنگی (`colorCode`) است.
///
/// ## ویژگی‌ها:
/// - `text`: نمایانگر نام یا توضیح مهارت است.
/// - `colorCode`: نمایانگر کد رنگی مربوط به مهارت است.
class SkillsEntities {
  final String text;
  final int colorCode;

  const SkillsEntities({
    required this.text,
    required this.colorCode,
  });
}
