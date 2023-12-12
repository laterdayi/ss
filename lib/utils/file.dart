part of 'index.dart';

class UtilFile {
  // 打开文件
  static Future<OpenResult> openFile(String path) async {
    try {
      OpenResult res = await OpenFilex.open(path);
      String suffixName = getFileSuffix(path) ?? '';
      switch (res.type) {
        case ResultType.noAppToOpen:
          CustomToast.showNotificationError(title: 'openFileNoAppToOpen'.trParams({'val': suffixName}));
          return res;
        case ResultType.fileNotFound:
          CustomToast.showNotificationError(title: 'openFileFileNotFound'.tr);
          return res;
        case ResultType.permissionDenied:
          CustomToast.showNotificationError(title: 'openFilePermissionDenied'.trParams({'val': suffixName}));
          return res;
        case ResultType.error:
          CustomToast.showNotificationError(title: 'openFileError'..trParams({'val': suffixName}));
          return res;
        case ResultType.done:
          return res;
        default:
          return res;
      }
    } catch (e) {
      UtilLog.error('打开文件', e);
      return OpenResult(type: ResultType.error);
    }
  }

  // 获取文件后缀名
  static String? getFileSuffix(String fileName) {
    int index = fileName.lastIndexOf('.');
    return index == -1 ? null : fileName.substring(index + 1);
  }

  // 格式化大小
  static String normalizeFileSize(double value) {
    List<String> unitArr = ['B', 'K', 'M', 'G'];
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(1);
    return size + unitArr[index];
  }

  // 获取临时文件路径
  static Future getTempFileDirectory(TemporaryDirectoryType type, String fileName) async {
    try {
      String path = (await getTemporaryDirectory()).path;
      String result = path;
      switch (type) {
        case TemporaryDirectoryType.av:
          result += '/av';
          break;
        case TemporaryDirectoryType.img:
          result += '/img';
          break;
        case TemporaryDirectoryType.file:
          result += '/file';
          break;
      }
      return '$result/${fileName.replaceAll('/', '_')}';
    } catch (e) {
      UtilLog.error('获取临时下载路径', e);
    }
  }

  // 获取存储大小
  static Future<double> getStorageSize(FileSystemEntity file) async {
    try {
      if (file is File) {
        int length = await file.length();
        return length.toDouble();
      }
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        double total = 0;
        for (final FileSystemEntity child in children) {
          total += await getStorageSize(child);
        }
        return total;
      }
      return 0;
    } catch (e) {
      return 0;
    }
  }

  // 清理存储
  static Future clearStorage(FileSystemEntity file) async {
    try {
      if (file is File) {
        await file.delete();
      }
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        for (final FileSystemEntity child in children) {
          await clearStorage(child);
        }
      }
    } catch (e) {
      UtilLog.error('清理存储', e);
    }
  }

  // 打开文档
  static Future<void> openDocument({
    required BuildContext context,
    required String fileType,
    required String fileName,
    required String fileUrl,
  }) async {
    try {
      CustomToast.showLoading();
      final types = {
        "img": TemporaryDirectoryType.img,
        'video': TemporaryDirectoryType.av,
        'pdf': TemporaryDirectoryType.file,
        'svg': TemporaryDirectoryType.img,
        'document': TemporaryDirectoryType.file,
      };
      String path = await UtilFile.getTempFileDirectory(types[fileType] ?? TemporaryDirectoryType.file, fileName);
      FileDownloader fileDownloader = FileDownloader();
      Response res = await fileDownloader.download(fileUrl, path);
      if (res.statusCode == 200) UtilFile.openFile(path);
    } catch (e) {
      UtilLog.error('打开文档', e);
    } finally {
      CustomToast.closeAllLoading();
    }
  }

  // 获取文件类型
  static FileType getFileType({required String fileName}) {
    FileType fileType = FileType();
    Map<List<String>, Map<String, dynamic>> handlers = {
      ['jpg', 'png', 'jpeg', 'gif']: {"type": 'img', "icon": Icons.image_outlined},
      ['mp4']: {"type": 'video', "icon": Icons.movie_outlined},
      ['pdf']: {"type": 'pdf', "icon": Icons.picture_as_pdf_outlined},
      ['svg']: {"type": 'svg', "icon": Icons.image_outlined},
      ['docx', 'xlsx', 'pptx']: {"type": 'document', "icon": Icons.description_outlined},
    };
    for (List<String> key in handlers.keys) {
      if (key.contains(getFileSuffix(fileName))) {
        fileType.type = handlers[key]?['type'];
        fileType.icon = handlers[key]?['icon'];
      }
    }
    return fileType;
  }
}
