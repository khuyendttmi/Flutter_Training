class Math {
  int sum(a, b) {
    return a + b;
  }

  double core(a, b) {
    return a * b;
  }

  // Kiểm tra số nguyên tố
  bool checkPrime(int number) {
    if (number <= 0) return false;
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) return true;
    }

    return false;
  }

  final Map<int, String> _nobleGases = {
    2: 'Helium',
    10: 'Neon',
    18: 'Argon',
    36: 'Krypton',
    54: 'Xenon',
    86: 'Radon',
  };
  bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;

  List<String> toUpperCaseList(List<String> list) {
    return list.map((item) => item.toUpperCase()).toList();
  }

  // Tính fibonacci (Dynamic Programming)
  int fibonacciDP(int n) {
    if (n <= 1) return 1;

    final List<int> dp = List.filled(n + 1, 0);
    dp[0] = 0;
    dp[1] = 1;
    for (var i = 2; i <= n; i++) {
      dp[i] = dp[i - 1] + dp[i - 2];
    }

    return dp[n];
  }

  double average(List<int> numbers) {
    int total = 0;
    for (var element in numbers) {
      total += element;
    }

    return total / numbers.length;
  }

  //Named parameters
  printer(String email, {String? username, String? address}) {
    print('Email: $email');
    print('User name: $username');
    print('Address: $address');
  }

  //Optional positional parameters
  String quenstion(String ten, [String? caigi, String? odau]) {
    var result = ten;
    if (caigi == null || odau == null) {
      result = '$result hỏi $caigi ?';
    } else {
      result = '$result hỏi $caigi ở $odau ?';
    }

    return result;
  }

  void nestedFuction() {
    print('nestedFuction');
    void outNestedFunction() {
      print('outNestedFuction');
    }

    outNestedFunction();
  }

  void scope() {
    int square(int x) {
      return x * x;
    }

    var y = 0;
    void result() {
      y = square(10);
    }

    result();
    print('Scope result: $y');
  }
}

void main() {
  Math math = Math();
  var sum = math.sum(2, 3);
  print('Fuction1: Tính tổng $sum');

  var square = math.core(3.3, 2);
  print('Fuction2: Tích giá trị $square');

  int n = 10;
  var fibonaci = math.fibonacciDP(n);
  print('Function3: fibonaci $n là $fibonaci');

  var numbers = [1, 3, 4, 5];
  print(math.average(numbers));

  math.printer('Khuyen@gmail.com', username: 'KhuyenDT');

  print(math.quenstion('khuyen', 'minh', 'DN'));

  print(math.isNoble(30));

  var list = ['Khuyen', 'Dat', 'Tuan'];
  print(math.toUpperCaseList(list));

  //hàm định nghĩa trong 1 hàm khác
  math.nestedFuction();
  math.scope();
}
