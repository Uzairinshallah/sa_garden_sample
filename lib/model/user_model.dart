class UserModel {
  final int id;
  final String name;
  final String fatherOrHusband;
  final String email;
  final String phone;
  final String cnic;
  final String password;
  final String dateTime;
  final String token;
  final String expiryDate;
  final int? fileId;
  final int? fileFormNo;
  final int plotId;
  final String plotNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.fatherOrHusband,
    required this.email,
    required this.phone,
    required this.cnic,
    required this.password,
    required this.dateTime,
    required this.token,
    required this.expiryDate,
    required this.fileId,
    required this.fileFormNo,
    required this.plotId,
    required this.plotNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['ID'],
      name: json['Name'],
      fatherOrHusband: json['Father_Husband'],
      email: json['Email'],
      phone: json['Phone'],
      cnic: json['CNIC'],
      password: json['Password'],
      dateTime: json['DateTime'],
      token: json['Token'],
      expiryDate: json['Expiry_Date'],
      fileId: json['FileId'],
      fileFormNo: json['FileFormNo'],
      plotId: json['PlotId'],
      plotNumber: json['Plot_Number'],
    );
  }
}
