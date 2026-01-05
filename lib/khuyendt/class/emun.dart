// liệt kê các giá trị gender cố định
enum Gender{
  male, female, others 
}

// Thêm các phương thức riêng vào class có sẵn mà không cần kế thừa
extension GenderExtension on Gender {
  String get description {
    switch (this) {
      case Gender.male:
        return 'Mang quần tay áo trắng';
      case Gender.female:
        return 'Mang áo dài';
      case Gender.others:
        return 'Mang trang phục tự do';
    }
  }
}
