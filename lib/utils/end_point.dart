class EndPoints {

 // static const baseUrl = 'http://10.88.232.221/env0804';
  static const baseUrl = 'https://appeal.harenvironment.gov.in';
  static const api = baseUrl + "/mobileapi";


  // static const baseUrl = 'http://10.88.240.7/';
  // static const api = baseUrl + "dev/";
  //--------------------------------- endpoints ---------------------------------
  static const getCauseList = '${api}/getcauselist';
  static const getFinalOrderList = '${api}/getfinalorderlist';
  static const getCaseStatus = '${api}/getcasestatus';
  static const getCaseDetail = '${api}/getcasedetail';

  static const getSingleApplication = '${api}record/getrecordbyid';


}

