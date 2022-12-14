AUDIO_PATH := vendor/pixeldust/prebuilt/audio

ALARMS := A_real_hoot Awaken Bounce Bright_morning Cuckoo_clock Drip Early_twilight \
	Flow Fresh_start Full_of_wonder Gallop Gentle_breeze Icicles Jump_start Loose_change Nudge \
	Orbit Rise Rolling_fog Spokes Sunshower Sway Wag

RINGTONES := Beats Copycat Crackle Dance_party Early_bird Flutterby Hey_hey Hotline \
	Leaps_and_bounds Lollipop Lost_and_found Mash_up Monkey_around Romance Rrrring Schools_out \
	Shooting_star Spaceship Summer_night The_big_adventure Your_new_adventure Zen Zen_too

UI := AttentionalHaptics ChargingStarted Dock Effect_Tick InCallNotification KeypressDelete \
	KeypressInvalid KeypressReturn KeypressSpacebar KeypressStandard Lock LowBattery NFCFailure \
	NFCInitiated NFCSuccess NFCTransferComplete NFCTransferInitiated Trusted Undock Unlock \
	VideoRecord VideoStop WirelessChargingStarted \
	audio_end audio_initiate camera_click camera_focus reverse_charging_end reverse_charging_start

NOTIFICATIONS := Beginning Birdsong Chime Clink Coconuts Duet End_note Eureka Flick Gentle_gong Hey \
	Mallet Note Orders_up Ping Pipes Popcorn Shopkeeper Sticks_and_stones Strum Trill Tuneup \
	Tweeter Twinkle

PRODUCT_COPY_FILES += $(foreach f,$(ALARMS),\
	$(AUDIO_PATH)/alarms/$(f).ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/alarms/$(f).ogg)

PRODUCT_COPY_FILES += $(foreach f,$(RINGTONES),\
	$(AUDIO_PATH)/ringtones/$(f).ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ringtones/$(f).ogg)

PRODUCT_COPY_FILES += $(foreach f,$(UI),\
	$(AUDIO_PATH)/ui/$(f).ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/ui/$(f).ogg)

PRODUCT_COPY_FILES += $(foreach f,$(NOTIFICATIONS),\
	$(AUDIO_PATH)/notifications/$(f).ogg:$(TARGET_COPY_OUT_PRODUCT)/media/audio/notifications/$(f).ogg)

# Change default sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=Your_new_adventure.ogg \
    ro.config.notification_sound=Eureka.ogg \
    ro.config.alarm_alert=Fresh_start.ogg

# Inherit AOSP audio package last so vendor audio overrides AOSP audio
$(call inherit-product, frameworks/base/data/sounds/AudioPackage14.mk)

