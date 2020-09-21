LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := minicap-common

LOCAL_SRC_FILES := \
	JpgEncoder.cpp \
	SimpleServer.cpp \
	minicap.cpp \
	perfcat.pb.cc\

LOCAL_STATIC_LIBRARIES := \
	libjpeg-turbo \

LOCAL_SHARED_LIBRARIES := \
	minicap-shared \

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/google \

LOCAL_EXPORT_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/google \

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

# Enable PIE manually. Will get reset on $(CLEAR_VARS).
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie

LOCAL_MODULE := minicap

LOCAL_STATIC_LIBRARIES := minicap-common

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := minicap-nopie

LOCAL_STATIC_LIBRARIES := minicap-common

include $(BUILD_EXECUTABLE)
