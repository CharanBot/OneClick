import 'package:flutter/material.dart';
import 'chat.dart';

// Sample service providers data
List<ServiceProvider> sampleServiceProviders = [
  ServiceProvider(
    name: 'Venkata Sai Dheeraj',
    location: 'Italy',
    imageAssetPath: 'assets/icons/mostbooked/laptop_repair.jpg',
  ),
  ServiceProvider(
    name: 'Venu Charan',
    location: 'Ohio',
    imageAssetPath: 'assets/icons/mostbooked/laptop_repair.jpg',
  ),
  ServiceProvider(
    name: 'Phanishwar Jonnalagadda',
    location: 'Gujarat',
    imageAssetPath: 'assets/icons/mostbooked/laptop_repair.jpg',
  ),
  ServiceProvider(
    name: 'Shanmuka Jonnalagadda',
    location: 'Canada',
    imageAssetPath: 'assets/icons/mostbooked/laptop_repair.jpg',
  ),
];

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        title: const Text(
          'My chats',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Colors.teal,
            // color: darkMode ? Colors.white : Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      ),
      body: ListView.builder(
        itemCount: sampleServiceProviders.length,
        itemBuilder: (context, index) {
          final serviceProvider = sampleServiceProviders[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: darkMode ? Colors.grey[850] : Colors.white54,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(serviceProvider.imageAssetPath),
                radius: 30,
              ),
              title: Text(
                serviceProvider.name,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: darkMode ? Colors.white : Colors.black,
                ),
              ),
              subtitle: Text(
                serviceProvider.location,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: darkMode ? Colors.grey[400] : Colors.grey[700],
                ),
              ),
              trailing: const Icon(
                Icons.chat,
                color: Colors.teal,
                // color: darkMode ? Colors.white : Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(
                      serviceProvider: serviceProvider,
                      serviceProviderName: '',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool
      isSender; // Indicates if the message is sent by the user or the service provider
  final DateTime time;

  ChatMessage({
    required this.text,
    required this.isSender,
    required this.time,
  });
}

class ServiceProvider {
  final String name;
  final String location;
  final String imageAssetPath;

  ServiceProvider({
    required this.name,
    required this.location,
    required this.imageAssetPath,
  });
}
