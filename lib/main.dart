import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF25D366),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
        ),
      ),
      home: const WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        elevation: 0.7,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              // Aksi untuk kamera
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Aksi untuk pencarian
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert), // Ikon titik tiga
            onPressed: () {
              // Aksi untuk menu lainnya
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChatsTab(),
          StatusTab(),
          CallsTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.message, color: Colors.white),
        onPressed: () {
          // Tambahkan aksi ketika tombol ditap
        },
      ),
    );
  }
}

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        final contactNames = [
          'Agus',
          'Gungde',
          Row(
            children: const [
              Text('My Love'),
              SizedBox(width: 5),
              Icon(Icons.favorite, color: Colors.red, size: 18), // Icon jantung
            ],
          ),
        ];
        final lastMessages = [
          'Wasit botak.!!!',
          'Inpo login bang?',
          'Tidur ayang!! 😡'
        ];
        final times = ['11:09 PM', '10:24 PM', '10:01 PM'];

        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: contactNames[index] is String
              ? Text(contactNames[index] as String)
              : contactNames[index] as Widget,
          subtitle: Text(lastMessages[index]),
          trailing: Text(times[index]),
        );
      },
    );
  }
}

class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.add, color: Colors.white),
          ),
          title: Text('Status Saya'),
          subtitle: Text('Ketuk untuk memperbarui status'),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue, // Warna untuk ikon mobilegend
            child: Icon(Icons.videogame_asset, color: Colors.white), // Ikon mobilegend
          ),
          title: Text('Gungde'),
          subtitle: Text('Baru saja'),
        ),
      ],
    );
  }
}

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: const Text('Gungde'),
          subtitle: const Row(
            children: [
              Icon(Icons.call_made, color: Colors.green, size: 16),
              SizedBox(width: 5),
              Text('Hari ini, 10:31 PM'),
            ],
          ),
          trailing: Icon(Icons.call, color: Theme.of(context).primaryColor),
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Row(
            children: const [
              Text('My Love'),
              SizedBox(width: 5),
              Icon(Icons.favorite, color: Colors.red, size: 18), // Icon jantung
            ],
          ),
          subtitle: const Row(
            children: [
              Icon(Icons.call_received, color: Colors.red, size: 16),
              SizedBox(width: 5),
              Text('Hari ini, 09:21 PM'),
            ],
          ),
          trailing: Icon(Icons.videocam, color: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}
