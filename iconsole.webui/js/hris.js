function fnParseURL(url) {
    
    //parse jika ada PARC nya
    var x = url.split("?");
    var y = x[1];
    var requestParams = y.split("&");

    var i = 0;

    for (i = 0; i < requestParams.length; i++) {
        var requestParam = requestParams[i].split("=");

        if (requestParam[0].substr(0, 4) == 'parc') {
            var ctrl = requestParam[1];
            url = url.replace(requestParam[1], $get(ctrl).value);
        }
    }

    return url;
}

function fnShowDialog(url) {

    url = fnParseURL(url);
    
    $get('ifrpopup').src = url;
    $('#ModalPopup').modal('show');
}


function fnShowUpload(url) {

    url = fnParseURL(url);

    $get('ifrupload').src = url;
    $('#ModalUpload').modal('show');
}


function fnShowErrorNotif(errMsg, errTechMsg) {
    //$get('ErrorMsg').innerHTML = errMsg;
    $('#ErrorMsg').text(errMsg)
    $('#ErrorNotif').modal('show');

    if (errTechMsg != '') {
        $('#ErrorTechMsg').text(errTechMsg);
        $('#PanelTechMsg').show();
    }
}

function fnShowSuccessNotif(successMsg) {
    $('#SuccessMsg').text(successMsg);
    $('#SuccessNotif').modal('show');
}

function fnShowModalChangePassword() {
    $('#ModalChangePassword').modal('show');
}

function fnShowModalApproval() {
    $('#ModalRequestApproval').modal('show');
}

function fnShowGritter(titleString, textString) {

    $.extend(parent.$.gritter.options, {
        class_name: 'gritter-blue', // for light notifications (can be added directly to $.gritter.add too)
        position: 'top-right' // possibilities: bottom-left, bottom-right, top-left, top-right
        //fade_in_speed: 100, // how fast notifications fade in (string or int)
        //fade_out_speed: 100, // how fast the notices fade out
        //time: 3000 // hang on the screen for...
    });

    parent.$.gritter.add({
        // (string | mandatory) the heading of the notification
        title: titleString,
        // (string | mandatory) the text inside the notification
        text: textString,
        // (string | optional) the image to display on the left
        image: 'img/mail-avatar.jpg',
        // (bool | optional) if you want it to fade out on its own or just sit there
        sticky: false,
        // (int | optional) the time you want it to be alive for before fading out
        time: 2000
    });

    return false
}