// To parse this JSON data, do
//
//     final imeidata = imeidataFromJson(jsonString);

import 'dart:convert';

List<Imeidata> imeidataFromJson(String str) => List<Imeidata>.from(json.decode(str).map((x) => Imeidata.fromJson(x)));


class Imeidata {
  Imeidata({
    this.checkShowBrandDropDown,
    this.showAddAttributeBtn,
    this.imeiHistoryListModelc,
    this.isUniqueIdentifier,
    this.iVItemImeiTrackingsLine,
    this.isJson,
    this.bExternalTestingToolUpdateAvailable,
    this.lineid,
    this.bulkImei,
    this.imeiStatusCss,
    this.customBatchId,
    this.count,
    this.batchNumber,
    this.userMessage,
    this.itemCodeBarCode,
    this.sImeiBarCode,
    this.sLockedUnlocked,
    this.previoussRecordStatus,
    this.receiptNumber,
    this.bAutoGenerateItemName,
    this.sStages,
    this.bExternalTestingTool,
    this.sExternalTestingToolName,
    this.functionTestingStatus,
    this.imeiStage,
    this.customFieldsMake,
    this.customFieldsBrand,
    this.customFieldsModel,
    this.customFieldsCapacity,
    this.customFieldsCarrier,
    this.customFieldsColor,
    this.customFieldsCondition,
    this.customFieldsLockedUnLocked,
    this.customFieldbAccelerometer,
    this.customFieldbAgps,
    this.customFieldbAutoFocus,
    this.customFieldbAutoRotation,
    this.customFieldbBarometer,
    this.customFieldbBatteryCharging,
    this.customFieldbBatteryWear,
    this.customFieldbBlueTooth,
    this.customFieldbBottomMicrophone,
    this.customFieldbFlash,
    this.customFieldbCamera,
    this.customFieldbCompass,
    this.customFieldbFrontCamera,
    this.customFieldbFrontMicrophone,
    this.customFieldbGyroscope,
    this.customFieldbHomeButton,
    this.customFieldbLcdBacklight,
    this.customFieldbLcdColor,
    this.customFieldbLight,
    this.customFieldbMultiTouch,
    this.customFieldbProximity,
    this.customFieldbRearMicrophone,
    this.customFieldbReceiver,
    this.customFieldbScreenLockKey,
    this.customFieldbScreen,
    this.customFieldbSilentKey,
    this.customFieldbSpeakerMicrophone,
    this.customFieldbTestCallSpeaker,
    this.customFieldbTouch,
    this.customFieldbUsb,
    this.customFieldbVibration,
    this.customFieldbVideo,
    this.customFieldbVolumeUpDown,
    this.customFieldbWifi,
    this.customFieldbPfAbnormalPower,
    this.customFieldbPfBadLcd,
    this.customFieldbPfBlackLcd,
    this.customFieldbCallSensor,
    this.customFieldbCameraRecorder,
    this.customFieldbCharging,
    this.customFieldbSoundClarity,
    this.customFieldbDigitizer,
    this.customFieldbFastCharging,
    this.customFieldbFingerScanner,
    this.customFieldbPfFreezeUp,
    this.customFieldbHandsFree,
    this.customFieldbLed,
    this.customFieldbMemoryCard,
    this.customFieldbMontionSensor,
    this.customFieldbMultiWindow,
    this.customFieldbPowerOnOff,
    this.customFieldbRinger,
    this.customFieldbSimCard,
    this.customFieldbTestAllButtons,
    this.customFieldbTestCallVolume,
    this.customFieldbVoiceCommand,
    this.customFieldbUnLocked,
    this.isShowbAccelerometer,
    this.isShowbAgps,
    this.isShowbAutoFocus,
    this.isShowbAutoRotation,
    this.isShowbBarometer,
    this.isShowbBatteryCharging,
    this.isShowbBatteryWear,
    this.isShowbBlueTooth,
    this.isShowbBottomMicrophone,
    this.isShowbFlash,
    this.isShowbCamera,
    this.isShowbCompass,
    this.isShowbFrontCamera,
    this.isShowbFrontMicrophone,
    this.isShowbGyroscope,
    this.isShowbHomeButton,
    this.isShowbLcdBacklight,
    this.isShowbLcdColor,
    this.isShowbLight,
    this.isShowbMultiTouch,
    this.isShowbProximity,
    this.isShowbRearMicrophone,
    this.isShowbReceiver,
    this.isShowbScreenLockKey,
    this.isShowbScreen,
    this.isShowbSilentKey,
    this.isShowbSpeakerMicrophone,
    this.isShowbTestCallSpeaker,
    this.isShowbTouch,
    this.isShowbUsb,
    this.isShowbVibration,
    this.isShowbVideo,
    this.isShowbVolumeUpDown,
    this.isShowbWifi,
    this.isShowbPfAbnormalPower,
    this.isShowbPfBadLcd,
    this.isShowbPfBlackLcd,
    this.isShowbCallSensor,
    this.isShowbCameraRecorder,
    this.isShowbCharging,
    this.isShowbSoundClarity,
    this.isShowbDigitizer,
    this.isShowbFastCharging,
    this.isShowbFingerScanner,
    this.isShowbPfFreezeUp,
    this.isShowbHandsFree,
    this.isShowbLed,
    this.isShowbMemoryCard,
    this.isShowbMontionSensor,
    this.isShowbMultiWindow,
    this.isShowbPowerOnOff,
    this.isShowbRinger,
    this.isShowbSimCard,
    this.isShowbTestAllButtons,
    this.isShowbTestCallVolume,
    this.isShowbVoiceCommand,
    this.isShowbUnLocked,
    this.purcharseOrderId,
    this.bulkImeiList,
    this.bulkImeiBatchNumber,
    this.sBlanccoPowerButton,
    this.itemType,
    this.sBlanccoScreenRotation,
    this.sBlanccoSimReader,
    this.sLockedUnLocked,
    this.externalTestingData,
    this.warehouseName,
    this.binLocationName,
    this.referrerUrl,
    this.sBlanccoSMake,
    this.sBlanccoSBrand,
    this.sBlanccoSModel,
    this.sBlanccoSCondition,
    this.sBlanccoSCarrier,
    this.sBlanccoSCapacity,
    this.sBlanccoSColor,
    this.id,
    this.itemId,
    this.itemCode,
    this.itemName,
    this.sImei,
    this.sImeiStatus,
    this.sImeiWhiteList,
    this.sImeiActivationStatus,
    this.bCallIn,
    this.bCallOut,
    this.bSpeaker,
    this.bSideButton,
    this.bCamera,
    this.bFlash,
    this.bFrontCamera,
    this.bFullCharge,
    this.bLocked,
    this.bUnLocked,
    this.bVoiceCommand,
    this.bCallSensor,
    this.bCameraRecorder,
    this.bTestAllButtons,
    this.bPowerOnOff,
    this.bVolumeUpDown,
    this.bHomeButton,
    this.bCharging,
    this.bWifi,
    this.bBlueTooth,
    this.bRinger,
    this.bMultiWindow,
    this.bSimCard,
    this.bMemoryCard,
    this.bLed,
    this.bTouch,
    this.bDigitizer,
    this.bFingerScanner,
    this.bMontionSensor,
    this.bHandsFree,
    this.bScratches,
    this.bChips,
    this.bBatteryCharging,
    this.bFastCharging,
    this.bSoundClarity,
    this.bTestCallVolume,
    this.bTestCallSpeaker,
    this.bTestCallHandsFree,
    this.sCarrier,
    this.sCondition,
    this.sNotes,
    this.sVendorCode,
    this.dInvoiceDate,
    this.sVendorInvoiceNumber,
    this.sFinancialEligibility,
    this.sNotes1,
    this.companyId,
    this.dateTimeCreated,
    this.dateTimeModified,
    this.trxCreatedBy,
    this.trxModifiedBy,
    this.trxCreatedIpAddress,
    this.trxModifiedIpAddress,
    this.isUpdateQty,
    this.isReceivedFromVendor,
    this.sColor,
    this.sVendorCondition,
    this.sRecordStatus,
    this.isFunctionTestingDone,
    this.bPfFreezeUp,
    this.bPfAbnormalPower,
    this.bPfBadLcd,
    this.bPfBlackLcd,
    this.sShadow,
    this.sMake,
    this.sBrand,
    this.sModel,
    this.sModelTechName,
    this.sCapacity,
    this.saTransactionId,
    this.previousItemId,
    this.dateScanned,
    this.sDescription,
    this.poNumber,
    this.imeiBatchId,
    this.poItemReceiptItemLineId,
    this.bDeleted,
    this.warehouseId,
    this.isBatteryIncluded,
    this.isBatteryDoorIncluded,
    this.isChargerIncluded,
    this.saDocType,
    this.rctTxnNumber,
    this.poItemReceiptId,
    this.baseItemId,
    this.baseItemCode,
    this.imeiPurchaseUnitCost,
    this.binLocationId,
    this.unlockCode01,
    this.unlockCode02,
    this.unlockCode03,
    this.unlockCode04,
    this.transactionType,
    this.sBlanccoAccelerometer,
    this.sBlanccoAgps,
    this.sBlanccoAutoFocus,
    this.sBlanccoAutoRotation,
    this.sBlanccoBarometer,
    this.sBlanccoBatteryCharging,
    this.sBlanccoBatteryWear,
    this.sBlanccoBluetooth,
    this.sBlanccoBottomMicrophone,
    this.sBlanccoCameraAssisted,
    this.sBlanccoCameraFlash,
    this.sBlanccoCamera,
    this.sBlanccoCompass,
    this.sBlanccoFrontCameraAssisted,
    this.sBlanccoFrontCamera,
    this.sBlanccoFrontMicrophone,
    this.sBlanccoFrontVideoAssisted,
    this.sBlanccoGyroscope,
    this.sBlanccoHomeKey,
    this.sBlanccoLcdBacklight,
    this.sBlanccoLcdColor,
    this.sBlanccoLight,
    this.sBlanccoMultiTouch,
    this.sBlanccoProximity,
    this.sBlanccoRearMicrophone,
    this.sBlanccoReceiver,
    this.sBlanccoScreenLockKey,
    this.sBlanccoScreen,
    this.sBlanccoSilentKey,
    this.sBlanccoSpeakerMicrophone,
    this.sBlanccoSpeaker,
    this.sBlanccoTouch,
    this.sBlanccoUsb,
    this.sBlanccoVibration,
    this.sBlanccoVideoAssisted,
    this.sBlanccoVideo,
    this.sBlanccoVolumeKeys,
    this.sBlanccoWiFi,
    this.bAccelerometer,
    this.bAgps,
    this.bAutoFocus,
    this.bAutoRotation,
    this.bBarometer,
    this.bBatteryWear,
    this.bBottomMicrophone,
    this.bCameraAssisted,
    this.bCompass,
    this.bFrontCameraAssisted,
    this.bFrontMicrophone,
    this.bFrontVideoAssisted,
    this.bGyroscope,
    this.bLcdBacklight,
    this.bLcdColor,
    this.bLight,
    this.bMultiTouch,
    this.bProximity,
    this.bRearMicrophone,
    this.bReceiver,
    this.bScreenLockKey,
    this.bScreen,
    this.bSilentKey,
    this.bSpeakerMicrophone,
    this.bUsb,
    this.bVibration,
    this.bVideoAssisted,
    this.bVideo,
    this.blancoDateTimeLastUpdate,
    this.fulfillmentUser,
    this.fulfillmentSource,
    this.sDeviceId,
    this.sMeid,
    this.sWorkingStatus,
    this.sTestFailed,
    this.sTestPassed,
    this.sDataErased,
    this.boxNumber,
    this.sExternalTestingToolDataPhoneCheck,
    this.sExternalTestingToolDataBlannco,
    this.sOriginalBox,
    this.sAccessories,
    this.sSalesTax,
    this.sCableType,
  });

  dynamic checkShowBrandDropDown;
  dynamic showAddAttributeBtn;
  dynamic imeiHistoryListModelc;
  dynamic isUniqueIdentifier;
  dynamic iVItemImeiTrackingsLine;
  dynamic isJson;
  dynamic bExternalTestingToolUpdateAvailable;
  dynamic lineid;
  dynamic bulkImei;
  dynamic imeiStatusCss;
  dynamic customBatchId;
  dynamic count;
  dynamic batchNumber;
  dynamic userMessage;
  dynamic itemCodeBarCode;
  dynamic sImeiBarCode;
  dynamic sLockedUnlocked;
  dynamic previoussRecordStatus;
  dynamic receiptNumber;
  dynamic bAutoGenerateItemName;
  dynamic sStages;
  dynamic bExternalTestingTool;
  dynamic sExternalTestingToolName;
  dynamic functionTestingStatus;
  dynamic imeiStage;
  dynamic customFieldsMake;
  dynamic customFieldsBrand;
  dynamic customFieldsModel;
  dynamic customFieldsCapacity;
  dynamic customFieldsCarrier;
  dynamic customFieldsColor;
  dynamic customFieldsCondition;
  dynamic customFieldsLockedUnLocked;
  dynamic customFieldbAccelerometer;
  dynamic customFieldbAgps;
  dynamic customFieldbAutoFocus;
  dynamic customFieldbAutoRotation;
  dynamic customFieldbBarometer;
  dynamic customFieldbBatteryCharging;
  dynamic customFieldbBatteryWear;
  dynamic customFieldbBlueTooth;
  dynamic customFieldbBottomMicrophone;
  dynamic customFieldbFlash;
  dynamic customFieldbCamera;
  dynamic customFieldbCompass;
  dynamic customFieldbFrontCamera;
  dynamic customFieldbFrontMicrophone;
  dynamic customFieldbGyroscope;
  dynamic customFieldbHomeButton;
  dynamic customFieldbLcdBacklight;
  dynamic customFieldbLcdColor;
  dynamic customFieldbLight;
  dynamic customFieldbMultiTouch;
  dynamic customFieldbProximity;
  dynamic customFieldbRearMicrophone;
  dynamic customFieldbReceiver;
  dynamic customFieldbScreenLockKey;
  dynamic customFieldbScreen;
  dynamic customFieldbSilentKey;
  dynamic customFieldbSpeakerMicrophone;
  dynamic customFieldbTestCallSpeaker;
  dynamic customFieldbTouch;
  dynamic customFieldbUsb;
  dynamic customFieldbVibration;
  dynamic customFieldbVideo;
  dynamic customFieldbVolumeUpDown;
  dynamic customFieldbWifi;
  dynamic customFieldbPfAbnormalPower;
  dynamic customFieldbPfBadLcd;
  dynamic customFieldbPfBlackLcd;
  dynamic customFieldbCallSensor;
  dynamic customFieldbCameraRecorder;
  dynamic customFieldbCharging;
  dynamic customFieldbSoundClarity;
  dynamic customFieldbDigitizer;
  dynamic customFieldbFastCharging;
  dynamic customFieldbFingerScanner;
  dynamic customFieldbPfFreezeUp;
  dynamic customFieldbHandsFree;
  dynamic customFieldbLed;
  dynamic customFieldbMemoryCard;
  dynamic customFieldbMontionSensor;
  dynamic customFieldbMultiWindow;
  dynamic customFieldbPowerOnOff;
  dynamic customFieldbRinger;
  dynamic customFieldbSimCard;
  dynamic customFieldbTestAllButtons;
  dynamic customFieldbTestCallVolume;
  dynamic customFieldbVoiceCommand;
  dynamic customFieldbUnLocked;
  dynamic isShowbAccelerometer;
  dynamic isShowbAgps;
  dynamic isShowbAutoFocus;
  dynamic isShowbAutoRotation;
  dynamic isShowbBarometer;
  dynamic isShowbBatteryCharging;
  dynamic isShowbBatteryWear;
  dynamic isShowbBlueTooth;
  dynamic isShowbBottomMicrophone;
  dynamic isShowbFlash;
  dynamic isShowbCamera;
  dynamic isShowbCompass;
  dynamic isShowbFrontCamera;
  dynamic isShowbFrontMicrophone;
  dynamic isShowbGyroscope;
  dynamic isShowbHomeButton;
  dynamic isShowbLcdBacklight;
  dynamic isShowbLcdColor;
  dynamic isShowbLight;
  dynamic isShowbMultiTouch;
  dynamic isShowbProximity;
  dynamic isShowbRearMicrophone;
  dynamic isShowbReceiver;
  dynamic isShowbScreenLockKey;
  dynamic isShowbScreen;
  dynamic isShowbSilentKey;
  dynamic isShowbSpeakerMicrophone;
  dynamic isShowbTestCallSpeaker;
  dynamic isShowbTouch;
  dynamic isShowbUsb;
  dynamic isShowbVibration;
  dynamic isShowbVideo;
  dynamic isShowbVolumeUpDown;
  dynamic isShowbWifi;
  dynamic isShowbPfAbnormalPower;
  dynamic isShowbPfBadLcd;
  dynamic isShowbPfBlackLcd;
  dynamic isShowbCallSensor;
  dynamic isShowbCameraRecorder;
  dynamic isShowbCharging;
  dynamic isShowbSoundClarity;
  dynamic isShowbDigitizer;
  dynamic isShowbFastCharging;
  dynamic isShowbFingerScanner;
  dynamic isShowbPfFreezeUp;
  dynamic isShowbHandsFree;
  dynamic isShowbLed;
  dynamic isShowbMemoryCard;
  dynamic isShowbMontionSensor;
  dynamic isShowbMultiWindow;
  dynamic isShowbPowerOnOff;
  dynamic isShowbRinger;
  dynamic isShowbSimCard;
  dynamic isShowbTestAllButtons;
  dynamic isShowbTestCallVolume;
  dynamic isShowbVoiceCommand;
  dynamic isShowbUnLocked;
  dynamic purcharseOrderId;
  dynamic bulkImeiList;
  dynamic bulkImeiBatchNumber;
  dynamic sBlanccoPowerButton;
  dynamic itemType;
  dynamic sBlanccoScreenRotation;
  dynamic sBlanccoSimReader;
  dynamic sLockedUnLocked;
  dynamic externalTestingData;
  dynamic warehouseName;
  dynamic binLocationName;
  dynamic referrerUrl;
  dynamic sBlanccoSMake;
  dynamic sBlanccoSBrand;
  dynamic sBlanccoSModel;
  dynamic sBlanccoSCondition;
  dynamic sBlanccoSCarrier;
  dynamic sBlanccoSCapacity;
  dynamic sBlanccoSColor;
  dynamic id;
  dynamic itemId;
  dynamic itemCode;
  dynamic itemName;
  dynamic sImei;
  dynamic sImeiStatus;
  dynamic sImeiWhiteList;
  dynamic sImeiActivationStatus;
  dynamic bCallIn;
  dynamic bCallOut;
  dynamic bSpeaker;
  dynamic bSideButton;
  dynamic bCamera;
  dynamic bFlash;
  dynamic bFrontCamera;
  dynamic bFullCharge;
  dynamic bLocked;
  dynamic bUnLocked;
  dynamic bVoiceCommand;
  dynamic bCallSensor;
  dynamic bCameraRecorder;
  dynamic bTestAllButtons;
  dynamic bPowerOnOff;
  dynamic bVolumeUpDown;
  dynamic bHomeButton;
  dynamic bCharging;
  dynamic bWifi;
  dynamic bBlueTooth;
  dynamic bRinger;
  dynamic bMultiWindow;
  dynamic bSimCard;
  dynamic bMemoryCard;
  dynamic bLed;
  dynamic bTouch;
  dynamic bDigitizer;
  dynamic bFingerScanner;
  dynamic bMontionSensor;
  dynamic bHandsFree;
  dynamic bScratches;
  dynamic bChips;
  dynamic bBatteryCharging;
  dynamic bFastCharging;
  dynamic bSoundClarity;
  dynamic bTestCallVolume;
  dynamic bTestCallSpeaker;
  dynamic bTestCallHandsFree;
  dynamic sCarrier;
  dynamic sCondition;
  dynamic sNotes;
  dynamic sVendorCode;
  dynamic dInvoiceDate;
  dynamic sVendorInvoiceNumber;
  dynamic sFinancialEligibility;
  dynamic sNotes1;
  dynamic companyId;
  dynamic dateTimeCreated;
  dynamic dateTimeModified;
  dynamic trxCreatedBy;
  dynamic trxModifiedBy;
  dynamic trxCreatedIpAddress;
  dynamic trxModifiedIpAddress;
  dynamic isUpdateQty;
  dynamic isReceivedFromVendor;
  dynamic sColor;
  dynamic sVendorCondition;
  dynamic sRecordStatus;
  dynamic isFunctionTestingDone;
  dynamic bPfFreezeUp;
  dynamic bPfAbnormalPower;
  dynamic bPfBadLcd;
  dynamic bPfBlackLcd;
  dynamic sShadow;
  dynamic sMake;
  dynamic sBrand;
  dynamic sModel;
  dynamic sModelTechName;
  dynamic sCapacity;
  dynamic saTransactionId;
  dynamic previousItemId;
  dynamic dateScanned;
  dynamic sDescription;
  dynamic poNumber;
  dynamic imeiBatchId;
  dynamic poItemReceiptItemLineId;
  dynamic bDeleted;
  dynamic warehouseId;
  dynamic isBatteryIncluded;
  dynamic isBatteryDoorIncluded;
  dynamic isChargerIncluded;
  dynamic saDocType;
  dynamic rctTxnNumber;
  dynamic poItemReceiptId;
  dynamic baseItemId;
  dynamic baseItemCode;
  dynamic imeiPurchaseUnitCost;
  dynamic binLocationId;
  dynamic unlockCode01;
  dynamic unlockCode02;
  dynamic unlockCode03;
  dynamic unlockCode04;
  dynamic transactionType;
  dynamic sBlanccoAccelerometer;
  dynamic sBlanccoAgps;
  dynamic sBlanccoAutoFocus;
  dynamic sBlanccoAutoRotation;
  dynamic sBlanccoBarometer;
  dynamic sBlanccoBatteryCharging;
  dynamic sBlanccoBatteryWear;
  dynamic sBlanccoBluetooth;
  dynamic sBlanccoBottomMicrophone;
  dynamic sBlanccoCameraAssisted;
  dynamic sBlanccoCameraFlash;
  dynamic sBlanccoCamera;
  dynamic sBlanccoCompass;
  dynamic sBlanccoFrontCameraAssisted;
  dynamic sBlanccoFrontCamera;
  dynamic sBlanccoFrontMicrophone;
  dynamic sBlanccoFrontVideoAssisted;
  dynamic sBlanccoGyroscope;
  dynamic sBlanccoHomeKey;
  dynamic sBlanccoLcdBacklight;
  dynamic sBlanccoLcdColor;
  dynamic sBlanccoLight;
  dynamic sBlanccoMultiTouch;
  dynamic sBlanccoProximity;
  dynamic sBlanccoRearMicrophone;
  dynamic sBlanccoReceiver;
  dynamic sBlanccoScreenLockKey;
  dynamic sBlanccoScreen;
  dynamic sBlanccoSilentKey;
  dynamic sBlanccoSpeakerMicrophone;
  dynamic sBlanccoSpeaker;
  dynamic sBlanccoTouch;
  dynamic sBlanccoUsb;
  dynamic sBlanccoVibration;
  dynamic sBlanccoVideoAssisted;
  dynamic sBlanccoVideo;
  dynamic sBlanccoVolumeKeys;
  dynamic sBlanccoWiFi;
  dynamic bAccelerometer;
  dynamic bAgps;
  dynamic bAutoFocus;
  dynamic bAutoRotation;
  dynamic bBarometer;
  dynamic bBatteryWear;
  dynamic bBottomMicrophone;
  dynamic bCameraAssisted;
  dynamic bCompass;
  dynamic bFrontCameraAssisted;
  dynamic bFrontMicrophone;
  dynamic bFrontVideoAssisted;
  dynamic bGyroscope;
  dynamic bLcdBacklight;
  dynamic bLcdColor;
  dynamic bLight;
  dynamic bMultiTouch;
  dynamic bProximity;
  dynamic bRearMicrophone;
  dynamic bReceiver;
  dynamic bScreenLockKey;
  dynamic bScreen;
  dynamic bSilentKey;
  dynamic bSpeakerMicrophone;
  dynamic bUsb;
  dynamic bVibration;
  dynamic bVideoAssisted;
  dynamic bVideo;
  dynamic blancoDateTimeLastUpdate;
  dynamic fulfillmentUser;
  dynamic fulfillmentSource;
  dynamic sDeviceId;
  dynamic sMeid;
  dynamic sWorkingStatus;
  dynamic sTestFailed;
  dynamic sTestPassed;
  dynamic sDataErased;
  dynamic boxNumber;
  dynamic sExternalTestingToolDataPhoneCheck;
  dynamic sExternalTestingToolDataBlannco;
  dynamic sOriginalBox;
  dynamic sAccessories;
  dynamic sSalesTax;
  dynamic sCableType;

  factory Imeidata.fromJson(Map<String, dynamic> json) => Imeidata(
    checkShowBrandDropDown: json["CheckShowBrandDropDown"],
    showAddAttributeBtn: json["ShowAddAttributeBtn"],
    imeiHistoryListModelc: json["IMEIHistoryListModelc"],
    isUniqueIdentifier: json["IsUniqueIdentifier"],
    iVItemImeiTrackingsLine: json["iV_ItemIMEITrackingsLine"],
    isJson: json["isJson"],
    bExternalTestingToolUpdateAvailable: json["bExternalTestingTool_UpdateAvailable"],
    lineid: json["lineid"],
    bulkImei: json["BulkIMEI"],
    imeiStatusCss: json["IMEIStatusCSS"],
    customBatchId: json["CustomBatchID"],
    count: json["Count"],
    batchNumber: json["BatchNumber"],
    userMessage: json["userMessage"],
    itemCodeBarCode: json["ItemCode_BarCode"],
    sImeiBarCode: json["sIMEI_BarCode"],
    sLockedUnlocked: json["sLockedUnlocked"],
    previoussRecordStatus: json["PrevioussRecordStatus"],
    receiptNumber: json["ReceiptNumber"],
    bAutoGenerateItemName: json["bAutoGenerateItemName"],
    sStages: json["sStages"],
    bExternalTestingTool: json["bExternalTestingTool"],
    sExternalTestingToolName: json["sExternalTestingTool_Name"],
    functionTestingStatus: json["FunctionTestingStatus"],
    imeiStage: json["IMEI_Stage"],
    customFieldsMake: json["CustomFieldsMake"],
    customFieldsBrand: json["CustomFieldsBrand"],
    customFieldsModel: json["CustomFieldsModel"],
    customFieldsCapacity: json["CustomFieldsCapacity"],
    customFieldsCarrier: json["CustomFieldsCarrier"],
    customFieldsColor: json["CustomFieldsColor"],
    customFieldsCondition: json["CustomFieldsCondition"],
    customFieldsLockedUnLocked: json["CustomFieldsLocked_UnLocked"],
    customFieldbAccelerometer: json["CustomFieldbAccelerometer"],
    customFieldbAgps: json["CustomFieldbAGPS"],
    customFieldbAutoFocus: json["CustomFieldbAuto_Focus"],
    customFieldbAutoRotation: json["CustomFieldbAuto_Rotation"],
    customFieldbBarometer: json["CustomFieldbBarometer"],
    customFieldbBatteryCharging: json["CustomFieldbBatteryCharging"],
    customFieldbBatteryWear: json["CustomFieldbBattery_Wear"],
    customFieldbBlueTooth: json["CustomFieldbBlueTooth"],
    customFieldbBottomMicrophone: json["CustomFieldbBottom_Microphone"],
    customFieldbFlash: json["CustomFieldbFlash"],
    customFieldbCamera: json["CustomFieldbCamera"],
    customFieldbCompass: json["CustomFieldbCompass"],
    customFieldbFrontCamera: json["CustomFieldbFrontCamera"],
    customFieldbFrontMicrophone: json["CustomFieldbFront_Microphone"],
    customFieldbGyroscope: json["CustomFieldbGyroscope"],
    customFieldbHomeButton: json["CustomFieldbHomeButton"],
    customFieldbLcdBacklight: json["CustomFieldbLCD_Backlight"],
    customFieldbLcdColor: json["CustomFieldbLCD_Color"],
    customFieldbLight: json["CustomFieldbLight"],
    customFieldbMultiTouch: json["CustomFieldbMulti_Touch"],
    customFieldbProximity: json["CustomFieldbProximity"],
    customFieldbRearMicrophone: json["CustomFieldbRear_Microphone"],
    customFieldbReceiver: json["CustomFieldbReceiver"],
    customFieldbScreenLockKey: json["CustomFieldbScreen_Lock_Key"],
    customFieldbScreen: json["CustomFieldbScreen"],
    customFieldbSilentKey: json["CustomFieldbSilent_Key"],
    customFieldbSpeakerMicrophone: json["CustomFieldbSpeaker_Microphone"],
    customFieldbTestCallSpeaker: json["CustomFieldbTestCallSpeaker"],
    customFieldbTouch: json["CustomFieldbTouch"],
    customFieldbUsb: json["CustomFieldbUSB"],
    customFieldbVibration: json["CustomFieldbVibration"],
    customFieldbVideo: json["CustomFieldbVideo"],
    customFieldbVolumeUpDown: json["CustomFieldbVolumeUpDown"],
    customFieldbWifi: json["CustomFieldbWifi"],
    customFieldbPfAbnormalPower: json["CustomFieldbPF_AbnormalPower"],
    customFieldbPfBadLcd: json["CustomFieldbPF_BadLCD"],
    customFieldbPfBlackLcd: json["CustomFieldbPF_BlackLCD"],
    customFieldbCallSensor: json["CustomFieldbCallSensor"],
    customFieldbCameraRecorder: json["CustomFieldbCameraRecorder"],
    customFieldbCharging: json["CustomFieldbCharging"],
    customFieldbSoundClarity: json["CustomFieldbSoundClarity"],
    customFieldbDigitizer: json["CustomFieldbDigitizer"],
    customFieldbFastCharging: json["CustomFieldbFastCharging"],
    customFieldbFingerScanner: json["CustomFieldbFingerScanner"],
    customFieldbPfFreezeUp: json["CustomFieldbPF_FreezeUp"],
    customFieldbHandsFree: json["CustomFieldbHandsFree"],
    customFieldbLed: json["CustomFieldbLed"],
    customFieldbMemoryCard: json["CustomFieldbMemoryCard"],
    customFieldbMontionSensor: json["CustomFieldbMontionSensor"],
    customFieldbMultiWindow: json["CustomFieldbMultiWindow"],
    customFieldbPowerOnOff: json["CustomFieldbPowerOnOff"],
    customFieldbRinger: json["CustomFieldbRinger"],
    customFieldbSimCard: json["CustomFieldbSimCard"],
    customFieldbTestAllButtons: json["CustomFieldbTestAllButtons"],
    customFieldbTestCallVolume: json["CustomFieldbTestCallVolume"],
    customFieldbVoiceCommand: json["CustomFieldbVoiceCommand"],
    customFieldbUnLocked: json["CustomFieldbUnLocked"],
    isShowbAccelerometer: json["isShowbAccelerometer"],
    isShowbAgps: json["isShowbAGPS"],
    isShowbAutoFocus: json["isShowbAuto_Focus"],
    isShowbAutoRotation: json["isShowbAuto_Rotation"],
    isShowbBarometer: json["isShowbBarometer"],
    isShowbBatteryCharging: json["isShowbBatteryCharging"],
    isShowbBatteryWear: json["isShowbBattery_Wear"],
    isShowbBlueTooth: json["isShowbBlueTooth"],
    isShowbBottomMicrophone: json["isShowbBottom_Microphone"],
    isShowbFlash: json["isShowbFlash"],
    isShowbCamera: json["isShowbCamera"],
    isShowbCompass: json["isShowbCompass"],
    isShowbFrontCamera: json["isShowbFrontCamera"],
    isShowbFrontMicrophone: json["isShowbFront_Microphone"],
    isShowbGyroscope: json["isShowbGyroscope"],
    isShowbHomeButton: json["isShowbHomeButton"],
    isShowbLcdBacklight: json["isShowbLCD_Backlight"],
    isShowbLcdColor: json["isShowbLCD_Color"],
    isShowbLight: json["isShowbLight"],
    isShowbMultiTouch: json["isShowbMulti_Touch"],
    isShowbProximity: json["isShowbProximity"],
    isShowbRearMicrophone: json["isShowbRear_Microphone"],
    isShowbReceiver: json["isShowbReceiver"],
    isShowbScreenLockKey: json["isShowbScreen_Lock_Key"],
    isShowbScreen: json["isShowbScreen"],
    isShowbSilentKey: json["isShowbSilent_Key"],
    isShowbSpeakerMicrophone: json["isShowbSpeaker_Microphone"],
    isShowbTestCallSpeaker: json["isShowbTestCallSpeaker"],
    isShowbTouch: json["isShowbTouch"],
    isShowbUsb: json["isShowbUSB"],
    isShowbVibration: json["isShowbVibration"],
    isShowbVideo: json["isShowbVideo"],
    isShowbVolumeUpDown: json["isShowbVolumeUpDown"],
    isShowbWifi: json["isShowbWifi"],
    isShowbPfAbnormalPower: json["isShowbPF_AbnormalPower"],
    isShowbPfBadLcd: json["isShowbPF_BadLCD"],
    isShowbPfBlackLcd: json["isShowbPF_BlackLCD"],
    isShowbCallSensor: json["isShowbCallSensor"],
    isShowbCameraRecorder: json["isShowbCameraRecorder"],
    isShowbCharging: json["isShowbCharging"],
    isShowbSoundClarity: json["isShowbSoundClarity"],
    isShowbDigitizer: json["isShowbDigitizer"],
    isShowbFastCharging: json["isShowbFastCharging"],
    isShowbFingerScanner: json["isShowbFingerScanner"],
    isShowbPfFreezeUp: json["isShowbPF_FreezeUp"],
    isShowbHandsFree: json["isShowbHandsFree"],
    isShowbLed: json["isShowbLed"],
    isShowbMemoryCard: json["isShowbMemoryCard"],
    isShowbMontionSensor: json["isShowbMontionSensor"],
    isShowbMultiWindow: json["isShowbMultiWindow"],
    isShowbPowerOnOff: json["isShowbPowerOnOff"],
    isShowbRinger: json["isShowbRinger"],
    isShowbSimCard: json["isShowbSimCard"],
    isShowbTestAllButtons: json["isShowbTestAllButtons"],
    isShowbTestCallVolume: json["isShowbTestCallVolume"],
    isShowbVoiceCommand: json["isShowbVoiceCommand"],
    isShowbUnLocked: json["isShowbUnLocked"],
    purcharseOrderId: json["PurcharseOrderID"],
    bulkImeiList: json["BULK_IMEIList"],
    bulkImeiBatchNumber: json["BULK_IMEI_BatchNumber"],
    sBlanccoPowerButton: json["sBlancco_PowerButton"],
    itemType: json["ItemType"],
    sBlanccoScreenRotation: json["sBlancco_ScreenRotation"],
    sBlanccoSimReader: json["sBlancco_SimReader"],
    sLockedUnLocked: json["sLocked_UnLocked"],
    externalTestingData: json["externalTestingData"],
    warehouseName: json["WarehouseName"],
    binLocationName: json["BinLocationName"],
    referrerUrl: json["Referrer_url"],
    sBlanccoSMake: json["sBlancco_sMake"],
    sBlanccoSBrand: json["sBlancco_sBrand"],
    sBlanccoSModel: json["sBlancco_sModel"],
    sBlanccoSCondition: json["sBlancco_sCondition"],
    sBlanccoSCarrier: json["sBlancco_sCarrier"],
    sBlanccoSCapacity: json["sBlancco_sCapacity"],
    sBlanccoSColor: json["sBlancco_sColor"],
    id: json["ID"],
    itemId: json["ItemID"],
    itemCode: json["ItemCode"],
    itemName: json["ItemName"],
    sImei: json["sIMEI"],
    sImeiStatus: json["sIMEI_Status"],
    sImeiWhiteList: json["sIMEI_WhiteList"],
    sImeiActivationStatus: json["sIMEI_ActivationStatus"],
    bCallIn: json["bCallIn"],
    bCallOut: json["bCallOut"],
    bSpeaker: json["bSpeaker"],
    bSideButton: json["bSideButton"],
    bCamera: json["bCamera"],
    bFlash: json["bFlash"],
    bFrontCamera: json["bFrontCamera"],
    bFullCharge: json["bFullCharge"],
    bLocked: json["bLocked"],
    bUnLocked: json["bUnLocked"],
    bVoiceCommand: json["bVoiceCommand"],
    bCallSensor: json["bCallSensor"],
    bCameraRecorder: json["bCameraRecorder"],
    bTestAllButtons: json["bTestAllButtons"],
    bPowerOnOff: json["bPowerOnOff"],
    bVolumeUpDown: json["bVolumeUpDown"],
    bHomeButton: json["bHomeButton"],
    bCharging: json["bCharging"],
    bWifi: json["bWifi"],
    bBlueTooth: json["bBlueTooth"],
    bRinger: json["bRinger"],
    bMultiWindow: json["bMultiWindow"],
    bSimCard: json["bSimCard"],
    bMemoryCard: json["bMemoryCard"],
    bLed: json["bLed"],
    bTouch: json["bTouch"],
    bDigitizer: json["bDigitizer"],
    bFingerScanner: json["bFingerScanner"],
    bMontionSensor: json["bMontionSensor"],
    bHandsFree: json["bHandsFree"],
    bScratches: json["bScratches"],
    bChips: json["bChips"],
    bBatteryCharging: json["bBatteryCharging"],
    bFastCharging: json["bFastCharging"],
    bSoundClarity: json["bSoundClarity"],
    bTestCallVolume: json["bTestCallVolume"],
    bTestCallSpeaker: json["bTestCallSpeaker"],
    bTestCallHandsFree: json["bTestCallHandsFree"],
    sCarrier: json["sCarrier"],
    sCondition: json["sCondition"],
    sNotes: json["sNotes"],
    sVendorCode: json["sVendorCode"],
    dInvoiceDate: json["dInvoiceDate"],
    sVendorInvoiceNumber: json["sVendorInvoiceNumber"],
    sFinancialEligibility: json["sFinancialEligibility"],
    sNotes1: json["sNotes1"],
    companyId: json["CompanyID"],
    dateTimeCreated: json["DateTimeCreated"],
    dateTimeModified:json["DateTimeModified"],
    trxCreatedBy: json["TrxCreatedBy"],
    trxModifiedBy:json["TrxModifiedBy"],
    trxCreatedIpAddress: json["TrxCreated_IPAddress"],
    trxModifiedIpAddress:json["TrxModified_IPAddress"],
    isUpdateQty: json["IsUpdateQty"],
    isReceivedFromVendor: json["IsReceivedFromVendor"],
    sColor: json["sColor"],
    sVendorCondition: json["sVendorCondition"],
    sRecordStatus: json["sRecordStatus"],
    isFunctionTestingDone: json["IsFunctionTestingDone"],
    bPfFreezeUp: json["bPF_FreezeUp"],
    bPfAbnormalPower: json["bPF_AbnormalPower"],
    bPfBadLcd: json["bPF_BadLCD"],
    bPfBlackLcd: json["bPF_BlackLCD"],
    sShadow: json["sShadow"],
    sMake: json["sMake"],
    sBrand: json["sBrand"],
    sModel:json["sModel"],
    sModelTechName: json["sModel_TechName"],
    sCapacity: json["sCapacity"],
    saTransactionId: json["SATransactionID"],
    previousItemId: json["PreviousItemID"],
    dateScanned: json["DateScanned"],
    sDescription: json["sDescription"],
    poNumber: json["PO_number"],
    imeiBatchId: json["IMEIBatchID"],
    poItemReceiptItemLineId: json["PO_ItemReceiptItemLineID"],
    bDeleted: json["bDeleted"],
    warehouseId: json["WarehouseID"],
    isBatteryIncluded: json["IsBatteryIncluded"],
    isBatteryDoorIncluded: json["IsBatteryDoorIncluded"],
    isChargerIncluded: json["IsChargerIncluded"],
    saDocType: json["SA_DocType"],
    rctTxnNumber: json["RCT_TxnNumber"],
    poItemReceiptId: json["PO_ItemReceiptID"],
    baseItemId: json["Base_ItemID"],
    baseItemCode:json["Base_ItemCode"],
    imeiPurchaseUnitCost: json["IMEI_PurchaseUnitCost"],
    binLocationId: json["BinLocationID"],
    unlockCode01: json["UnlockCode_01"],
    unlockCode02: json["UnlockCode_02"],
    unlockCode03: json["UnlockCode_03"],
    unlockCode04: json["UnlockCode_04"],
    transactionType: json["TransactionType"] == null ? null : json["TransactionType"],
    sBlanccoAccelerometer: json["sBlancco_Accelerometer"],
    sBlanccoAgps: json["sBlancco_AGPS"],
    sBlanccoAutoFocus: json["sBlancco_Auto_Focus"],
    sBlanccoAutoRotation: json["sBlancco_Auto_Rotation"],
    sBlanccoBarometer: json["sBlancco_Barometer"],
    sBlanccoBatteryCharging: json["sBlancco_Battery_Charging"],
    sBlanccoBatteryWear: json["sBlancco_Battery_Wear"],
    sBlanccoBluetooth: json["sBlancco_Bluetooth"],
    sBlanccoBottomMicrophone: json["sBlancco_Bottom_Microphone"],
    sBlanccoCameraAssisted: json["sBlancco_Camera_Assisted"],
    sBlanccoCameraFlash: json["sBlancco_Camera_Flash"],
    sBlanccoCamera: json["sBlancco_Camera"],
    sBlanccoCompass: json["sBlancco_Compass"],
    sBlanccoFrontCameraAssisted: json["sBlancco_Front_Camera_Assisted"],
    sBlanccoFrontCamera: json["sBlancco_Front_Camera"],
    sBlanccoFrontMicrophone: json["sBlancco_Front_Microphone"],
    sBlanccoFrontVideoAssisted: json["sBlancco_Front_Video_Assisted"],
    sBlanccoGyroscope: json["sBlancco_Gyroscope"],
    sBlanccoHomeKey: json["sBlancco_Home_Key"],
    sBlanccoLcdBacklight: json["sBlancco_LCD_Backlight"],
    sBlanccoLcdColor: json["sBlancco_LCD_Color"],
    sBlanccoLight: json["sBlancco_Light"],
    sBlanccoMultiTouch: json["sBlancco_Multi_Touch"],
    sBlanccoProximity: json["sBlancco_Proximity"],
    sBlanccoRearMicrophone: json["sBlancco_Rear_Microphone"],
    sBlanccoReceiver: json["sBlancco_Receiver"],
    sBlanccoScreenLockKey: json["sBlancco_Screen_Lock_Key"],
    sBlanccoScreen: json["sBlancco_Screen"],
    sBlanccoSilentKey: json["sBlancco_Silent_Key"],
    sBlanccoSpeakerMicrophone: json["sBlancco_Speaker_Microphone"],
    sBlanccoSpeaker: json["sBlancco_Speaker"],
    sBlanccoTouch: json["sBlancco_Touch"],
    sBlanccoUsb: json["sBlancco_USB"],
    sBlanccoVibration: json["sBlancco_Vibration"],
    sBlanccoVideoAssisted: json["sBlancco_Video_Assisted"],
    sBlanccoVideo: json["sBlancco_Video"],
    sBlanccoVolumeKeys: json["sBlancco_Volume_Keys"],
    sBlanccoWiFi: json["sBlancco_WiFi"],
    bAccelerometer: json["bAccelerometer"],
    bAgps: json["bAGPS"],
    bAutoFocus: json["bAuto_Focus"],
    bAutoRotation: json["bAuto_Rotation"],
    bBarometer: json["bBarometer"],
    bBatteryWear: json["bBattery_Wear"],
    bBottomMicrophone: json["bBottom_Microphone"],
    bCameraAssisted: json["bCamera_Assisted"],
    bCompass: json["bCompass"],
    bFrontCameraAssisted: json["bFront_Camera_Assisted"],
    bFrontMicrophone: json["bFront_Microphone"],
    bFrontVideoAssisted: json["bFront_Video_Assisted"],
    bGyroscope: json["bGyroscope"],
    bLcdBacklight: json["bLCD_Backlight"],
    bLcdColor: json["bLCD_Color"],
    bLight: json["bLight"],
    bMultiTouch: json["bMulti_Touch"],
    bProximity: json["bProximity"],
    bRearMicrophone: json["bRear_Microphone"],
    bReceiver: json["bReceiver"],
    bScreenLockKey: json["bScreen_Lock_Key"],
    bScreen: json["bScreen"],
    bSilentKey: json["bSilent_Key"],
    bSpeakerMicrophone: json["bSpeaker_Microphone"],
    bUsb: json["bUSB"],
    bVibration: json["bVibration"],
    bVideoAssisted: json["bVideo_Assisted"],
    bVideo: json["bVideo"],
    blancoDateTimeLastUpdate: json["Blanco_DateTime_LastUpdate"],
    fulfillmentUser: json["Fulfillment_User"],
    fulfillmentSource: json["Fulfillment_Source"],
    sDeviceId: json["sDeviceID"],
    sMeid: json["sMEID"],
    sWorkingStatus: json["sWorking_Status"],
    sTestFailed: json["sTest_Failed"],
    sTestPassed: json["sTest_Passed"],
    sDataErased: json["sData_Erased"],
    boxNumber: json["BoxNumber"] == null ? null : json["BoxNumber"],
    sExternalTestingToolDataPhoneCheck: json["sExternalTestingTool_Data_PhoneCheck"],
    sExternalTestingToolDataBlannco: json["sExternalTestingTool_Data_Blannco"],
    sOriginalBox: json["sOriginalBox"],
    sAccessories: json["sAccessories"],
    sSalesTax: json["sSalesTax"],
    sCableType: json["sCableType"],
  );


}


