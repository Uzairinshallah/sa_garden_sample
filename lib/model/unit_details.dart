// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

UnitDetails unitDetailsFromJson(String str) => UnitDetails.fromJson(json.decode(str));

String unitDetailsToJson(UnitDetails data) => json.encode(data.toJson());

class UnitDetails {
  Unit? unit;
  Owners? owners;
  List<Installment>? installments;
  List<Receipt>? receipts;
  List<dynamic>? discounts;
  Balance? balance;

  UnitDetails({
     this.unit,
     this.owners,
     this.installments,
     this.receipts,
     this.discounts,
     this.balance,
  });

  factory UnitDetails.fromJson(Map<String, dynamic> json) => UnitDetails(
    unit: (json["Unit"] != null) ? Unit.fromJson(json["Unit"]) : null,
    owners: (json["Owners"] != null) ? Owners.fromJson(json["Owners"]) : null,
    installments: (json["Installments"] != null) ? List<Installment>.from(json["Installments"].map((x) => Installment.fromJson(x))) : [],
    receipts: (json["Receipts"] != null) ?  List<Receipt>.from(json["Receipts"].map((x) => Receipt.fromJson(x))) : [],
    discounts: [],
    balance: (json["Balance"]!= null) ? Balance.fromJson(json["Balance"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "Unit": unit?.toJson(),
    "Owners": owners?.toJson(),
    "Installments": List<dynamic>.from(installments!.map((x) => x.toJson())),
    "Receipts": List<dynamic>.from(receipts!.map((x) => x.toJson())),
    "Discounts": List<dynamic>.from(discounts!.map((x) => x)),
    "Balance": balance?.toJson(),
  };
}

class Balance {
  int id;
  int balanceAmount;
  int filePlotId;
  String module;
  int receivedAmount;
  int totalAmount;
  int outstandingAmount;
  int realizedPayment;
  int nonRealizedPayment;
  int totalDiscounts;
  dynamic netOutstandingAmount;
  dynamic blockId;
  dynamic blockName;
  dynamic lastCalculatedAt;
  dynamic lastUpdatedByProcess;
  int installments;
  DateTime bookingDate;
  int paymentAmount;
  dynamic status;

  Balance({
    required this.id,
    required this.balanceAmount,
    required this.filePlotId,
    required this.module,
    required this.receivedAmount,
    required this.totalAmount,
    required this.outstandingAmount,
    required this.realizedPayment,
    required this.nonRealizedPayment,
    required this.totalDiscounts,
    required this.netOutstandingAmount,
    required this.blockId,
    required this.blockName,
    required this.lastCalculatedAt,
    required this.lastUpdatedByProcess,
    required this.installments,
    required this.bookingDate,
    required this.paymentAmount,
    required this.status,
  });

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
    id: json["Id"],
    balanceAmount: json["Balance_Amount"],
    filePlotId: json["File_Plot_Id"],
    module: json["Module"],
    receivedAmount: json["Received_Amount"],
    totalAmount: json["Total_Amount"],
    outstandingAmount: json["Outstanding_Amount"],
    realizedPayment: json["RealizedPayment"],
    nonRealizedPayment: json["NonRealizedPayment"],
    totalDiscounts: json["TotalDiscounts"],
    netOutstandingAmount: json["Net_OutstandingAmount"],
    blockId: json["Block_Id"],
    blockName: json["Block_Name"],
    lastCalculatedAt: json["LastCalculatedAt"],
    lastUpdatedByProcess: json["LastUpdatedByProcess"],
    installments: json["Installments"],
    bookingDate: DateTime.parse(json["Booking_Date"]),
    paymentAmount: json["Payment_Amount"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Balance_Amount": balanceAmount,
    "File_Plot_Id": filePlotId,
    "Module": module,
    "Received_Amount": receivedAmount,
    "Total_Amount": totalAmount,
    "Outstanding_Amount": outstandingAmount,
    "RealizedPayment": realizedPayment,
    "NonRealizedPayment": nonRealizedPayment,
    "TotalDiscounts": totalDiscounts,
    "Net_OutstandingAmount": netOutstandingAmount,
    "Block_Id": blockId,
    "Block_Name": blockName,
    "LastCalculatedAt": lastCalculatedAt,
    "LastUpdatedByProcess": lastUpdatedByProcess,
    "Installments": installments,
    "Booking_Date": bookingDate.toIso8601String(),
    "Payment_Amount": paymentAmount,
    "Status": status,
  };
}

class Installment {
  String installmentName;
  String installmentType;
  int amount;
  DateTime dueDate;
  String? status;

  Installment({
    required this.installmentName,
    required this.installmentType,
    required this.amount,
    required this.dueDate,
    required this.status,
  });

  factory Installment.fromJson(Map<String, dynamic> json) => Installment(
    installmentName: json["Installment_Name"],
    installmentType: json["Installment_Type"],
    amount: json["Amount"],
    dueDate: DateTime.parse(json["Due_Date"]),
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Installment_Name": installmentName,
    "Installment_Type": installmentType,
    "Amount": amount,
    "Due_Date": dueDate.toIso8601String(),
    "Status": status,
  };
}



class Owners {
  String? name;
  String? fatherHusband;
  String? postalAddress;
  String? residentialAddress;
  String? phoneOffice;
  String? residential;
  String? mobile1;
  String? mobile2;
  String? email;
  String? occupation;
  String? nationality;
  String? dateOfBirth;
  String? cnicNicop;
  String? nomineeName;
  String? nomineeRelation;
  String? nomineeAddress;
  String? nomineeCnicNicop;
  String? city;
  DateTime? dateTime;
  String? ownershipStatus;
  int? groupTag;

  Owners({
    this.name,
    this.fatherHusband,
    this.postalAddress,
    this.residentialAddress,
    this.phoneOffice,
    this.residential,
    this.mobile1,
    this.mobile2,
    this.email,
    this.occupation,
    this.nationality,
    this.dateOfBirth,
    this.cnicNicop,
    this.nomineeName,
    this.nomineeRelation,
    this.nomineeAddress,
    this.nomineeCnicNicop,
    this.city,
    this.dateTime,
    this.ownershipStatus,
    this.groupTag,
  });

  factory Owners.fromJson(Map<String, dynamic> json) => Owners(
    name: json["Name"] ?? "",
    fatherHusband: json["Father_Husband"] ?? "",
    postalAddress: json["Postal_Address"] ?? "",
    residentialAddress: json["Residential_Address"]?? "",
    phoneOffice: json["Phone_Office"]?? "",
    residential: json["Residential"]?? "",
    mobile1: json["Mobile_1"]?? "",
    mobile2: json["Mobile_2"]?? "",
    email: json["Email"]?? "",
    occupation: json["Occupation"]?? "",
    nationality: json["Nationality"]?? "",
    dateOfBirth: json["Date_Of_Birth"]?? "",
    cnicNicop: json["CNIC_NICOP"]?? "",
    nomineeName: json["Nominee_Name"]?? "",
    nomineeRelation: json["Nominee_Relation"]?? "",
    nomineeAddress: json["Nominee_Address"]?? "",
    nomineeCnicNicop: json["Nominee_CNIC_NICOP"]?? "",
    city: json["City"]?? "",
    dateTime: (json["DateTime"] != null) ? DateTime.parse(json["DateTime"]) :  DateTime.now(),
    ownershipStatus: json["Ownership_Status"]?? "",
    groupTag: json["Group_Tag"]?? 0,
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Father_Husband": fatherHusband,
    "Postal_Address": postalAddress,
    "Residential_Address": residentialAddress,
    "Phone_Office": phoneOffice,
    "Residential": residential,
    "Mobile_1": mobile1,
    "Mobile_2": mobile2,
    "Email": email,
    "Occupation": occupation,
    "Nationality": nationality,
    "Date_Of_Birth": dateOfBirth,
    "CNIC_NICOP": cnicNicop,
    "Nominee_Name": nomineeName,
    "Nominee_Relation": nomineeRelation,
    "Nominee_Address": nomineeAddress,
    "Nominee_CNIC_NICOP": nomineeCnicNicop,
    "City": city,
    "DateTime": dateTime?.toIso8601String(),
    "Ownership_Status": ownershipStatus,
    "Group_Tag": groupTag,
  };
}
//
// enum Father {
//   SHEIKH_KAUSAR_AMIN
// }

// final fatherValues = EnumValues({
//   "Sheikh Kausar Amin": Father.SHEIKH_KAUSAR_AMIN
// });
//
// enum Mobile1 {
//   MOBILE_103454181876,
//   THE_03454181876
// }
//
// final mobile1Values = EnumValues({
//   "0345-4181876": Mobile1.MOBILE_103454181876,
//   "03454181876": Mobile1.THE_03454181876
// });
//
// enum Name {
//   SARMAD_AMIN
// }
//
// final nameValues = EnumValues({
//   "Sarmad Amin": Name.SARMAD_AMIN
// });

class Receipt {
  int id;
  String? name;
  String? fatherName;
  String? contact;
  int tokenParameter;
  int amount;
  String? bank;
  dynamic chPayDraftDate;
  String? chPayDraftNo;
  DateTime dateTime;
  String? paymentType;
  String receiptNo;
  bool? verified;
  String? type;
  dynamic cancel;
  dynamic status;
  dynamic dispute;
  int userid;

  Receipt({
    required this.id,
    required this.name,
    required this.fatherName,
    required this.contact,
    required this.tokenParameter,
    required this.amount,
    required this.bank,
    required this.chPayDraftDate,
    required this.chPayDraftNo,
    required this.dateTime,
    required this.paymentType,
    required this.receiptNo,
    required this.verified,
    required this.type,
    required this.cancel,
    required this.status,
    required this.dispute,
    required this.userid,
  });

  factory Receipt.fromJson(Map<String, dynamic> json) => Receipt(
    id: json["Id"],
    name: json["Name"],
    fatherName: json["Father_Name"],
    contact: json["Contact"],
    tokenParameter: json["TokenParameter"],
    amount: json["Amount"],
    bank: json["Bank"],
    chPayDraftDate: json["Ch_Pay_Draft_Date"],
    chPayDraftNo: json["Ch_Pay_Draft_No"],
    dateTime:  DateTime.parse(json["DateTime"]),
    paymentType: json["PaymentType"],
    receiptNo: json["ReceiptNo"],
    verified: json["Verified"],
    type: json["Type"],
    cancel: json["Cancel"],
    status: json["Status"],
    dispute: json["Dispute"],
    userid: json["Userid"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Father_Name": fatherName,
    "Contact": contact,
    "TokenParameter": tokenParameter,
    "Amount": amount,
    "Bank": bank,
    "Ch_Pay_Draft_Date": chPayDraftDate,
    "Ch_Pay_Draft_No": chPayDraftNo,
    "DateTime": dateTime.toIso8601String(),
    "PaymentType": paymentType,
    "ReceiptNo": receiptNo,
    "Verified": verified,
    "Type": type,
    "Cancel": cancel,
    "Status": status,
    "Dispute": dispute,
    "Userid": userid,
  };
}

// enum Bank {
//   DUBAI_ISLAMIC_BANK,
//   HABIB_BANK
// }
//
// final bankValues = EnumValues({
//   "Dubai Islamic Bank": Bank.DUBAI_ISLAMIC_BANK,
//   "Habib Bank": Bank.HABIB_BANK
// });
//
// enum PaymentType {
//   CASH,
//   ONLINE_CASH
// }
//
// final paymentTypeValues = EnumValues({
//   "Cash": PaymentType.CASH,
//   "Online_Cash": PaymentType.ONLINE_CASH
// });
//
// enum Type {
//   BOOKING,
//   INSTALLMENT,
//   TRANSFER
// }
//
// final typeValues = EnumValues({
//   "Booking": Type.BOOKING,
//   "Installment": Type.INSTALLMENT,
//   "Transfer": Type.TRANSFER
// });

class Unit {
  int unitId;
  String unitNo;
  String block;
  String type;
  String size;
  dynamic developmentCharges;
  dynamic project;

  Unit({
    required this.unitId,
    required this.unitNo,
    required this.block,
    required this.type,
    required this.size,
    required this.developmentCharges,
    required this.project,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
    unitId: json["Unit_Id"],
    unitNo: json["Unit_No"],
    block: json["Block"],
    type: json["Type"],
    size: json["Size"],
    developmentCharges: json["Development_Charges"],
    project: json["Project"],
  );

  Map<String, dynamic> toJson() => {
    "Unit_Id": unitId,
    "Unit_No": unitNo,
    "Block": block,
    "Type": type,
    "Size": size,
    "Development_Charges": developmentCharges,
    "Project": project,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
