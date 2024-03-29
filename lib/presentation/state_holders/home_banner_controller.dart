import 'package:get/get.dart';

import '../../data/data_utility/urls.dart';
import '../../data/models/banner_list_model.dart';
import '../../data/services/network_caller.dart';

class HomeBannerController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  BannerListModel _bannerListModel = BannerListModel();

  BannerListModel get bannerListModel => _bannerListModel;

  Future<bool> getBannerList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller()
        .getRequest(Urls.homeBanner);
    _inProgress = false;
    if (response.isSuccess) {
      _bannerListModel = BannerListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}