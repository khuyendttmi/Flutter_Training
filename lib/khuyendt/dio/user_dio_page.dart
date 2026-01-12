import 'package:flutter/material.dart';
import 'package:flutter_training/khuyendt/dio/dio.dart';
import 'package:flutter_training/khuyendt/dio/user_dio.dart';

import 'dio_getit.dart';

class UserDioPage extends StatefulWidget {
  const UserDioPage({super.key});

  @override
  State<UserDioPage> createState() => _UserDioPageState();
}

class _UserDioPageState extends State<UserDioPage> {
  late Future<List<UserDio>> _futureUsers;
  final apiService = locator<ApiService>();

  List<UserDio> _users = [];
  List<UserDio> _filterUsers = [];

  @override
  void initState() {
    super.initState();
    _futureUsers = apiService.getUser();
  }

  void search(String title) {
    setState(() {
      if (title.isEmpty) {
        _filterUsers = _users;
      } else {
        _filterUsers = _users
            .where(
              (element) =>
                  element.name.toLowerCase().contains(title.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<UserDio>>(
          future: _futureUsers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Đang loading
            } else if (snapshot.hasError) {
              return Text("Lỗi: ${snapshot.error}");
            }
            _users = snapshot.data!;
            _filterUsers = _filterUsers.isEmpty ? _users : _filterUsers;
            return Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Tìm kiếm theo tên',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: search,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filterUsers.length,
                    itemBuilder: (context, index) {
                      final user = _filterUsers[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text(user.name[0])),
                        title: Text(user.name),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
