import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  FlutterLocalNotificationsPlugin notificationPlugin = new FlutterLocalNotificationsPlugin();




   NotificationService( )  {

// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid = new AndroidInitializationSettings(
        'app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    notificationPlugin.initialize(
        initializationSettings, onSelectNotification: onSelect);
  }

  Future onDidReceiveLocalNotification (int id, String body, String payload, String letter ) {

  }


  Future onSelect( String payload) {
    print(payload);
  }
  Future sendNotification (String message) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await notificationPlugin.show(
        0, 'Stumble', message, platformChannelSpecifics,
        payload: 'item x');
  }

}
