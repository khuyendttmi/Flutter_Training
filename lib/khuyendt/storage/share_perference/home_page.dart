import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/khuyendt/storage/share_perference/sp_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPreferences = ref.watch(spProvider);
    final spNotifier = ref.read(spProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'SharedPreferences Demo',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Username: $sharedPreferences',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: spNotifier.add,
                  child: const Text('Save username'),
                ),
                ElevatedButton(
                  onPressed: spNotifier.loadData,
                  child: const Text('Load username'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

// class _HomePageState extends State<HomePage> {
//   String username = '';

// // lưu dữ liệu theo key-value (token, id, username)
//   Future<void> saveData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('username', 'anto');
//   }

//   Future<void> loadData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       username = prefs.getString('username') ?? 'Chưa có dữ liệu';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           'SharedPreferences Demo',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Username: $username',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(
//                   onPressed: saveData,
//                   child: const Text('Save username'),
//                 ),
//                 ElevatedButton(
//                   onPressed: loadData,
//                   child: const Text('Load username'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
