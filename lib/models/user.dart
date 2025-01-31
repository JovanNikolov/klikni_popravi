class User{
  final String email;
  final String password;
  final String name;
  final String role;

  User(this.name, {required this.email, required this.password, required this.role});
}
