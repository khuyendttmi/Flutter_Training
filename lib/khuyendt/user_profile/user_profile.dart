import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/khuyendt/user_profile/provider/user_provider.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final userNotifier = ref.read(userProvider.notifier);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'User Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        actions: [
          user != null
              ? IconButton(onPressed: () => userNotifier.logout(), icon: Icon(Icons.logout))
              : SizedBox.shrink(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              user == null
                  ? ElevatedButton(
                      onPressed: () => userNotifier.saveUser(1),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                      ),
                      child: Text(
                        'Login in',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.green),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://taimienphi.vn/tmp/cf/aut/anh-avatar-viet-nam-cute-ngau-tuyet-dep-1.jpg',
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              user.email,
                              style: TextStyle(
                                fontSize: 16,
                                color: const Color.fromARGB(255, 162, 162, 162),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
