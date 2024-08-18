import '../helpers/F.dart';
import '../helpers/api_helper.dart';
import '../models/result.dart';
import '../ui/shared/loading_mee.dart';

class CDNService {
  // Upload image (photo, picture, etc) to Server CDN
  // Result success => String | link url
  Future uploadImage({
    required String filePath,
    String? folder,
    String? subFolder,
    String? filename,
  }) async {
    LoadingMee.show();
    Result result = await apiHelper.callAPICDN(
      filePath: filePath,
      params: {
        'folder': folder,
        'sub_folder': subFolder,
        'filename': filename, // without extension
      },
    );
    LoadingMee.dismiss();

    if (result.status) {
      return Result.success(message: result.message, data: result.data);
    } else {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await uploadImage(
          filePath: filePath,
          folder: folder,
          subFolder: subFolder,
          filename: filename,
        );
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }
  }
}
