function VIKKI_CloseWindow(retValue) {
    window.open('', '_self', '');

    window.returnValue = retValue;
    //window.opener = self;
    window.close();
}

function VIKKI_ChangeLanguage(VIKKI_Lang) {
    VIKKI_SetCookie('YOURTRAVEL_LV_UKR_LNG', VIKKI_Lang);
}

function VIKKI_SetCookie(cookieName, cookieValue) {
    document.cookie = cookieName + "=" + escape(cookieValue) + ";";
}

function VIKKI_SetExpiresCookie(cookieName, cookieValue, dateExpires) {
    document.cookie = cookieName + "=" + escape(cookieValue) + "; expires=" + dateExpires.toGMTString();
}

function VIKKI_GetCookie(cookieName) {
    var aCookie = document.cookie.split("; ");
    for (var i = 0; i < aCookie.length; i++) {
        var aCrumb = aCookie[i].split("=");
        if (cookieName == aCrumb[0])
            return unescape(aCrumb[1]);
    }
    return null;
}

function VIKKI_DeleteCookie(cookieName) {
    document.cookie = cookieName + "=; expires=Fri, 31 Dec 1999 23:59:59 GMT;";
}

function VIKKI_RedirectToLoginPage() {
    VIKKI_DeleteCookie('VS_FX_LVID');
    window.location.replace("Default.aspx");
}


function VIKKI_MenuItemIsNotSubMenu(cell) {
    if (cell.innerHTML.indexOf("leftMenuLinkHeader") > 0) {
        return true;
    }
    return false;
}

function VIKKI_HideLeftMenuItem(itemId, leftMenuTableClientID) {
    var leftMenuTable = document.getElementById(leftMenuTableClientID);
    var isMenuItem = false;
    for (var i = 0; i < leftMenuTable.rows.length; i++) {
        if (isMenuItem) {
            if (VIKKI_MenuItemIsNotSubMenu(leftMenuTable.rows[i].cells[0])) {
                return false;
            }
            else {
                if (leftMenuTable.rows[i].style.visibility == "hidden") {
                    leftMenuTable.rows[i].style.visibility = "inherit";
                    leftMenuTable.rows[i].style.display = "block";
                    SetCookie(itemId + "Visible", "true");
                }
                else {
                    leftMenuTable.rows[i].style.visibility = "hidden";
                    leftMenuTable.rows[i].style.display = "none";
                    SetCookie(itemId + "Visible", "false");
                }
            }
        }
        if (leftMenuTable.rows[i].id.indexOf(itemId) != -1) {
            isMenuItem = true;
        }
    }
    return false;
}

function VIKKI_ControlIsHiddenByID(ControlClientID) 
{
    return VIKKI_ControlIsHidden(control);
}

function VIKKI_ControlIsHidden(control) 
{
    if (control != null) {
        if (control.style.visibility == "hidden" || control.style.display == "none") {
            return true;
        }
    }
    return false;
}

function VIKKI_ClickLeftMenuItem(itemId, leftMenuTableClientID) {
    if (GetCookie(itemId + "Visible") == null || GetCookie(itemId + "Visible") == "false") {
        VIKKI_HideLeftMenuItem(itemId, leftMenuTableClientID);
    }
}

function VIKKI_SetControlFocus(ControlClientID) {
    var control = document.getElementById(ControlClientID);
    if (!window.closed && control != null) {
        if (control.tagName == 'INPUT') {
            if (control.type == 'text' && control.disabled) {
                return;
            }
        }
        control.focus();
    }
}

function VIKKI_HideControlByClientID(ControlClientID, hide) {
    var ControlObject = document.getElementById(ControlClientID);
    VIKKI_HideControl(ControlObject, hide);
}

function VIKKI_HideControl(ControlObject, hide) {
    if (ControlObject != null) {

        if (hide) {
            ControlObject.style.visibility = "hidden";
            ControlObject.style.display = "none";
        }
        else {
            ControlObject.style.visibility = "inherit";
            ControlObject.style.display = "";
        }
    }
}

function VIKKI_LoadModalDialog() {
    if (typeof (VIKKI_OnLoadModalDialog) == "function") {
        VIKKI_OnLoadModalDialog();
    }
}

function VIKKI_GetRadWindow() {
    var oWindow = null;
    if (window.radWindow) oWindow = window.radWindow;
    else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
    return oWindow;
}

function VIKKI_CloseRADWindow() {
    var oWnd = VIKKI_GetRadWindow();
    oWnd.close();
}

function VIKKI_SetInputValue(InputClientID, InputValue) {
    var inputControl = document.getElementById(InputClientID);
    inputControl.value = InputValue;
}

function VIKKI_DeletePhoto(imgPhotoClientID, hdPhotoNameDeletedClientID, imgDeleteClientID) {
    var PhotoImage = document.getElementById(imgPhotoClientID);
    var PhotoPath = PhotoImage.src.substring(0, PhotoImage.src.lastIndexOf('/'));
    PhotoImage.src = PhotoPath + "/nophoto.jpg"
    VIKKI_SetInputValue(hdPhotoNameDeletedClientID, '1');
    VIKKI_HideControlByClientID(imgDeleteClientID, true);
    return false;
}

function VIKKI_GetCurrentElementOrTarget(e) {
    if (e == null) {
        var e = window.event;
    }

    if (e.srcElement != null) {
        return e.srcElement;
    }

    if (e.target != null) {
        return e.target;
    }
    return e;
}

function VIKKI_LoadDefaultPage() {
    if (typeof (VIKKI_OnLoadDefaultPage) == "function") {
        VIKKI_OnLoadDefaultPage();
    }
}

function VIKKI_TrimString(stringObj) {
    var re = /\s/g;
    var strTemp = stringObj.replace(re, "");
    return strTemp;
}

function VIKKI_HideGridColumn(tableObject, columnNumber, hide)
{
    if(tableObject != null)
    {
        for(var i = 0; i < tableObject.rows.length; i++)
        {
            if(columnNumber < tableObject.rows[i].cells.length)
            {
                if(hide)
                {
                    tableObject.rows[i].cells[columnNumber].style.visibility="hidden"; 
		    	    tableObject.rows[i].cells[columnNumber].style.display="none";
                }
                else
                {
                    tableObject.rows[i].cells[columnNumber].style.visibility="inherit"; 
		    	    tableObject.rows[i].cells[columnNumber].style.display="";
		    	}
		 }
        }
    }
}

function VIKKI_ClickButtonByClientID(buttonClientID) {
    var buttonControl = document.getElementById(buttonClientID);
    if (buttonControl != null) {
        buttonControl.click();
    }
}

function VIIKILanguageChanged(sender, eventArgs) {
    var selectedItem = eventArgs.get_item();
    switch (selectedItem.get_text()) {
        case "UA":
            VIKKI_ChangeLanguage('uk-UA');
            break;
        case "ENG":
            VIKKI_ChangeLanguage('en-US');
            break;
        case "RU":
            VIKKI_ChangeLanguage('ru-RU');
            break;
    }
}

function VIKKI_GetDDL(ctrl, id) {
    var selects = ctrl.getElementsByTagName("select");
    for (var i = 0; i < selects.length; i++) {
        if (selects[i].id.indexOf(id) != -1) {
            return selects[i];
        }
    }
    return null;
}

function VIKKI_RoomsChange(e) {
    var control = VIKKI_GetCurrentElementOrTarget(e);
    var countRooms = parseInt(control.options[control.selectedIndex].text);
    var tableRooms = control.parentNode.parentNode.parentNode.parentNode;
    countRooms = countRooms * 3;
    for (var i = 1; i < tableRooms.rows.length; i = i + 3) {
        var hide = true;
        if (i <= countRooms) {
            hide = false;
        }
        VIKKI_HideControl(tableRooms.rows[i], hide);
        var ChildrenDDL = VIKKI_GetDDL(tableRooms.rows[i].cells[3], "ddlChildren");
        var hideChildrenAge = true;
        if (parseInt(ChildrenDDL.options[ChildrenDDL.selectedIndex].text) > 0 && i <= countRooms) {
            hideChildrenAge = false;
        }
        VIKKI_HideControl(tableRooms.rows[i + 1], hideChildrenAge);
        VIKKI_HideControl(tableRooms.rows[i + 2], hideChildrenAge);
    }
}

function VIKKI_ChildrenChange(e) {
    var control = VIKKI_GetCurrentElementOrTarget(e);
    var countChildren = parseInt(control.options[control.selectedIndex].text);
    var tableRooms = control.parentNode.parentNode.parentNode.parentNode;
    var rowIndex = control.parentNode.parentNode.rowIndex;
    var hideChildrenAge = true;
    if (countChildren > 0) {
        hideChildrenAge = false;
    }
    VIKKI_HideControl(tableRooms.rows[rowIndex + 1], hideChildrenAge);
    VIKKI_HideControl(tableRooms.rows[rowIndex + 2], hideChildrenAge);
    for (var i = 0; i < 3; i++) {
        var hide = true;
        if (i < countChildren) {
            hide = false;
        }
        var ChildAgeDDL = VIKKI_GetDDL(tableRooms.rows[rowIndex + 2].cells[2], "ddlChildAge" + i + "_");
        VIKKI_HideControl(ChildAgeDDL, hide);
    }
}

function VIKKI_CheckHotelSearch(tableRoomsClientID, ChildrenAgeAlert) {
    var validated = Page_ClientValidate();
    if (validated) {
        var tableRooms = document.getElementById(tableRoomsClientID);
        for (var i = 3; i < tableRooms.rows.length; i = i + 3) {
            if (!VIKKI_ControlIsHidden(tableRooms.rows[i])) {
                for (var j = 0; j < 3; j++) {
                    var ChildAgeDDL = VIKKI_GetDDL(tableRooms.rows[i].cells[2], "ddlChildAge" + j + "_");
                    if (!VIKKI_ControlIsHidden(ChildAgeDDL)) {
                        if (ChildAgeDDL.options[ChildAgeDDL.selectedIndex].text == "?") {
                            alert(ChildrenAgeAlert);
                            return false;
                        }
                    }
                }
            }
        }
    }
    return true;
}