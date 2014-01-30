THEOS_PACKAGE_DIR_NAME = debs
TARGET = :clang
ARCHS = armv7 arm64

TWEAK_NAME = RoundedTwitterrific
RoundedTwitterrific_FILES = Tweak.xm
RoundedTwitterrific_FRAMEWORKS = UIKit QuartzCore CoreGraphics

include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

internal-after-install::
	install.exec "killall -9 backboardd"