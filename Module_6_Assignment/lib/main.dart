import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: true, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Photo Gallery')),
        body: Scrollbar(
          child: Column(
            children: [
              // Text('Welcome to My Photo Gallery!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              const ListTile(
                title: Text(
                  'Welcome to My Photo Gallery!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 0, 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search for photos...'),
                ),
              ),
              Expanded(child: MyWidget()),
            ],
          ),
        ));
  }
}

class MyWidget extends StatelessWidget {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1694843697790-d384af776f2b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1692274540897-3779f8f75a1a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1682685796063-d2604827f7b3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyNnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1694843657638-45fade6ba747?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1694846119962-491ac7bcc568?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1693773024865-d2623880567d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
    // Add more image URLs here
  ];

  final List<String> texts = [
    'Photo 0',
    'Photo 1',
    'Photo 2',
    'Photo 3',
    'Photo 4',
    'Photo 5'
    // Add more texts here
  ];

  MySnackBar(message, context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      SizedBox(
        height: 300,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Adjust the number of columns as needed
          ),
          itemCount: imageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  MySnackBar('You are tapping on a photo', context);
                },
                child: Column(
                  children: [
                    Image.network(
                      imageUrls[index],
                      height: 100, // Adjust the image height as needed
                      width: 100, // Adjust the image width as needed
                      fit: BoxFit.cover,
                    ),
                    Text(
                      texts[index],
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ));
          },
        ),
      ),
      const ListTile(
        leading: ClipOval(
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1694843657638-45fade6ba747?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60', // Replace with your image URL
            ),
          ),
        ),
        title: Text(
          'Photo 1',
          style: TextStyle(fontSize: 16),
        ),
        subtitle:
            Text('Description for Photo 1'), // Add your subtitle text here
      ),
      const ListTile(
        leading: ClipOval(
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1694846119962-491ac7bcc568?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60', // Replace with your image URL
            ),
          ),
        ),
        title: Text(
          'Photo 2',
          style: TextStyle(fontSize: 16),
        ),
        subtitle:
            Text('Description for Photo 2'), // Add your subtitle text here
      ),
      const ListTile(
        leading: ClipOval(
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1693773024865-d2623880567d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60', // Replace with your image URL
            ),
          ),
        ),
        title: Text(
          'Photo 3',
          style: TextStyle(fontSize: 16),
        ),
        subtitle:
            Text('Description for Photo 3'), // Add your subtitle text here
      ),
      Center(
        child: GestureDetector(
          onTap: () {
            MySnackBar('Photos Uploaded Successfully!', context);
          },
          child: const CircleAvatar(
            backgroundColor: Colors.blue,
            // Background color of the circle
            radius: 35,
            // Adjust the radius as needed
            child: Icon(

              Icons.upload, // Icon inside the circle
              color: Colors.white, // Icon color
              size: 30,
            ),
          ),
        ),
      )
    ]);
  }
}
