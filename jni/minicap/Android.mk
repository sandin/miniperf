LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := minicap-common

LOCAL_LDLIBS     := -llog -latomic -landroid

LOCAL_SRC_FILES := \
  	JpgEncoder.cpp 											  	 \
	SimpleServer.cpp 											 \
	minicap.cpp 												 \
	perfcat.pb.cc												 \
	google/protobuf/stubs/bytestream.cc                          \
  	google/protobuf/stubs/bytestream.h                           \
  	google/protobuf/stubs/common.cc                              \
  	google/protobuf/stubs/hash.h                                 \
  	google/protobuf/stubs/int128.cc                              \
  	google/protobuf/stubs/int128.h                               \
  	google/protobuf/io/io_win32.cc                               \
  	google/protobuf/stubs/map_util.h                             \
  	google/protobuf/stubs/mathutil.h                             \
  	google/protobuf/stubs/status.cc                              \
  	google/protobuf/stubs/status.h                               \
  	google/protobuf/stubs/status_macros.h                        \
  	google/protobuf/stubs/statusor.cc                            \
  	google/protobuf/stubs/statusor.h                             \
  	google/protobuf/stubs/stringpiece.cc                         \
  	google/protobuf/stubs/stringpiece.h                          \
  	google/protobuf/stubs/stringprintf.cc                        \
  	google/protobuf/stubs/stringprintf.h                         \
  	google/protobuf/stubs/structurally_valid.cc                  \
  	google/protobuf/stubs/strutil.cc                             \
  	google/protobuf/stubs/time.cc                                \
  	google/protobuf/stubs/time.h                                 \
  	google/protobuf/any_lite.cc                                  \
  	google/protobuf/arena.cc                                     \
  	google/protobuf/extension_set.cc                             \
  	google/protobuf/generated_enum_util.cc                       \
  	google/protobuf/generated_message_util.cc                    \
  	google/protobuf/generated_message_table_driven_lite.h        \
  	google/protobuf/generated_message_table_driven_lite.cc       \
  	google/protobuf/implicit_weak_message.cc                     \
  	google/protobuf/message_lite.cc                              \
  	google/protobuf/parse_context.cc                             \
  	google/protobuf/repeated_field.cc                            \
  	google/protobuf/wire_format_lite.cc                          \
  	google/protobuf/io/coded_stream.cc                           \
  	google/protobuf/io/strtod.cc                                 \
  	google/protobuf/io/zero_copy_stream.cc                       \
  	google/protobuf/io/zero_copy_stream_impl.cc                  \
  	google/protobuf/io/zero_copy_stream_impl_lite.cc			 \
	google/protobuf/stubs/bytestream.cc 						 \
  	google/protobuf/stubs/bytestream.h                           \
  	google/protobuf/stubs/common.cc                              \
  	google/protobuf/stubs/hash.h                                 \
  	google/protobuf/stubs/int128.cc                              \
  	google/protobuf/any.pb.cc                                    \
  	google/protobuf/api.pb.cc                                    \
  	google/protobuf/any.cc                                       \
  	google/protobuf/descriptor.cc                                \
  	google/protobuf/descriptor_database.cc                       \
  	google/protobuf/descriptor.pb.cc                             \
  	google/protobuf/duration.pb.cc                               \
  	google/protobuf/dynamic_message.cc                           \
  	google/protobuf/empty.pb.cc                                  \
  	google/protobuf/extension_set_heavy.cc                       \
  	google/protobuf/field_mask.pb.cc                             \
  	google/protobuf/generated_message_reflection.cc              \
  	google/protobuf/generated_message_table_driven_lite.h        \
  	google/protobuf/generated_message_table_driven.cc            \
  	google/protobuf/map_field.cc                                 \
  	google/protobuf/message.cc                                   \
  	google/protobuf/reflection_internal.h                        \
  	google/protobuf/reflection_ops.cc                            \
  	google/protobuf/service.cc                                   \
  	google/protobuf/source_context.pb.cc                         \
  	google/protobuf/struct.pb.cc                                 \
  	google/protobuf/stubs/substitute.cc                          \
  	google/protobuf/stubs/substitute.h                           \
  	google/protobuf/text_format.cc                               \
  	google/protobuf/timestamp.pb.cc                              \
  	google/protobuf/type.pb.cc                                   \
  	google/protobuf/unknown_field_set.cc                         \
  	google/protobuf/wire_format.cc                               \
  	google/protobuf/wrappers.pb.cc                               \
  	google/protobuf/io/gzip_stream.cc                            \
  	google/protobuf/io/printer.cc                                \
  	google/protobuf/io/tokenizer.cc                              \
  	google/protobuf/compiler/importer.cc                         \
  	google/protobuf/compiler/parser.cc                           \
  	google/protobuf/util/delimited_message_util.cc               \
  	google/protobuf/util/field_comparator.cc                     \
  	google/protobuf/util/field_mask_util.cc                      \
  	google/protobuf/util/internal/constants.h                    \
  	google/protobuf/util/internal/datapiece.cc                   \
  	google/protobuf/util/internal/datapiece.h                    \
  	google/protobuf/util/internal/default_value_objectwriter.cc  \
  	google/protobuf/util/internal/default_value_objectwriter.h   \
  	google/protobuf/util/internal/error_listener.cc              \
  	google/protobuf/util/internal/error_listener.h               \
  	google/protobuf/util/internal/expecting_objectwriter.h       \
  	google/protobuf/util/internal/field_mask_utility.cc          \
  	google/protobuf/util/internal/field_mask_utility.h           \
  	google/protobuf/util/internal/json_escaping.cc               \
  	google/protobuf/util/internal/json_escaping.h                \
  	google/protobuf/util/internal/json_objectwriter.cc           \
  	google/protobuf/util/internal/json_objectwriter.h            \
  	google/protobuf/util/internal/json_stream_parser.cc          \
  	google/protobuf/util/internal/json_stream_parser.h           \
  	google/protobuf/util/internal/location_tracker.h             \
  	google/protobuf/util/internal/mock_error_listener.h          \
  	google/protobuf/util/internal/object_location_tracker.h      \
  	google/protobuf/util/internal/object_source.h                \
  	google/protobuf/util/internal/object_writer.cc               \
  	google/protobuf/util/internal/object_writer.h                \
  	google/protobuf/util/internal/protostream_objectsource.cc    \
  	google/protobuf/util/internal/protostream_objectsource.h     \
  	google/protobuf/util/internal/protostream_objectwriter.cc    \
  	google/protobuf/util/internal/protostream_objectwriter.h     \
  	google/protobuf/util/internal/proto_writer.cc                \
  	google/protobuf/util/internal/proto_writer.h                 \
  	google/protobuf/util/internal/structured_objectwriter.h      \
  	google/protobuf/util/internal/type_info.cc                   \
  	google/protobuf/util/internal/type_info.h                    \
  	google/protobuf/util/internal/type_info_test_helper.cc       \
  	google/protobuf/util/internal/type_info_test_helper.h        \
  	google/protobuf/util/internal/utility.cc                     \
  	google/protobuf/util/internal/utility.h                      \
  	google/protobuf/util/json_util.cc                            \
  	google/protobuf/util/message_differencer.cc                  \
  	google/protobuf/util/time_util.cc                            \
  	google/protobuf/util/type_resolver_util.cc					 \


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

