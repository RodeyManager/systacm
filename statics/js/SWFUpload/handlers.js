function fileDialogStart() {
	//TODO
}
function fileQueued(file) {
    try {
        var progress = new FileProgress(file, this.customSettings.progressTarget);
        progress.setStatus("正在等待...");
        progress.toggleCancel(true, this);
    } catch (ex) {
        this.debug(ex);
    }

}

function fileQueueError(file, errorCode, message) {
	try {
		if (errorCode === SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED) {
            alert("您正在上传的文件过多。\n" + (message === 0 ? "您已达到上传限制" : "您最多能选择 " + (message > 1 ? "上传 " + message + " 个文件." : "1个文件.")));
            return;
        }

		switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                progress.setStatus("文件尺寸过大.");
                this.debug("错误代码: 文件尺寸过大, 文件名: " + file.name + ", 文件尺寸: " + file.size + ", 信息: " + message);
                break;
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                progress.setStatus("无法上传零字节文件.");
                this.debug("错误代码: 零字节文件, 文件名: " + file.name + ", 文件尺寸: " + file.size + ", 信息: " + message);
                break;
            case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
                progress.setStatus("不支持的文件类型.");
                this.debug("错误代码: 不支持的文件类型, 文件名: " + file.name + ", 文件尺寸: " + file.size + ", 信息: " + message);
                break;
            default:
                if (file !== null) {
                    progress.setStatus("未处理的错误");
                }
                this.debug("错误代码: " + errorCode + ", 文件名: " + file.name + ", 文件尺寸: " + file.size + ", 信息: " + message);
                break;
        }
	} catch (ex) {
		this.debug(ex);
	}

}

function fileDialogComplete(numFilesSelected, numFilesQueued) {
	try {
		if (this.getStats().files_queued > 0) {
			document.getElementById(this.customSettings.cancelButtonId).disabled = false;
		}
		this.startUpload();
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadStart(file) {
    try {
        var progress = new FileProgress(file, this.customSettings.progressTarget);
        progress.setStatus("正在上传...");
        progress.toggleCancel(true, this);
    }
    catch (ex) {}
	
    return true;
}

function uploadProgress(file, bytesLoaded) {

	try {
		var percent = Math.ceil((bytesLoaded / file.size) * 100);

		var progress = new FileProgress(file,  this.customSettings.upload_target);
		progress.setProgress(percent);
		progress.setStatus("正在上传中...");
		progress.toggleCancel(true, this);
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadSuccess(file, serverData) {
	$('#thumbnails').html('<img src="'+ base + '/' + serverData + '" width="300" \/>' );
	$('#banner').val(serverData);
}

function uploadComplete(file) {
	try {
		/*  I want the next upload to continue automatically so I'll call startUpload here */
		if (this.getStats().files_queued > 0) {
			this.startUpload();
		} else {
			var progress = new FileProgress(file,  this.customSettings.upload_target);
			progress.setComplete();
			progress.setStatus("所有文件上传成功.");
			progress.toggleCancel(false);
		}
	} catch (ex) {
		this.debug(ex);
	}
}

function uploadError(file, errorCode, message) {
    try {
        var progress = new FileProgress(file, this.customSettings.progressTarget);
        progress.setError();
        progress.toggleCancel(false);

        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
                progress.setStatus("上传错误: " + message);
                this.debug("错误代码: HTTP错误, 文件名: " + file.name + ", 信息: " + message);
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
                progress.setStatus("上传失败");
                this.debug("错误代码: 上传失败, 文件名: " + file.name + ", 文件尺寸: " + file.size + ", 信息: " + message);
                break;
            case SWFUpload.UPLOAD_ERROR.IO_ERROR:
                progress.setStatus("服务器 (IO) 错误");
                this.debug("错误代码: IO 错误, 文件名: " + file.name + ", 信息: " + message);
                break;
            case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
                progress.setStatus("安全错误");
                this.debug("错误代码: 安全错误, 文件名: " + file.name + ", 信息: " + message);
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
                progress.setStatus("超出上传限制.");
                this.debug("错误代码: 超出上传限制, 文件名: " + file.name + ", 文件尺寸: " + file.size + ", 信息: " + message);
                break;
            case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
                progress.setStatus("无法验证.  跳过上传.");
                this.debug("错误代码: 文件验证失败, 文件名: " + file.name + ", 文件尺寸: " + file.size + ", 信息: " + message);
                break;
            case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
                // If there aren't any files left (they were all cancelled) disable the cancel button
                if (this.getStats().files_queued === 0) {
                    document.getElementById(this.customSettings.cancelButtonId).disabled = true;
                }
                progress.setStatus("取消");
                progress.setCancelled();
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
                progress.setStatus("停止");
                break;
            default:
                progress.setStatus("未处理的错误: " + errorCode);
                this.debug("错误代码: " + errorCode + ", 文件名: " + file.name + ", 文件尺寸: " + file.size + ", 信息: " + message);
                break;
        }
    } catch (ex) {
        this.debug(ex);
    }
}


function addImage(src) {
	var newImg = document.createElement("img");
	newImg.style.margin = "5px";

	document.getElementById("thumbnails").appendChild(newImg);
	if (newImg.filters) {
		try {
			newImg.filters.item("DXImageTransform.Microsoft.Alpha").opacity = 0;
		} catch (e) {
			// If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
			newImg.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + 0 + ')';
		}
	} else {
		newImg.style.opacity = 0;
	}

	newImg.onload = function () {
		fadeIn(newImg, 0);
	};
	newImg.src = src;
}

function fadeIn(element, opacity) {
	var reduceOpacityBy = 5;
	var rate = 30;	// 15 fps


	if (opacity < 100) {
		opacity += reduceOpacityBy;
		if (opacity > 100) {
			opacity = 100;
		}

		if (element.filters) {
			try {
				element.filters.item("DXImageTransform.Microsoft.Alpha").opacity = opacity;
			} catch (e) {
				// If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
				element.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + opacity + ')';
			}
		} else {
			element.style.opacity = opacity / 100;
		}
	}

	if (opacity < 100) {
		setTimeout(function () {
			fadeIn(element, opacity);
		}, rate);
	}
}



/* ******************************************
 *	FileProgress Object
 *	Control object for displaying file info
 * ****************************************** */
/*
function FileProgress(file, targetID) {
	this.fileProgressID = "divFileProgress";

	this.fileProgressWrapper = document.getElementById(this.fileProgressID);
	if (!this.fileProgressWrapper) {
		this.fileProgressWrapper = document.createElement("div");
		this.fileProgressWrapper.className = "progressWrapper";
		this.fileProgressWrapper.id = this.fileProgressID;

		this.fileProgressElement = document.createElement("div");
		this.fileProgressElement.className = "progressContainer";

		var progressCancel = document.createElement("a");
		progressCancel.className = "progressCancel";
		progressCancel.href = "#";
		progressCancel.style.visibility = "hidden";
		progressCancel.appendChild(document.createTextNode(" "));

		var progressText = document.createElement("div");
		progressText.className = "progressName";
		progressText.appendChild(document.createTextNode(file.name));

		var progressBar = document.createElement("div");
		progressBar.className = "progressBarInProgress";

		var progressStatus = document.createElement("div");
		progressStatus.className = "progressBarStatus";
		progressStatus.innerHTML = "&nbsp;";

		this.fileProgressElement.appendChild(progressCancel);
		this.fileProgressElement.appendChild(progressText);
		this.fileProgressElement.appendChild(progressStatus);
		this.fileProgressElement.appendChild(progressBar);

		this.fileProgressWrapper.appendChild(this.fileProgressElement);

		document.getElementById(targetID).appendChild(this.fileProgressWrapper);
		fadeIn(this.fileProgressWrapper, 0);

	} else {
		this.fileProgressElement = this.fileProgressWrapper.firstChild;
		this.fileProgressElement.childNodes[1].firstChild.nodeValue = file.name;
	}

	this.height = this.fileProgressWrapper.offsetHeight;

}
FileProgress.prototype.setProgress = function (percentage) {
	this.fileProgressElement.className = "progressContainer green";
	this.fileProgressElement.childNodes[3].className = "progressBarInProgress";
	this.fileProgressElement.childNodes[3].style.width = percentage + "%";
};
FileProgress.prototype.setComplete = function () {
	this.fileProgressElement.className = "progressContainer blue";
	this.fileProgressElement.childNodes[3].className = "progressBarComplete";
	this.fileProgressElement.childNodes[3].style.width = "";

};
FileProgress.prototype.setError = function () {
	this.fileProgressElement.className = "progressContainer red";
	this.fileProgressElement.childNodes[3].className = "progressBarError";
	this.fileProgressElement.childNodes[3].style.width = "";

};
FileProgress.prototype.setCancelled = function () {
	this.fileProgressElement.className = "progressContainer";
	this.fileProgressElement.childNodes[3].className = "progressBarError";
	this.fileProgressElement.childNodes[3].style.width = "";

};
FileProgress.prototype.setStatus = function (status) {
	this.fileProgressElement.childNodes[2].innerHTML = status;
};

FileProgress.prototype.toggleCancel = function (show, swfuploadInstance) {
	this.fileProgressElement.childNodes[0].style.visibility = show ? "visible" : "hidden";
	if (swfuploadInstance) {
		var fileID = this.fileProgressID;
		this.fileProgressElement.childNodes[0].onclick = function () {
			swfuploadInstance.cancelUpload(fileID);
			return false;
		};
	}
};
*/
