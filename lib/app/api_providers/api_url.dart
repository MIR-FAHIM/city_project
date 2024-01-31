class ApiUrl {
  String api_token = '';
  static String googleMapApiKey = '';
  // static String baseUrl = 'http://18.217.130.75/api/v1';
  static String baseUrl = 'https://new.jayga.io/api';
  static String uploadUserImage = ' https://new.jayga.io/api/update/user/avatar';

  static String login = '$baseUrl/signin';
  static String register = '$baseUrl/register';
  static String filterListing = baseUrl;
  static String addListing = '$baseUrl/add/listing';
  static String deleteDisableDate = '$baseUrl/del/availability';
  static String updateListing = '$baseUrl/update/listing';
  static String changeBookingStatus = '$baseUrl/change/booking-status';
  static String changeListingActiveStatus = '$baseUrl/change/listing/status';
  static String getBooking = '$baseUrl/booking/lister';
  static String getListerProfileListing = '$baseUrl/profile/listings/';
  static String addListingImage = '$baseUrl/add/listing-images';
  static String addUserImage = '$baseUrl/update/user/avatar';
  static String getCoverImage = '$baseUrl/user/get-cover/';
  static String getUserImage = '$baseUrl/user/avatars/';
  static String addCoverPhoto = '$baseUrl/user/set-cover';

  static String addListingNIDImage = '$baseUrl/listing-nid/upload';
  static String deleteListingImage = '$baseUrl/listing/image/delete/';
//https://new.jayga.io/api/listing/image/delete/10
  static String getReview = '$baseUrl/add/listing-images';
  static String updateProfile = '$baseUrl/user/edit';
  static String addDisableDate = '$baseUrl/add/availability';
  static String addReview = '$baseUrl/create/review';
  //fav

  static String getNotification = '$baseUrl/show/notifications/';
  static String addFav = '$baseUrl/add/fav/listing';
  static String getFav = '$baseUrl/fav/listings/';
  static String removeFav = '$baseUrl/fav/listing/remove/';
  static String paymentSTatusChanged = '$baseUrl/payment/update';
  static String addBooking = '$baseUrl/add/booking';

  static String getProfile = '$baseUrl/user/';
  static String getDisableDates = '$baseUrl/show/availability/';
  static String getListingImages = '$baseUrl/listing/images/';
  static String paymentCheck = '$baseUrl/payment/update';


// static String login = '$baseUrl/login';
// static String login = '$baseUrl/login';
// static String login = '$baseUrl/login';




// end copy from fisera.....
}