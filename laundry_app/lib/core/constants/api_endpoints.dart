abstract final class ApiEndpoints {
  static const String basePrefix = '/api/v1';

  // Auth
  static const String googleLogin = '$basePrefix/auth/google';

  // Admin
  static const String listUsers = '$basePrefix/admin/users';
  static const String createUser = '$basePrefix/admin/users';
  static const String listHotels = '$basePrefix/admin/hotels';
  static const String createHotel = '$basePrefix/admin/hotels';
  static String updateUser(String userId) => '$basePrefix/admin/users/$userId';
  static String updateHotel(String hotelId) =>
      '$basePrefix/admin/hotels/$hotelId';
  static const String listMappings = '$basePrefix/admin/mappings';
  static const String createMapping = '$basePrefix/admin/mappings';

  // Me (authenticated user)
  static const String meProfile = '$basePrefix/me/profile';
  static const String meHotels = '$basePrefix/me/hotels';

  // Setup
  static String createDepartment(String hotelId) =>
      '$basePrefix/setup/hotels/$hotelId/departments';
  static const String listItems = '$basePrefix/setup/items';
  static const String createItem = '$basePrefix/setup/items';
  static String linkItemToDept(String deptId) =>
      '$basePrefix/setup/departments/$deptId/items';
  static String formSchema(String hotelId) =>
      '$basePrefix/setup/hotels/$hotelId/form-schema';

  // Challans
  static const String submitPickup = '$basePrefix/challans/pickup';
  static const String submitDelivery = '$basePrefix/challans/delivery';
  static String getChallan(String challanId) =>
      '$basePrefix/challans/$challanId';
  static String editChallan(String challanId) =>
      '$basePrefix/challans/$challanId';
  static String challanHistory(String hotelId) =>
      '$basePrefix/challans/hotel/$hotelId';
  static String pendingDeliveries(String hotelId) =>
      '$basePrefix/challans/hotel/$hotelId/pending-deliveries';
  static String uploadUrl(String challanId) =>
      '$basePrefix/challans/$challanId/upload-url';
  static String confirmUpload(String challanId) =>
      '$basePrefix/challans/$challanId/confirm-upload';

  // Tracking
  static String liveTracking(String hotelId) =>
      '$basePrefix/live-tracking/hotel/$hotelId';

  // Dashboard
  static const String superAdminDashboard =
      '$basePrefix/dashboards/super-admin';
  static String hotelAdminDashboard(String hotelId) =>
      '$basePrefix/dashboards/hotel-admin/$hotelId';

  // Quality
  static const String damageReport = '$basePrefix/quality-control/damages';

  // Billing
  static const String billing = '$basePrefix/reports/billing';

  // Health
  static const String health = '/health';
}
