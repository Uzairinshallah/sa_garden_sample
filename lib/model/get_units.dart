class GetUnits {
  int? unitId;
  String? unitNo;
  String? plotSize;
  String? type;
  String? block;
  String? status;
  String? project;
  String? name;
  String? fatherHusband;
  String? postalAddress;
  String? mobile1;
  String? cNICNICOP;
  String? dateTime;
  String? email;
  String? city;
  String? module;

  GetUnits(
      {this.unitId,
        this.unitNo,
        this.plotSize,
        this.type,
        this.block,
        this.status,
        this.project,
        this.name,
        this.fatherHusband,
        this.postalAddress,
        this.mobile1,
        this.cNICNICOP,
        this.dateTime,
        this.email,
        this.city,
        this.module});

  GetUnits.fromJson(Map<String, dynamic> json) {
    unitId = json['Unit_Id'];
    unitNo = json['Unit_No'];
    plotSize = json['Plot_Size'];
    type = json['Type'];
    block = json['Block'];
    status = json['Status'];
    project = json['Project'];
    name = json['Name'];
    fatherHusband = json['Father_Husband'];
    postalAddress = json['Postal_Address'];
    mobile1 = json['Mobile_1'];
    cNICNICOP = json['CNIC_NICOP'];
    dateTime = json['DateTime'];
    email = json['Email'];
    city = json['City'];
    module = json['Module'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Unit_Id'] = unitId;
    data['Unit_No'] = unitNo;
    data['Plot_Size'] = plotSize;
    data['Type'] = type;
    data['Block'] = block;
    data['Status'] = status;
    data['Project'] = project;
    data['Name'] = name;
    data['Father_Husband'] = fatherHusband;
    data['Postal_Address'] = postalAddress;
    data['Mobile_1'] = mobile1;
    data['CNIC_NICOP'] = cNICNICOP;
    data['DateTime'] = dateTime;
    data['Email'] = email;
    data['City'] = city;
    data['Module'] = module;
    return data;
  }
}
