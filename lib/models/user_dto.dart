class UserDto {
  final int id;
  final String login;
  final String password;
  final String name;
  final String email;

  const UserDto(
    this.id,
    this.login,
    this.password,
    this.name,
    this.email,
  );

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      json["id"],
      json["login"],
      json["password"],
      json["name"],
      json["email"],
    );
  }
}
