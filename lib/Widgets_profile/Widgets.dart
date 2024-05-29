import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

part 'Txt.dart';

class Widgets {
  Widgets._privateConstructor();
  static final Widgets _instance = Widgets._privateConstructor();
  static Widgets get instance => _instance;

  static String avatar(String phoneNumberOrRemoteKey) {
    String fileName = phoneNumberOrRemoteKey.replaceAll("+", "%2B");
    return "https://firebasestorage.googleapis.com/v0/b/service-ad14a.appspot.com/o/avatars%2F$fileName.jpg?alt=media";
  }

  static Widget loadingCircle({Color? color, double size = 26}) {
    return Material(
      type: MaterialType.circle,
      color: color,
      elevation: 0,
      child: SizedBox(
        height: size,
        width: size,
        child: const FittedBox(
          fit: BoxFit.scaleDown,
          child: CircularProgressIndicator(
            strokeWidth: 5,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ),
    );
  }

  ///This will return the darken color of the given value
  static Color darkenColor(Color color, double value) =>
      HSLColor.fromColor(color).withLightness(value).toColor();

  static Txt subtitle(BuildContext context, String text,
      {TextAlign? textAlign, double? fontSize = 12}) {
    return Txt(
        text: text,
        textAlign: textAlign,
        fontSize: fontSize,
        color: subtitleColor(context));
  }

  static Color subtitleColor(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.color!;
  }

  static const Duration duration = Duration(milliseconds: 350);
  static const Duration duration1Sec = Duration(seconds: 1);
  static const Duration duration2Sec = Duration(seconds: 2);
  static const Duration duration3Sec = Duration(seconds: 3);

  static const Curve curve = Curves.easeIn;

  static bool debugging = kDebugMode;
  static bool debugMode = kDebugMode;

  static List<String> generateTags(List sentences) {
    List<String> tags = [];
    for (var sentence in sentences) {
      if (sentence != null) {
        List words = '$sentence'.toLowerCase().split(' ');
        for (var word in words) {
          if (!tags.contains(word)) tags.add(word);
        }
      }
    }
    return tags
      ..sort((b, a) => a.length.compareTo(b.length))
      ..removeWhere((element) => element.length < 3);
  }

  static Widget boldHeading(String string, {double? left}) {
    return Container(
      padding: EdgeInsets.only(top: 18, bottom: 3, left: left ?? 8),
      alignment: Alignment.centerLeft,
      child: Txt(
        text: string,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.start,
        fontSize: 16,
      ),
    );
  }

  static Widget arrow({Color? color, bool back = false, double angle = 90}) {
    final Color color0 = color ?? Colors.grey.shade200;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color0.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
      child: Transform.rotate(
        angle: angle * math.pi / 180,
        child: Icon(
          back ? Icons.chevron_left : Icons.chevron_right,
          size: 18,
          color: color0,
        ),
      ),
    );
  }

  static List<String> generateListString(List? list) {
    if (list == null) return [];
    return List<String>.generate((list).length, (index) => "${list[index]}");
  }

  static String get today =>
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";

  static Future<void> copy(dynamic text) async {
    await Clipboard.setData(ClipboardData(text: "$text"));
  }

  static String filter(String text) {
    return (text
        .replaceAll(RegExp(r'[^\w\s]+'), '')
        .replaceAll(' ', '')
        .replaceAll('_', ''));
  }

  static String timeAgo(
    dynamic input, {
    String? prefix,
  }) {
    DateTime? finalDateTime;

    if (input is DateTime) finalDateTime = input;
    if (input is int) {
      finalDateTime = DateTime.fromMillisecondsSinceEpoch(input);
    }

    if (finalDateTime == null) return '';

    final Duration difference = DateTime.now().difference(finalDateTime);
    bool isPast = finalDateTime.millisecondsSinceEpoch <=
        DateTime.now().millisecondsSinceEpoch;
    String ago;

    if (difference.inDays > 8) {
      ago = finalDateTime.toString().substring(0, 10);
    } else if ((difference.inDays / 7).floor() >= 1) {
      ago = isPast ? '1 week ago' : '1 week';
    } else if (difference.inDays >= 2) {
      ago = isPast
          ? '${difference.inDays} days ago'
          : '${difference.inDays} days';
    } else if (difference.inDays >= 1) {
      ago = isPast ? 'Yesterday' : 'Tomorrow';
    } else if (difference.inHours >= 2) {
      ago = '${difference.inHours} hours ${isPast ? 'ago' : ''}';
    } else if (difference.inHours >= 1) {
      ago = '1 hour ${isPast ? 'ago' : ''}';
    } else if (difference.inMinutes >= 2) {
      ago = '${difference.inMinutes} minutes ${isPast ? 'ago' : ''}';
    } else if (difference.inMinutes >= 1) {
      ago = '1 minute ${isPast ? 'ago' : ''}';
    } else if (difference.inSeconds >= 3) {
      ago = '${difference.inSeconds} seconds ${isPast ? 'ago' : ''}';
    } else {
      ago = '${isPast ? 'Just now' : 'now'}';
    }
    return prefix == null ? ago : '$prefix $ago';
  }

  static String toDateTime(int createdAt) {
    return '${toDate(createdAt)} @ ${toTime(createdAt)}';
  }

  static String toDate(int createdAt,
      {bool showFullYear = true, bool showYear = true}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(createdAt);
    int day = date.day;
    int month0 = date.month;
    String month = toMonth(month0);
    String year = showYear ? toYear(createdAt, showFullYear: showFullYear) : "";
    return '$day $month $year';
  }

  static String toTime(int createdAt) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(createdAt);
    int hour = date.hour > 12 ? (date.hour - 12) : date.hour;
    String minutes = date.minute < 10 ? '0${date.minute}' : '${date.minute}';
    String amPm = date.hour >= 12 ? "PM" : "AM";
    return '$hour:$minutes $amPm';
  }

  static String toYear(int createdAt, {bool showFullYear = true}) {
    int yr = DateTime.fromMillisecondsSinceEpoch(createdAt).year;
    return showFullYear ? "$yr" : "$yr".substring(0, 2);
  }

  static String toMonth(int month) {
    return month > 0 ? months[month - 1] : '$month';
  }

  static const List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static Future wait(int milliseconds) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
  }

  static void push(Widget? child, BuildContext context) {
    if (child != null) {
      Navigator.push(context, FadePageRoute(widget: child));
    } else {
      // String _log = "No destination page found";
      // debugMode ? showToast(_log) : print(_log);
    }
  }

  static void pop(BuildContext context) {
    try {
      Navigator.pop(context);
    } catch (e) {}
  }

  static double mheight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double mwidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Widget empty() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Icon(
            Icons.delete,
            size: 100,
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  static Widget divider({Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Divider(
        height: 4.5,
        color: color,
      ),
    );
  }

  static Widget sizedBox({double height = 15}) {
    return SizedBox(
      height: height,
    );
  }
}

class FadePageRoute extends PageRouteBuilder {
  final Widget widget;
  FadePageRoute({required this.widget})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
}
