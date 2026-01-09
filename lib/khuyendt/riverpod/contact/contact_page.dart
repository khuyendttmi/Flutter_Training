import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/khuyendt/riverpod/contact/contact_provider.dart';
import 'package:flutter_training/khuyendt/riverpod/contact/registeration_provider.dart';

class ContactPage extends ConsumerWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(contactProvider);
    final textController = ref.watch(registrationProvider);
    final contactNotifier = ref.read(contactProvider.notifier,); //Chỉ lấy giá trị hiện tại một lần, không lắng nghe

    final nameController = textController.name;
    final numberPhoneController = textController.phone;

    void showEditSheet({String? id, String? name, String? numberphone}) {
      nameController.text = name ?? '';
      numberPhoneController.text = numberphone ?? '';

      showModalBottomSheet(
        context: context,
        builder: (_) {
          return SizedBox(
            height: 250,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Tên liên hệ...',
                    ),
                  ),
                  TextField(
                    controller: numberPhoneController,
                    decoration: const InputDecoration(
                      hintText: 'Số điện thoại...',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (id == null) {
                        contactNotifier.add(
                          nameController.text,
                          numberPhoneController.text,
                        );
                      } else {
                        contactNotifier.update(
                          id,
                          nameController.text,
                          numberPhoneController.text,
                        );
                      }
                      Navigator.pop(context);
                    },
                    child: Text('Lưu'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Contact List')),
      body:
          contacts.isEmpty
              ? Center(child: Text('Chưa có liên hệ nào'))
              : ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];

                  return ListTile(
                    title: Text(
                      contact.name,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed:
                              () => showEditSheet(
                                id: contact.id,
                                name: contact.name,
                                numberphone: contact.numberPhone,
                              ),
                          icon: Icon(Icons.edit),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () => contactNotifier.remove(contact.id),
                          icon: Icon(Icons.delete, color: Colors.redAccent),
                        ),
                      ],
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showEditSheet(),
        child: Icon(Icons.add),
      ),
    );
  }
}
