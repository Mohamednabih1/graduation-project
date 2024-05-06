// ignore_for_file: constant_identifier_names

class AppStrings {
  static const loading = "Loading";
  static const ok = "Ok";
  static const retryAgain = "Retry again";
  static const success = "Success";
  static const FieldCanNotBeEmpty = "Field can't be empty";

  //    LoginPage Strings
  static const usernameHintText = "username";
  static const passwordHintText = "password";
  static const loginButtonTitle = "Login";
  static const logout = "Logout";

  //    checkUserPinCode Strings
  static const checkUserPinCodeDialogTitle =
      "Admins only can access settings, please enter admin Pin Code first";
  static const checkUserPinCodeHintText = "Enter Pin Code";
  static const checkUserPinCodeButtonText = "Done";
  static const checkUserPinCodeErrorDialogTitle = "Pin code error";
  static const checkUserPinCodeErrorDialogContent =
      "Please enter a valid pin code";

  // error handler
  static const badRequestError = "Bad request. try again later";
  static const noContent = "Success with not content";
  static const forbiddenError = "Forbidden request. try again later";
  static const unauthorizedError =
      "The username or password you entered is invalid. Please check your credentials and try again.";
  static const notFoundError = "URL not found, try again later";
  static const conflictError = "Conflict found, try again later";
  static const internalServerError = "Some thing went wrong, try again later";
  static const unknownError = "Some thing went wrong, try again later";
  static const timeoutError = "Time out, Please try again later.";
  static const defaultError = "Some thing went wrong, try again later";
  static const serverNotFound =
      "Server not found, Please check server URL or change the Wi-Fi connection to the server network or get contact with IT team.";
  static const cacheError = "Cache error, try again later";
  static const noInternetError = "Please check your internet connection";
  static const badGateway = "Connection error, Please try again later";
  static const SSLCertificateError =
      "Bad Certificate Error, Please get in contact with the IT team";
  static const wifiAndMobileDataAreOff = "Please turn on your Wi-Fi.";
  static const sendTokenError =
      "You will not receive notifications please logout and login again";
  static const cannotReachToTheServer =
      "Server not found, Please check server URL or change the Wi-Fi connection to the server network or get contact with IT team.";
  static const patientNotFound = "Patient not found";
  static const deviceNotFound = "Device not found";
  static const serverSendError = "failed to connect to server(serverSendError)";

  // Patient List Screen String
  static const allPatient = "All";
  static const assignedPatient = "Assigned";
  static const unAssignedPatient = "Unassigned";
  static const onlinePatient = "Online";
  static const offlinePatient = "Offline";
  static const toBeAssignedPatients = "To be Assigned";
  static const hospitalNumber = "Hospital Number";
  static const NA = "N/A";
  static const name = "Name";
  static const search = "Search";
  static const noPatientsFound = "No Patients Found";
  static const notAssignedToAnyDevice = "Not assigned to any device";
  static const seenButton = "Seen";

  // Patient Info screen String
  // static const seenButton = "Seen";
  static const dateOfBirth = "Date of Birth";
  static const age = "Age";
  static const gender = "Gender";
  static const bedSpace = "Bedspace";
  static const liveMonitor = "Live Monitor";
  static const unassign = "Unassign";
  static const nurseAlarms = "Nurse Alarms";
  static const myAlarmSettings = "My Alarm Settings";

  // Device screen String
  static const allDevice = "All Device";
  static const filter = "Filter";
  static const noDevicesFound = "No Devices Found";
  static const assignedDevices = "Assigned Devices";
  static const unassignedDevices = "Unassigned Devices";
  static const EcgDevices = "Ecg Devices";
  static const NonineDevices = "Nonine Devices";
  static const nonine = "Nonine";
  static const ECGDeviceDetails = "ECG Device Details";
  static const noninDeviceDetails = "Nonin Device Details";
  static const macAddress = "MAC Address";
  static const toBeAssignedTo = "To be assigned to";
  static const ecgSerial = "ECG serial";
  static const serialNumber = "Serial Number";
  static const assignedTo = "Assigned to";
  static const assign = "Assign";

  // Staff screen String
  static const allStaff = "All Staff";
  static const doctors = "Doctors";
  static const nurses = "Nurses";
  static const admins = "Admins";
  static const noStaffFound = "No Staff Found";
  static const male = "Male";
  static const female = "Female";
  static const other = "Other";

  // Register screen String
  static const registerNewUser = "Register new user";
  static const registerNewPatient = "Register new patient";
  static const register = "Register";
  static const userName = "Username";
  static const password = "Password";
  static const confirmPassword = "Confirm Password";
  static const firstName = "FirstName";
  static const lastName = "LastName";
  static const height = "Height";
  static const weight = "Weight";
  static const birthDate = "BirthDate";
  static const passwordsNotMatched = "Passwords do not match.";
  static const invalidDateOfBirth = "Invalid date of birth";
  static const patientIsLessThan13Years = "Patient is less than 13 years old";

  static const scanPatientWrestBandQrCode =
      "Please scan the patient’s wristband";
  static const scanEcgQrCode = "Please scan the ECG’s QR code";
  static const scanNonineQrCode = "Please scan the Nonine’s QR code";
  static const finalAssignDetails = "Assign details";
  static const finalAccessPointsDetails = "Access points details";
  static const apply = "Apply";
  static const add = "Add";
  static const next = "Next";
  static const reassign = "Reassign";
  static const scan = "Scan";
  static const zebraScan = "Zebra Scanner";
  static const patientInfo = "Patient's Info";
  static const macAddressIsNotCompatible = "MAC Address is not compatible";

  // add Access points screen
  static const scanWifiAccessPoint = "Scan Wi-Fi access point";
  static const addAccessPoint = "Add Access Point";
  static const accessPointsList = "Access Point(s) List";

  static const otaMode = "OTA Mode";
  static const setAccessPoint = "Set Access Point";
  static const bluetoothStreaming = "Bluetooth Streaming";
  static const deviceAlreadyThere = "Device already there";
  static const noRemainingDevices = "No remaining devices";
  static const noAccessPointAdded = "No Access Point Added";
  static const error = "Error";
  static const home = "Home";

  static const respond = "Respond";
  static const respondAll = "Respond all";
  static const seenAll = "Seen all";
  static const refrain = "Refrain";
  static const refrainAll = "Refrain all";
}
