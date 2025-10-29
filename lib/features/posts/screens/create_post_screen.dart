import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dracula.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  int _charCount = 0;
  final int _maxChars = 280;
  File? _selectedImage;
  final picker = ImagePicker();
  String? _codeSnippet;

  @override
  void dispose() {
    _textController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _onTextChanged(String text) {
    setState(() => _charCount = text.length);
  }

  Future<void> _pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _selectedImage = File(picked.path));
    }
  }

  void _openCodeEditor() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF0B1220),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Code Snippet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SpaceGrotesk',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _codeController,
                    maxLines: 8,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'SpaceGrotesk',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Write your code here...',
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: const Color(0xFF141C2E),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00f5d4),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      setState(() => _codeSnippet = _codeController.text);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Add Code',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SpaceGrotesk',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _handlePost() {
    // TODO: Connect with Supabase backend
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Post submitted successfully!'),
        backgroundColor: Color(0xFF00f5d4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFF00f5d4);
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1220),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Create Post',
          style: TextStyle(
            fontFamily: 'SpaceGrotesk',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF141C2E),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white24,
                          radius: 18,
                          child: Icon(Icons.person, color: Colors.white70),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            maxLines: 5,
                            minLines: 3,
                            onChanged: _onTextChanged,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'SpaceGrotesk',
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Share your thoughts or code...',
                              hintStyle: TextStyle(color: Colors.white38),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_selectedImage != null) ...[
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(_selectedImage!, height: 160),
                      ),
                    ],
                    if (_codeSnippet != null && _codeSnippet!.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: HighlightView(
                          _codeSnippet!,
                          language: 'dart',
                          theme: draculaTheme,
                          padding: const EdgeInsets.all(8),
                          textStyle: const TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: _pickImage,
                              icon: const Icon(
                                Icons.image_outlined,
                                color: themeColor,
                              ),
                            ),
                            IconButton(
                              onPressed: _openCodeEditor,
                              icon: const Icon(Icons.code, color: themeColor),
                            ),
                          ],
                        ),
                        Text(
                          '$_charCount/$_maxChars',
                          style: const TextStyle(color: Colors.white38),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _handlePost,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Center(
                    child: Text(
                      'Post',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SpaceGrotesk',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
}
