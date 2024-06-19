import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:only_click/features/personalisation/chat/chat_list_page.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatScreen extends StatefulWidget {
  final ServiceProvider serviceProvider;

  const ChatScreen({
    Key? key,
    required this.serviceProvider,
    required String serviceProviderName,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = []; // List to store chat messages

  void _sendMessage(String messageText) {
    setState(() {
      _messages.add(ChatMessage(
        text: messageText,
        isSender: true, // Assuming user sends the message initially
        time: DateTime.now(),
        isImage: false,
        isFile: false,
      ));
      // Simulate a reply from the service provider after some delay
      _replyFromServiceProvider();
    });
    _controller.clear();
    _scrollToBottom();
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Photo',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'File',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _messages.add(ChatMessage(
          text: result.files.single.path!,
          isSender: true,
          time: DateTime.now(),
          isImage: false,
          isFile: true,
          fileName: result.files.single.name,
        ));
      });
    }
  }

  void _handleImageSelection() async {
    // Check and request permission if needed
    var status = await Permission.photos.request();
    if (status.isGranted) {
      // Permission granted, proceed to pick image
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _messages.add(ChatMessage(
            text: pickedFile.path,
            isSender: true,
            time: DateTime.now(),
            isImage: true,
            isFile: false,
          ));
        });
      }
    } else {
      // Handle permission denied
      print('Permission denied for photos');
    }
  }

  void _replyFromServiceProvider() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add(ChatMessage(
          text:
              'Hello from ${widget.serviceProvider.name}!', // Example reply message
          isSender: false, // Service provider is the sender
          time: DateTime.now(),
          isImage: false,
          isFile: false,
        ));
        _scrollToBottom();
      });
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;
    final double maxWidth =
        MediaQuery.of(context).size.width * 0.7; // 70% of screen width

    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
        title: Text(
          widget.serviceProvider.name,
          style: TextStyle(
            color: darkMode ? Colors.white : Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        iconTheme: IconThemeData(color: darkMode ? Colors.white : Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Align(
                    alignment: message.isSender
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Container(
                        decoration: BoxDecoration(
                          color: message.isSender
                              ? Colors.teal
                              : Colors.grey[300], //blue
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12),
                            topRight: const Radius.circular(12),
                            bottomLeft: message.isSender
                                ? const Radius.circular(12)
                                : const Radius.circular(0),
                            bottomRight: message.isSender
                                ? const Radius.circular(0)
                                : const Radius.circular(12),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: message.isSender
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            if (message.isImage)
                              Image.file(
                                File(message.text),
                                fit: BoxFit.cover,
                              )
                            else if (message.isFile)
                              GestureDetector(
                                onTap: () => OpenFilex.open(message.text),
                                child: Row(
                                  children: [
                                    Icon(Icons.attach_file,
                                        color: message.isSender
                                            ? Colors.white
                                            : Colors.black),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        message.fileName!,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: message.isSender
                                              ? Colors.white
                                              : Colors.black,
                                          decoration: TextDecoration.underline,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            else
                              Text(
                                message.text,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: message.isSender
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            const SizedBox(height: 4),
                            Text(
                              message.formattedTime,
                              style: TextStyle(
                                color: message.isSender
                                    ? Colors.white70
                                    : Colors.black54,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: _handleAttachmentPressed,
                  color: Colors.teal, // blue
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      hintStyle: const TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                      ),
                      filled: true,
                      fillColor: darkMode ? Colors.grey[800] : Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    onSubmitted: (value) {
                      if (value.trim().isNotEmpty) {
                        _sendMessage(value);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () {
                    String messageText = _controller.text.trim();
                    if (messageText.isNotEmpty) {
                      _sendMessage(messageText);
                    }
                  },
                  backgroundColor: Colors.teal, //blue
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isSender;
  final DateTime time;
  final bool isImage; // New field to indicate if the message is an image
  final bool isFile; // New field to indicate if the message is a file
  final String? fileName; // New field to store file name

  ChatMessage({
    required this.text,
    required this.isSender,
    required this.time,
    required this.isImage,
    required this.isFile,
    this.fileName,
  });

  String get formattedTime {
    final hour = time.hour;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final formattedHour = hour > 12
        ? hour - 12
        : hour == 0
            ? 12
            : hour;
    return '$formattedHour:$minute $period';
  }
}
