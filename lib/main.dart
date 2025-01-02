// import 'package:fitness/view/home/blank_view.dart';
// import 'package:fitness/view/home/finished_workout_view.dart';
// import 'package:fitness/view/main_tab/main_tab_view.dart';
// import 'package:fitness/view/main_tab/select_view.dart';
// import 'package:flutter/material.dart';

// import 'common/colo_extension.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fitness 3 in 1',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           // This is the theme of your application.
//           //
//           // Try running your application with "flutter run". You'll see the
//           // application has a blue toolbar. Then, without quitting the app, try
//           // changing the primarySwatch below to Colors.green and then invoke
//           // "hot reload" (press "r" in the console where you ran "flutter run",
//           // or simply save your changes to "hot reload" in a Flutter IDE).
//           // Notice that the counter didn't reset back to zero; the application
//           // is not restarted.
//           primaryColor: TColor.primaryColor1,
//           fontFamily: "Poppins"),
//       home: const MainTabView(),
//     );
//   }
// }

// code mới
// import 'package:flutter/material.dart';

// import 'ApiService.dart'; // Nhớ nhập tệp ApiService của bạn

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: UserListPage(),
//     );
//   }
// }

// class UserListPage extends StatefulWidget {
//   @override
//   _UserListPageState createState() => _UserListPageState();
// }

// class _UserListPageState extends State<UserListPage> {
//   late Future<List<dynamic>> _users;

//   @override
//   void initState() {
//     super.initState();
//     _users = ApiService().fetchUsers(); // Gọi API để lấy danh sách người dùng
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Danh sách người dùng'),
//       ),
//       body: FutureBuilder<List<dynamic>>(
//         future: _users,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Lỗi: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('Không có dữ liệu'));
//           } else {
//             final users = snapshot.data!;
//             return ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 final user = users[index];
//                 return ListTile(
//                   title: Text(user['name']), // Hiển thị tên người dùng
//                   subtitle: Text(user['email']), // Hiển thị email người dùng
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// code mới thư model

import 'package:fitness/model/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Management',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> _futureUsers; // Dữ liệu cho danh sách người dùng

  @override
  void initState() {
    super.initState();
    _futureUsers =
        UserService().fetchUsers(); // Lấy dữ liệu khi khởi tạo widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách người dùng'),
      ),
      body: FutureBuilder<List<User>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Đã xảy ra lỗi: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Không có dữ liệu người dùng'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name), // Hiển thị tên người dùng
                  subtitle: Text(user.email), // Hiển thị email người dùng
                );
              },
            );
          }
        },
      ),
    );
  }
}
