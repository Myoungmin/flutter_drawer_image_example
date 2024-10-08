import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thumbnail Drawer Example'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Image.network(
                  'https://images.unsplash.com/photo-1516117172878-fd2c41f4a759?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDF8fHdoaXRlfGVufDB8fHx8MTY4NjU0NjAwNw&ixlib=rb-1.2.1&q=80&w=200'),
              title: const Text('Image 1'),
              onTap: () {
                setState(() {
                  selectedImage =
                      'https://images.unsplash.com/photo-1516117172878-fd2c41f4a759?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDF8fHdoaXRlfGVufDB8fHx8MTY4NjU0NjAwNw&ixlib=rb-1.2.1&q=80&w=800';
                });
              },
            ),
            ListTile(
              leading: Image.network(
                  'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDN8fHJlZCUyMGNhcnxlbnwwfHx8fDE2ODY1NDYwMDc&ixlib=rb-1.2.1&q=80&w=200'),
              title: const Text('Image 2'),
              onTap: () {
                setState(() {
                  selectedImage =
                      'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDN8fHJlZCUyMGNhcnxlbnwwfHx8fDE2ODY1NDYwMDc&ixlib=rb-1.2.1&q=80&w=800';
                });
              },
            ),
            // 다른 썸네일도 추가 가능
          ],
        ),
      ),
      body: Center(
        child: selectedImage == null
            ? const Text('이미지를 선택하세요')
            : Image.network(selectedImage!),
      ),
    );
  }
}
