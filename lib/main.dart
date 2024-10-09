import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class ImageNotifier extends Notifier<String?> {
  @override
  String? build() {
    return null;
  }

  void selectImage(String imageUrl) {
    state = imageUrl;
  }
}

final imageProvider = NotifierProvider<ImageNotifier, String?>(() {
  return ImageNotifier();
});

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final selectedImage = ref.watch(imageProvider);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Image.network(
                  'https://images.unsplash.com/photo-1516117172878-fd2c41f4a759?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDF8fHdoaXRlfGVufDB8fHx8MTY4NjU0NjAwNw&ixlib=rb-1.2.1&q=80&w=200'),
              title: const Text('Image 1'),
              onTap: () {
                ref.read(imageProvider.notifier).selectImage(
                    'https://images.unsplash.com/photo-1516117172878-fd2c41f4a759?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDF8fHdoaXRlfGVufDB8fHx8MTY4NjU0NjAwNw&ixlib=rb-1.2.1&q=80&w=800');
              },
            ),
            ListTile(
              leading: Image.network(
                  'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDN8fHJlZCUyMGNhcnxlbnwwfHx8fDE2ODY1NDYwMDc&ixlib=rb-1.2.1&q=80&w=200'),
              title: const Text('Image 2'),
              onTap: () {
                ref.read(imageProvider.notifier).selectImage(
                    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDN8fHJlZCUyMGNhcnxlbnwwfHx8fDE2ODY1NDYwMDc&ixlib=rb-1.2.1&q=80&w=800');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: selectedImage == null
                ? const Text('이미지를 선택하세요')
                : Image.network(selectedImage),
          ),
          Positioned(
            top: 0,
            left: 10,
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
