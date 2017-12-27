/**
 * Created by MacBookPro on 2017/9/13.
 */
var exec = require('cordova/exec');

/**
 *	调用原生Epub插件读取epub文件
 *	param success: 成功回调
 *	param failed: 失败回调
 *	param filePath: 本地文件路径
 *  param uid:用户ID
 *  param fileId:文件ID
 *	param title:文件标题
 */
var Epub = {
    open: function (succcess,failed, args) {
        exec(succcess, failed, "CDEpub", "readEpub", args);
    }
};

module.exports = Epub;
