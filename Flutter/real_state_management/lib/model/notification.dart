class Notifications{
  int? notificationId;
  int? propertyId;
  int? tenantId;
  String? notificationStatus;
  int? landloardId;

  Notifications(
      {required this.notificationId,
        required this.propertyId,
        required this.tenantId,
        required this.notificationStatus,
        required this.landloardId,
        });
  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
      notificationId: json['notificationId'],
      propertyId: json['propertyId'],
      tenantId: json['tenantId'],
      notificationStatus: json['notificationStatus'],
      landloardId: json['landloardId'],
      );
  Map<String, dynamic> toJson() {
    return {
      "notificationId": notificationId,
      "propertyId": propertyId,
      "tenantId": tenantId,
      "notificationStatus": notificationStatus,
      "landloardId": landloardId,
    };
  }
}