#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Talking_to_gui.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/Talking_to_gui.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=lcd/main.c lcd/mui.c lcd/mui_u8g2.c lcd/u8g2_arc.c lcd/u8g2_bitmap.c lcd/u8g2_box.c lcd/u8g2_buffer.c lcd/u8g2_button.c lcd/u8g2_circle.c lcd/u8g2_cleardisplay.c lcd/u8g2_d_memory.c lcd/u8g2_d_setup.c lcd/u8g2_font.c lcd/u8g2_fonts.c lcd/u8g2_hvline.c lcd/u8g2_input_value.c lcd/u8g2_intersection.c lcd/u8g2_kerning.c lcd/u8g2_line.c lcd/u8g2_ll_hvline.c lcd/u8g2_message.c lcd/u8g2_polygon.c lcd/u8g2_selection_list.c lcd/u8g2_setup.c lcd/u8log.c lcd/u8log_u8g2.c lcd/u8log_u8x8.c lcd/u8x8_8x8.c lcd/u8x8_byte.c lcd/u8x8_cad.c lcd/u8x8_capture.c lcd/u8x8_d_a2printer.c lcd/u8x8_d_ch1120.c lcd/u8x8_d_gp1247ai.c lcd/u8x8_d_gp1287ai.c lcd/u8x8_d_gp1294ai.c lcd/u8x8_d_gu800.c lcd/u8x8_d_hd44102.c lcd/u8x8_d_il3820_296x128.c lcd/u8x8_d_ist3020.c lcd/u8x8_d_ist3088.c lcd/u8x8_d_ist7920.c lcd/u8x8_d_ks0108.c lcd/u8x8_d_lc7981.c lcd/u8x8_d_ld7032_60x32.c lcd/u8x8_d_ls013b7dh03.c lcd/u8x8_d_max7219.c lcd/u8x8_d_pcd8544_84x48.c lcd/u8x8_d_pcf8812.c lcd/u8x8_d_pcf8814_hx1230.c lcd/u8x8_d_s1d15300.c lcd/u8x8_d_s1d15721.c lcd/u8x8_d_s1d15e06.c lcd/u8x8_d_sbn1661.c lcd/u8x8_d_sed1330.c lcd/u8x8_d_sh1106_64x32.c lcd/u8x8_d_sh1106_72x40.c lcd/u8x8_d_sh1107.c lcd/u8x8_d_sh1108.c lcd/u8x8_d_sh1122.c lcd/u8x8_d_ssd1305.c lcd/u8x8_d_ssd1306_128x32.c lcd/u8x8_d_ssd1306_128x64_noname.c lcd/u8x8_d_ssd1306_2040x16.c lcd/u8x8_d_ssd1306_48x64.c lcd/u8x8_d_ssd1306_64x32.c lcd/u8x8_d_ssd1306_64x48.c lcd/u8x8_d_ssd1306_72x40.c lcd/u8x8_d_ssd1306_96x16.c lcd/u8x8_d_ssd1306_96x40.c lcd/u8x8_d_ssd1309.c lcd/u8x8_d_ssd1312.c lcd/u8x8_d_ssd1315_128x64_noname.c lcd/u8x8_d_ssd1316.c lcd/u8x8_d_ssd1317.c lcd/u8x8_d_ssd1318.c lcd/u8x8_d_ssd1320.c lcd/u8x8_d_ssd1322.c lcd/u8x8_d_ssd1325.c lcd/u8x8_d_ssd1326.c lcd/u8x8_d_ssd1327.c lcd/u8x8_d_ssd1329.c lcd/u8x8_d_ssd1362.c lcd/u8x8_d_ssd1362z.c lcd/u8x8_d_ssd1363.c lcd/u8x8_d_ssd1606_172x72.c lcd/u8x8_d_ssd1607_200x200.c lcd/u8x8_d_st7302.c lcd/u8x8_d_st7305.c lcd/u8x8_d_st7511.c lcd/u8x8_d_st75160.c lcd/u8x8_d_st75161.c lcd/u8x8_d_st75256.c lcd/u8x8_d_st7528.c lcd/u8x8_d_st75320.c lcd/u8x8_d_st7539.c lcd/u8x8_d_st7565.c lcd/u8x8_d_st7567.c lcd/u8x8_d_st7571.c lcd/u8x8_d_st7586s_erc240160.c lcd/u8x8_d_st7586s_jlx320160.c lcd/u8x8_d_st7586s_jlx384160.c lcd/u8x8_d_st7586s_md240128.c lcd/u8x8_d_st7586s_s028hn118a.c lcd/u8x8_d_st7586s_ymc240160.c lcd/u8x8_d_st7588.c lcd/u8x8_d_st7920.c lcd/u8x8_d_stdio.c lcd/u8x8_d_t6963.c lcd/u8x8_d_uc1601.c lcd/u8x8_d_uc1604.c lcd/u8x8_d_uc1608.c lcd/u8x8_d_uc1609.c lcd/u8x8_d_uc1610.c lcd/u8x8_d_uc1611.c lcd/u8x8_d_uc1617.c lcd/u8x8_d_uc1628.c lcd/u8x8_d_uc1638.c lcd/u8x8_d_uc1698.c lcd/u8x8_d_uc1701_dogs102.c lcd/u8x8_d_uc1701_mini12864.c lcd/u8x8_debounce.c lcd/u8x8_display.c lcd/u8x8_fonts.c lcd/u8x8_gpio.c lcd/u8x8_input_value.c lcd/u8x8_message.c lcd/u8x8_selection_list.c lcd/u8x8_setup.c lcd/u8x8_string.c lcd/u8x8_u16toa.c lcd/u8x8_u8toa.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/lcd/main.o ${OBJECTDIR}/lcd/mui.o ${OBJECTDIR}/lcd/mui_u8g2.o ${OBJECTDIR}/lcd/u8g2_arc.o ${OBJECTDIR}/lcd/u8g2_bitmap.o ${OBJECTDIR}/lcd/u8g2_box.o ${OBJECTDIR}/lcd/u8g2_buffer.o ${OBJECTDIR}/lcd/u8g2_button.o ${OBJECTDIR}/lcd/u8g2_circle.o ${OBJECTDIR}/lcd/u8g2_cleardisplay.o ${OBJECTDIR}/lcd/u8g2_d_memory.o ${OBJECTDIR}/lcd/u8g2_d_setup.o ${OBJECTDIR}/lcd/u8g2_font.o ${OBJECTDIR}/lcd/u8g2_fonts.o ${OBJECTDIR}/lcd/u8g2_hvline.o ${OBJECTDIR}/lcd/u8g2_input_value.o ${OBJECTDIR}/lcd/u8g2_intersection.o ${OBJECTDIR}/lcd/u8g2_kerning.o ${OBJECTDIR}/lcd/u8g2_line.o ${OBJECTDIR}/lcd/u8g2_ll_hvline.o ${OBJECTDIR}/lcd/u8g2_message.o ${OBJECTDIR}/lcd/u8g2_polygon.o ${OBJECTDIR}/lcd/u8g2_selection_list.o ${OBJECTDIR}/lcd/u8g2_setup.o ${OBJECTDIR}/lcd/u8log.o ${OBJECTDIR}/lcd/u8log_u8g2.o ${OBJECTDIR}/lcd/u8log_u8x8.o ${OBJECTDIR}/lcd/u8x8_8x8.o ${OBJECTDIR}/lcd/u8x8_byte.o ${OBJECTDIR}/lcd/u8x8_cad.o ${OBJECTDIR}/lcd/u8x8_capture.o ${OBJECTDIR}/lcd/u8x8_d_a2printer.o ${OBJECTDIR}/lcd/u8x8_d_ch1120.o ${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o ${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o ${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o ${OBJECTDIR}/lcd/u8x8_d_gu800.o ${OBJECTDIR}/lcd/u8x8_d_hd44102.o ${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o ${OBJECTDIR}/lcd/u8x8_d_ist3020.o ${OBJECTDIR}/lcd/u8x8_d_ist3088.o ${OBJECTDIR}/lcd/u8x8_d_ist7920.o ${OBJECTDIR}/lcd/u8x8_d_ks0108.o ${OBJECTDIR}/lcd/u8x8_d_lc7981.o ${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o ${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o ${OBJECTDIR}/lcd/u8x8_d_max7219.o ${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o ${OBJECTDIR}/lcd/u8x8_d_pcf8812.o ${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o ${OBJECTDIR}/lcd/u8x8_d_s1d15300.o ${OBJECTDIR}/lcd/u8x8_d_s1d15721.o ${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o ${OBJECTDIR}/lcd/u8x8_d_sbn1661.o ${OBJECTDIR}/lcd/u8x8_d_sed1330.o ${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o ${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o ${OBJECTDIR}/lcd/u8x8_d_sh1107.o ${OBJECTDIR}/lcd/u8x8_d_sh1108.o ${OBJECTDIR}/lcd/u8x8_d_sh1122.o ${OBJECTDIR}/lcd/u8x8_d_ssd1305.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o ${OBJECTDIR}/lcd/u8x8_d_ssd1309.o ${OBJECTDIR}/lcd/u8x8_d_ssd1312.o ${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o ${OBJECTDIR}/lcd/u8x8_d_ssd1316.o ${OBJECTDIR}/lcd/u8x8_d_ssd1317.o ${OBJECTDIR}/lcd/u8x8_d_ssd1318.o ${OBJECTDIR}/lcd/u8x8_d_ssd1320.o ${OBJECTDIR}/lcd/u8x8_d_ssd1322.o ${OBJECTDIR}/lcd/u8x8_d_ssd1325.o ${OBJECTDIR}/lcd/u8x8_d_ssd1326.o ${OBJECTDIR}/lcd/u8x8_d_ssd1327.o ${OBJECTDIR}/lcd/u8x8_d_ssd1329.o ${OBJECTDIR}/lcd/u8x8_d_ssd1362.o ${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o ${OBJECTDIR}/lcd/u8x8_d_ssd1363.o ${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o ${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o ${OBJECTDIR}/lcd/u8x8_d_st7302.o ${OBJECTDIR}/lcd/u8x8_d_st7305.o ${OBJECTDIR}/lcd/u8x8_d_st7511.o ${OBJECTDIR}/lcd/u8x8_d_st75160.o ${OBJECTDIR}/lcd/u8x8_d_st75161.o ${OBJECTDIR}/lcd/u8x8_d_st75256.o ${OBJECTDIR}/lcd/u8x8_d_st7528.o ${OBJECTDIR}/lcd/u8x8_d_st75320.o ${OBJECTDIR}/lcd/u8x8_d_st7539.o ${OBJECTDIR}/lcd/u8x8_d_st7565.o ${OBJECTDIR}/lcd/u8x8_d_st7567.o ${OBJECTDIR}/lcd/u8x8_d_st7571.o ${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o ${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o ${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o ${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o ${OBJECTDIR}/lcd/u8x8_d_st7588.o ${OBJECTDIR}/lcd/u8x8_d_st7920.o ${OBJECTDIR}/lcd/u8x8_d_stdio.o ${OBJECTDIR}/lcd/u8x8_d_t6963.o ${OBJECTDIR}/lcd/u8x8_d_uc1601.o ${OBJECTDIR}/lcd/u8x8_d_uc1604.o ${OBJECTDIR}/lcd/u8x8_d_uc1608.o ${OBJECTDIR}/lcd/u8x8_d_uc1609.o ${OBJECTDIR}/lcd/u8x8_d_uc1610.o ${OBJECTDIR}/lcd/u8x8_d_uc1611.o ${OBJECTDIR}/lcd/u8x8_d_uc1617.o ${OBJECTDIR}/lcd/u8x8_d_uc1628.o ${OBJECTDIR}/lcd/u8x8_d_uc1638.o ${OBJECTDIR}/lcd/u8x8_d_uc1698.o ${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o ${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o ${OBJECTDIR}/lcd/u8x8_debounce.o ${OBJECTDIR}/lcd/u8x8_display.o ${OBJECTDIR}/lcd/u8x8_fonts.o ${OBJECTDIR}/lcd/u8x8_gpio.o ${OBJECTDIR}/lcd/u8x8_input_value.o ${OBJECTDIR}/lcd/u8x8_message.o ${OBJECTDIR}/lcd/u8x8_selection_list.o ${OBJECTDIR}/lcd/u8x8_setup.o ${OBJECTDIR}/lcd/u8x8_string.o ${OBJECTDIR}/lcd/u8x8_u16toa.o ${OBJECTDIR}/lcd/u8x8_u8toa.o
POSSIBLE_DEPFILES=${OBJECTDIR}/lcd/main.o.d ${OBJECTDIR}/lcd/mui.o.d ${OBJECTDIR}/lcd/mui_u8g2.o.d ${OBJECTDIR}/lcd/u8g2_arc.o.d ${OBJECTDIR}/lcd/u8g2_bitmap.o.d ${OBJECTDIR}/lcd/u8g2_box.o.d ${OBJECTDIR}/lcd/u8g2_buffer.o.d ${OBJECTDIR}/lcd/u8g2_button.o.d ${OBJECTDIR}/lcd/u8g2_circle.o.d ${OBJECTDIR}/lcd/u8g2_cleardisplay.o.d ${OBJECTDIR}/lcd/u8g2_d_memory.o.d ${OBJECTDIR}/lcd/u8g2_d_setup.o.d ${OBJECTDIR}/lcd/u8g2_font.o.d ${OBJECTDIR}/lcd/u8g2_fonts.o.d ${OBJECTDIR}/lcd/u8g2_hvline.o.d ${OBJECTDIR}/lcd/u8g2_input_value.o.d ${OBJECTDIR}/lcd/u8g2_intersection.o.d ${OBJECTDIR}/lcd/u8g2_kerning.o.d ${OBJECTDIR}/lcd/u8g2_line.o.d ${OBJECTDIR}/lcd/u8g2_ll_hvline.o.d ${OBJECTDIR}/lcd/u8g2_message.o.d ${OBJECTDIR}/lcd/u8g2_polygon.o.d ${OBJECTDIR}/lcd/u8g2_selection_list.o.d ${OBJECTDIR}/lcd/u8g2_setup.o.d ${OBJECTDIR}/lcd/u8log.o.d ${OBJECTDIR}/lcd/u8log_u8g2.o.d ${OBJECTDIR}/lcd/u8log_u8x8.o.d ${OBJECTDIR}/lcd/u8x8_8x8.o.d ${OBJECTDIR}/lcd/u8x8_byte.o.d ${OBJECTDIR}/lcd/u8x8_cad.o.d ${OBJECTDIR}/lcd/u8x8_capture.o.d ${OBJECTDIR}/lcd/u8x8_d_a2printer.o.d ${OBJECTDIR}/lcd/u8x8_d_ch1120.o.d ${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o.d ${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o.d ${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o.d ${OBJECTDIR}/lcd/u8x8_d_gu800.o.d ${OBJECTDIR}/lcd/u8x8_d_hd44102.o.d ${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o.d ${OBJECTDIR}/lcd/u8x8_d_ist3020.o.d ${OBJECTDIR}/lcd/u8x8_d_ist3088.o.d ${OBJECTDIR}/lcd/u8x8_d_ist7920.o.d ${OBJECTDIR}/lcd/u8x8_d_ks0108.o.d ${OBJECTDIR}/lcd/u8x8_d_lc7981.o.d ${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o.d ${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o.d ${OBJECTDIR}/lcd/u8x8_d_max7219.o.d ${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o.d ${OBJECTDIR}/lcd/u8x8_d_pcf8812.o.d ${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o.d ${OBJECTDIR}/lcd/u8x8_d_s1d15300.o.d ${OBJECTDIR}/lcd/u8x8_d_s1d15721.o.d ${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o.d ${OBJECTDIR}/lcd/u8x8_d_sbn1661.o.d ${OBJECTDIR}/lcd/u8x8_d_sed1330.o.d ${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o.d ${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o.d ${OBJECTDIR}/lcd/u8x8_d_sh1107.o.d ${OBJECTDIR}/lcd/u8x8_d_sh1108.o.d ${OBJECTDIR}/lcd/u8x8_d_sh1122.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1305.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1309.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1312.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1316.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1317.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1318.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1320.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1322.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1325.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1326.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1327.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1329.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1362.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1363.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o.d ${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o.d ${OBJECTDIR}/lcd/u8x8_d_st7302.o.d ${OBJECTDIR}/lcd/u8x8_d_st7305.o.d ${OBJECTDIR}/lcd/u8x8_d_st7511.o.d ${OBJECTDIR}/lcd/u8x8_d_st75160.o.d ${OBJECTDIR}/lcd/u8x8_d_st75161.o.d ${OBJECTDIR}/lcd/u8x8_d_st75256.o.d ${OBJECTDIR}/lcd/u8x8_d_st7528.o.d ${OBJECTDIR}/lcd/u8x8_d_st75320.o.d ${OBJECTDIR}/lcd/u8x8_d_st7539.o.d ${OBJECTDIR}/lcd/u8x8_d_st7565.o.d ${OBJECTDIR}/lcd/u8x8_d_st7567.o.d ${OBJECTDIR}/lcd/u8x8_d_st7571.o.d ${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o.d ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o.d ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o.d ${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o.d ${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o.d ${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o.d ${OBJECTDIR}/lcd/u8x8_d_st7588.o.d ${OBJECTDIR}/lcd/u8x8_d_st7920.o.d ${OBJECTDIR}/lcd/u8x8_d_stdio.o.d ${OBJECTDIR}/lcd/u8x8_d_t6963.o.d ${OBJECTDIR}/lcd/u8x8_d_uc1601.o.d ${OBJECTDIR}/lcd/u8x8_d_uc1604.o.d ${OBJECTDIR}/lcd/u8x8_d_uc1608.o.d ${OBJECTDIR}/lcd/u8x8_d_uc1609.o.d ${OBJECTDIR}/lcd/u8x8_d_uc1610.o.d ${OBJECTDIR}/lcd/u8x8_d_uc1611.o.d ${OBJECTDIR}/lcd/u8x8_d_uc1617.o.d ${OBJECTDIR}/lcd/u8x8_d_uc1628.o.d ${OBJECTDIR}/lcd/u8x8_d_uc1638.o.d ${OBJECTDIR}/lcd/u8x8_d_uc1698.o.d ${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o.d ${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o.d ${OBJECTDIR}/lcd/u8x8_debounce.o.d ${OBJECTDIR}/lcd/u8x8_display.o.d ${OBJECTDIR}/lcd/u8x8_fonts.o.d ${OBJECTDIR}/lcd/u8x8_gpio.o.d ${OBJECTDIR}/lcd/u8x8_input_value.o.d ${OBJECTDIR}/lcd/u8x8_message.o.d ${OBJECTDIR}/lcd/u8x8_selection_list.o.d ${OBJECTDIR}/lcd/u8x8_setup.o.d ${OBJECTDIR}/lcd/u8x8_string.o.d ${OBJECTDIR}/lcd/u8x8_u16toa.o.d ${OBJECTDIR}/lcd/u8x8_u8toa.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/lcd/main.o ${OBJECTDIR}/lcd/mui.o ${OBJECTDIR}/lcd/mui_u8g2.o ${OBJECTDIR}/lcd/u8g2_arc.o ${OBJECTDIR}/lcd/u8g2_bitmap.o ${OBJECTDIR}/lcd/u8g2_box.o ${OBJECTDIR}/lcd/u8g2_buffer.o ${OBJECTDIR}/lcd/u8g2_button.o ${OBJECTDIR}/lcd/u8g2_circle.o ${OBJECTDIR}/lcd/u8g2_cleardisplay.o ${OBJECTDIR}/lcd/u8g2_d_memory.o ${OBJECTDIR}/lcd/u8g2_d_setup.o ${OBJECTDIR}/lcd/u8g2_font.o ${OBJECTDIR}/lcd/u8g2_fonts.o ${OBJECTDIR}/lcd/u8g2_hvline.o ${OBJECTDIR}/lcd/u8g2_input_value.o ${OBJECTDIR}/lcd/u8g2_intersection.o ${OBJECTDIR}/lcd/u8g2_kerning.o ${OBJECTDIR}/lcd/u8g2_line.o ${OBJECTDIR}/lcd/u8g2_ll_hvline.o ${OBJECTDIR}/lcd/u8g2_message.o ${OBJECTDIR}/lcd/u8g2_polygon.o ${OBJECTDIR}/lcd/u8g2_selection_list.o ${OBJECTDIR}/lcd/u8g2_setup.o ${OBJECTDIR}/lcd/u8log.o ${OBJECTDIR}/lcd/u8log_u8g2.o ${OBJECTDIR}/lcd/u8log_u8x8.o ${OBJECTDIR}/lcd/u8x8_8x8.o ${OBJECTDIR}/lcd/u8x8_byte.o ${OBJECTDIR}/lcd/u8x8_cad.o ${OBJECTDIR}/lcd/u8x8_capture.o ${OBJECTDIR}/lcd/u8x8_d_a2printer.o ${OBJECTDIR}/lcd/u8x8_d_ch1120.o ${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o ${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o ${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o ${OBJECTDIR}/lcd/u8x8_d_gu800.o ${OBJECTDIR}/lcd/u8x8_d_hd44102.o ${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o ${OBJECTDIR}/lcd/u8x8_d_ist3020.o ${OBJECTDIR}/lcd/u8x8_d_ist3088.o ${OBJECTDIR}/lcd/u8x8_d_ist7920.o ${OBJECTDIR}/lcd/u8x8_d_ks0108.o ${OBJECTDIR}/lcd/u8x8_d_lc7981.o ${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o ${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o ${OBJECTDIR}/lcd/u8x8_d_max7219.o ${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o ${OBJECTDIR}/lcd/u8x8_d_pcf8812.o ${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o ${OBJECTDIR}/lcd/u8x8_d_s1d15300.o ${OBJECTDIR}/lcd/u8x8_d_s1d15721.o ${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o ${OBJECTDIR}/lcd/u8x8_d_sbn1661.o ${OBJECTDIR}/lcd/u8x8_d_sed1330.o ${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o ${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o ${OBJECTDIR}/lcd/u8x8_d_sh1107.o ${OBJECTDIR}/lcd/u8x8_d_sh1108.o ${OBJECTDIR}/lcd/u8x8_d_sh1122.o ${OBJECTDIR}/lcd/u8x8_d_ssd1305.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o ${OBJECTDIR}/lcd/u8x8_d_ssd1309.o ${OBJECTDIR}/lcd/u8x8_d_ssd1312.o ${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o ${OBJECTDIR}/lcd/u8x8_d_ssd1316.o ${OBJECTDIR}/lcd/u8x8_d_ssd1317.o ${OBJECTDIR}/lcd/u8x8_d_ssd1318.o ${OBJECTDIR}/lcd/u8x8_d_ssd1320.o ${OBJECTDIR}/lcd/u8x8_d_ssd1322.o ${OBJECTDIR}/lcd/u8x8_d_ssd1325.o ${OBJECTDIR}/lcd/u8x8_d_ssd1326.o ${OBJECTDIR}/lcd/u8x8_d_ssd1327.o ${OBJECTDIR}/lcd/u8x8_d_ssd1329.o ${OBJECTDIR}/lcd/u8x8_d_ssd1362.o ${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o ${OBJECTDIR}/lcd/u8x8_d_ssd1363.o ${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o ${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o ${OBJECTDIR}/lcd/u8x8_d_st7302.o ${OBJECTDIR}/lcd/u8x8_d_st7305.o ${OBJECTDIR}/lcd/u8x8_d_st7511.o ${OBJECTDIR}/lcd/u8x8_d_st75160.o ${OBJECTDIR}/lcd/u8x8_d_st75161.o ${OBJECTDIR}/lcd/u8x8_d_st75256.o ${OBJECTDIR}/lcd/u8x8_d_st7528.o ${OBJECTDIR}/lcd/u8x8_d_st75320.o ${OBJECTDIR}/lcd/u8x8_d_st7539.o ${OBJECTDIR}/lcd/u8x8_d_st7565.o ${OBJECTDIR}/lcd/u8x8_d_st7567.o ${OBJECTDIR}/lcd/u8x8_d_st7571.o ${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o ${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o ${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o ${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o ${OBJECTDIR}/lcd/u8x8_d_st7588.o ${OBJECTDIR}/lcd/u8x8_d_st7920.o ${OBJECTDIR}/lcd/u8x8_d_stdio.o ${OBJECTDIR}/lcd/u8x8_d_t6963.o ${OBJECTDIR}/lcd/u8x8_d_uc1601.o ${OBJECTDIR}/lcd/u8x8_d_uc1604.o ${OBJECTDIR}/lcd/u8x8_d_uc1608.o ${OBJECTDIR}/lcd/u8x8_d_uc1609.o ${OBJECTDIR}/lcd/u8x8_d_uc1610.o ${OBJECTDIR}/lcd/u8x8_d_uc1611.o ${OBJECTDIR}/lcd/u8x8_d_uc1617.o ${OBJECTDIR}/lcd/u8x8_d_uc1628.o ${OBJECTDIR}/lcd/u8x8_d_uc1638.o ${OBJECTDIR}/lcd/u8x8_d_uc1698.o ${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o ${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o ${OBJECTDIR}/lcd/u8x8_debounce.o ${OBJECTDIR}/lcd/u8x8_display.o ${OBJECTDIR}/lcd/u8x8_fonts.o ${OBJECTDIR}/lcd/u8x8_gpio.o ${OBJECTDIR}/lcd/u8x8_input_value.o ${OBJECTDIR}/lcd/u8x8_message.o ${OBJECTDIR}/lcd/u8x8_selection_list.o ${OBJECTDIR}/lcd/u8x8_setup.o ${OBJECTDIR}/lcd/u8x8_string.o ${OBJECTDIR}/lcd/u8x8_u16toa.o ${OBJECTDIR}/lcd/u8x8_u8toa.o

# Source Files
SOURCEFILES=lcd/main.c lcd/mui.c lcd/mui_u8g2.c lcd/u8g2_arc.c lcd/u8g2_bitmap.c lcd/u8g2_box.c lcd/u8g2_buffer.c lcd/u8g2_button.c lcd/u8g2_circle.c lcd/u8g2_cleardisplay.c lcd/u8g2_d_memory.c lcd/u8g2_d_setup.c lcd/u8g2_font.c lcd/u8g2_fonts.c lcd/u8g2_hvline.c lcd/u8g2_input_value.c lcd/u8g2_intersection.c lcd/u8g2_kerning.c lcd/u8g2_line.c lcd/u8g2_ll_hvline.c lcd/u8g2_message.c lcd/u8g2_polygon.c lcd/u8g2_selection_list.c lcd/u8g2_setup.c lcd/u8log.c lcd/u8log_u8g2.c lcd/u8log_u8x8.c lcd/u8x8_8x8.c lcd/u8x8_byte.c lcd/u8x8_cad.c lcd/u8x8_capture.c lcd/u8x8_d_a2printer.c lcd/u8x8_d_ch1120.c lcd/u8x8_d_gp1247ai.c lcd/u8x8_d_gp1287ai.c lcd/u8x8_d_gp1294ai.c lcd/u8x8_d_gu800.c lcd/u8x8_d_hd44102.c lcd/u8x8_d_il3820_296x128.c lcd/u8x8_d_ist3020.c lcd/u8x8_d_ist3088.c lcd/u8x8_d_ist7920.c lcd/u8x8_d_ks0108.c lcd/u8x8_d_lc7981.c lcd/u8x8_d_ld7032_60x32.c lcd/u8x8_d_ls013b7dh03.c lcd/u8x8_d_max7219.c lcd/u8x8_d_pcd8544_84x48.c lcd/u8x8_d_pcf8812.c lcd/u8x8_d_pcf8814_hx1230.c lcd/u8x8_d_s1d15300.c lcd/u8x8_d_s1d15721.c lcd/u8x8_d_s1d15e06.c lcd/u8x8_d_sbn1661.c lcd/u8x8_d_sed1330.c lcd/u8x8_d_sh1106_64x32.c lcd/u8x8_d_sh1106_72x40.c lcd/u8x8_d_sh1107.c lcd/u8x8_d_sh1108.c lcd/u8x8_d_sh1122.c lcd/u8x8_d_ssd1305.c lcd/u8x8_d_ssd1306_128x32.c lcd/u8x8_d_ssd1306_128x64_noname.c lcd/u8x8_d_ssd1306_2040x16.c lcd/u8x8_d_ssd1306_48x64.c lcd/u8x8_d_ssd1306_64x32.c lcd/u8x8_d_ssd1306_64x48.c lcd/u8x8_d_ssd1306_72x40.c lcd/u8x8_d_ssd1306_96x16.c lcd/u8x8_d_ssd1306_96x40.c lcd/u8x8_d_ssd1309.c lcd/u8x8_d_ssd1312.c lcd/u8x8_d_ssd1315_128x64_noname.c lcd/u8x8_d_ssd1316.c lcd/u8x8_d_ssd1317.c lcd/u8x8_d_ssd1318.c lcd/u8x8_d_ssd1320.c lcd/u8x8_d_ssd1322.c lcd/u8x8_d_ssd1325.c lcd/u8x8_d_ssd1326.c lcd/u8x8_d_ssd1327.c lcd/u8x8_d_ssd1329.c lcd/u8x8_d_ssd1362.c lcd/u8x8_d_ssd1362z.c lcd/u8x8_d_ssd1363.c lcd/u8x8_d_ssd1606_172x72.c lcd/u8x8_d_ssd1607_200x200.c lcd/u8x8_d_st7302.c lcd/u8x8_d_st7305.c lcd/u8x8_d_st7511.c lcd/u8x8_d_st75160.c lcd/u8x8_d_st75161.c lcd/u8x8_d_st75256.c lcd/u8x8_d_st7528.c lcd/u8x8_d_st75320.c lcd/u8x8_d_st7539.c lcd/u8x8_d_st7565.c lcd/u8x8_d_st7567.c lcd/u8x8_d_st7571.c lcd/u8x8_d_st7586s_erc240160.c lcd/u8x8_d_st7586s_jlx320160.c lcd/u8x8_d_st7586s_jlx384160.c lcd/u8x8_d_st7586s_md240128.c lcd/u8x8_d_st7586s_s028hn118a.c lcd/u8x8_d_st7586s_ymc240160.c lcd/u8x8_d_st7588.c lcd/u8x8_d_st7920.c lcd/u8x8_d_stdio.c lcd/u8x8_d_t6963.c lcd/u8x8_d_uc1601.c lcd/u8x8_d_uc1604.c lcd/u8x8_d_uc1608.c lcd/u8x8_d_uc1609.c lcd/u8x8_d_uc1610.c lcd/u8x8_d_uc1611.c lcd/u8x8_d_uc1617.c lcd/u8x8_d_uc1628.c lcd/u8x8_d_uc1638.c lcd/u8x8_d_uc1698.c lcd/u8x8_d_uc1701_dogs102.c lcd/u8x8_d_uc1701_mini12864.c lcd/u8x8_debounce.c lcd/u8x8_display.c lcd/u8x8_fonts.c lcd/u8x8_gpio.c lcd/u8x8_input_value.c lcd/u8x8_message.c lcd/u8x8_selection_list.c lcd/u8x8_setup.c lcd/u8x8_string.c lcd/u8x8_u16toa.c lcd/u8x8_u8toa.c

# Pack Options 
PACK_COMPILER_OPTIONS=-I "${DFP_DIR}/include"
PACK_COMMON_OPTIONS=-B "${DFP_DIR}/gcc/dev/atmega328p"



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/Talking_to_gui.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATmega328P
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/lcd/main.o: lcd/main.c  .generated_files/flags/default/f2a4ae99113f0368e249e44d16a5d03c7510a47b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/main.o.d 
	@${RM} ${OBJECTDIR}/lcd/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/main.o.d" -MT "${OBJECTDIR}/lcd/main.o.d" -MT ${OBJECTDIR}/lcd/main.o  -o ${OBJECTDIR}/lcd/main.o lcd/main.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/mui.o: lcd/mui.c  .generated_files/flags/default/d830d81449cec98672669bd9d082c5caab546ece .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/mui.o.d 
	@${RM} ${OBJECTDIR}/lcd/mui.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/mui.o.d" -MT "${OBJECTDIR}/lcd/mui.o.d" -MT ${OBJECTDIR}/lcd/mui.o  -o ${OBJECTDIR}/lcd/mui.o lcd/mui.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/mui_u8g2.o: lcd/mui_u8g2.c  .generated_files/flags/default/88238778adb6fe33a90121f3e50243795a64971f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/mui_u8g2.o.d 
	@${RM} ${OBJECTDIR}/lcd/mui_u8g2.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/mui_u8g2.o.d" -MT "${OBJECTDIR}/lcd/mui_u8g2.o.d" -MT ${OBJECTDIR}/lcd/mui_u8g2.o  -o ${OBJECTDIR}/lcd/mui_u8g2.o lcd/mui_u8g2.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_arc.o: lcd/u8g2_arc.c  .generated_files/flags/default/4ff91cfc79dd83a7d6467b08a7544187b03b04d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_arc.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_arc.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_arc.o.d" -MT "${OBJECTDIR}/lcd/u8g2_arc.o.d" -MT ${OBJECTDIR}/lcd/u8g2_arc.o  -o ${OBJECTDIR}/lcd/u8g2_arc.o lcd/u8g2_arc.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_bitmap.o: lcd/u8g2_bitmap.c  .generated_files/flags/default/2d7b92338f317f1e73385c0e9948e5c304c4d185 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_bitmap.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_bitmap.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_bitmap.o.d" -MT "${OBJECTDIR}/lcd/u8g2_bitmap.o.d" -MT ${OBJECTDIR}/lcd/u8g2_bitmap.o  -o ${OBJECTDIR}/lcd/u8g2_bitmap.o lcd/u8g2_bitmap.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_box.o: lcd/u8g2_box.c  .generated_files/flags/default/94109bb7d0569148ecfa37805ca3c4ababd3e2eb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_box.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_box.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_box.o.d" -MT "${OBJECTDIR}/lcd/u8g2_box.o.d" -MT ${OBJECTDIR}/lcd/u8g2_box.o  -o ${OBJECTDIR}/lcd/u8g2_box.o lcd/u8g2_box.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_buffer.o: lcd/u8g2_buffer.c  .generated_files/flags/default/a687565df5f98dcfe6a8c124464a87160d5aa83e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_buffer.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_buffer.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_buffer.o.d" -MT "${OBJECTDIR}/lcd/u8g2_buffer.o.d" -MT ${OBJECTDIR}/lcd/u8g2_buffer.o  -o ${OBJECTDIR}/lcd/u8g2_buffer.o lcd/u8g2_buffer.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_button.o: lcd/u8g2_button.c  .generated_files/flags/default/bca46f9546ecd4134913fef39f3084f9e5be6695 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_button.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_button.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_button.o.d" -MT "${OBJECTDIR}/lcd/u8g2_button.o.d" -MT ${OBJECTDIR}/lcd/u8g2_button.o  -o ${OBJECTDIR}/lcd/u8g2_button.o lcd/u8g2_button.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_circle.o: lcd/u8g2_circle.c  .generated_files/flags/default/53e665c02b0e35217ab7ca817b0b977fe65b98e5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_circle.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_circle.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_circle.o.d" -MT "${OBJECTDIR}/lcd/u8g2_circle.o.d" -MT ${OBJECTDIR}/lcd/u8g2_circle.o  -o ${OBJECTDIR}/lcd/u8g2_circle.o lcd/u8g2_circle.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_cleardisplay.o: lcd/u8g2_cleardisplay.c  .generated_files/flags/default/83e86ae5c4076f32a59bfee56877d2ce363cdef6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_cleardisplay.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_cleardisplay.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_cleardisplay.o.d" -MT "${OBJECTDIR}/lcd/u8g2_cleardisplay.o.d" -MT ${OBJECTDIR}/lcd/u8g2_cleardisplay.o  -o ${OBJECTDIR}/lcd/u8g2_cleardisplay.o lcd/u8g2_cleardisplay.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_d_memory.o: lcd/u8g2_d_memory.c  .generated_files/flags/default/b85e212d31499c29ce705d6e1f663acf6ff6e7a2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_d_memory.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_d_memory.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_d_memory.o.d" -MT "${OBJECTDIR}/lcd/u8g2_d_memory.o.d" -MT ${OBJECTDIR}/lcd/u8g2_d_memory.o  -o ${OBJECTDIR}/lcd/u8g2_d_memory.o lcd/u8g2_d_memory.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_d_setup.o: lcd/u8g2_d_setup.c  .generated_files/flags/default/ef112ed2532e4b6ad0420baa9a1c21d4e9e52d51 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_d_setup.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_d_setup.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_d_setup.o.d" -MT "${OBJECTDIR}/lcd/u8g2_d_setup.o.d" -MT ${OBJECTDIR}/lcd/u8g2_d_setup.o  -o ${OBJECTDIR}/lcd/u8g2_d_setup.o lcd/u8g2_d_setup.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_font.o: lcd/u8g2_font.c  .generated_files/flags/default/223174d56e18e5d4214925db6d0c5b42e87e7fc9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_font.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_font.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_font.o.d" -MT "${OBJECTDIR}/lcd/u8g2_font.o.d" -MT ${OBJECTDIR}/lcd/u8g2_font.o  -o ${OBJECTDIR}/lcd/u8g2_font.o lcd/u8g2_font.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_fonts.o: lcd/u8g2_fonts.c  .generated_files/flags/default/74d0d59cb30ffc588142f86f31f7e4e501046ca2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_fonts.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_fonts.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_fonts.o.d" -MT "${OBJECTDIR}/lcd/u8g2_fonts.o.d" -MT ${OBJECTDIR}/lcd/u8g2_fonts.o  -o ${OBJECTDIR}/lcd/u8g2_fonts.o lcd/u8g2_fonts.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_hvline.o: lcd/u8g2_hvline.c  .generated_files/flags/default/17b3d2f81aebdac7b430001f9d6bb5b5e014bee .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_hvline.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_hvline.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_hvline.o.d" -MT "${OBJECTDIR}/lcd/u8g2_hvline.o.d" -MT ${OBJECTDIR}/lcd/u8g2_hvline.o  -o ${OBJECTDIR}/lcd/u8g2_hvline.o lcd/u8g2_hvline.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_input_value.o: lcd/u8g2_input_value.c  .generated_files/flags/default/3ced740104364922ab86824111a34ffe39b93159 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_input_value.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_input_value.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_input_value.o.d" -MT "${OBJECTDIR}/lcd/u8g2_input_value.o.d" -MT ${OBJECTDIR}/lcd/u8g2_input_value.o  -o ${OBJECTDIR}/lcd/u8g2_input_value.o lcd/u8g2_input_value.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_intersection.o: lcd/u8g2_intersection.c  .generated_files/flags/default/a937fd2f300a8674eb4eada8bd5a752e7525955d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_intersection.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_intersection.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_intersection.o.d" -MT "${OBJECTDIR}/lcd/u8g2_intersection.o.d" -MT ${OBJECTDIR}/lcd/u8g2_intersection.o  -o ${OBJECTDIR}/lcd/u8g2_intersection.o lcd/u8g2_intersection.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_kerning.o: lcd/u8g2_kerning.c  .generated_files/flags/default/7c75c939cdad483b380474461846be971e72cd98 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_kerning.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_kerning.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_kerning.o.d" -MT "${OBJECTDIR}/lcd/u8g2_kerning.o.d" -MT ${OBJECTDIR}/lcd/u8g2_kerning.o  -o ${OBJECTDIR}/lcd/u8g2_kerning.o lcd/u8g2_kerning.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_line.o: lcd/u8g2_line.c  .generated_files/flags/default/15e4b5f7dc78d9867d24a4e35e9e7553ce901f10 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_line.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_line.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_line.o.d" -MT "${OBJECTDIR}/lcd/u8g2_line.o.d" -MT ${OBJECTDIR}/lcd/u8g2_line.o  -o ${OBJECTDIR}/lcd/u8g2_line.o lcd/u8g2_line.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_ll_hvline.o: lcd/u8g2_ll_hvline.c  .generated_files/flags/default/e60b1ba86bfcb645cd2cd54ee48429043c26486e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_ll_hvline.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_ll_hvline.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_ll_hvline.o.d" -MT "${OBJECTDIR}/lcd/u8g2_ll_hvline.o.d" -MT ${OBJECTDIR}/lcd/u8g2_ll_hvline.o  -o ${OBJECTDIR}/lcd/u8g2_ll_hvline.o lcd/u8g2_ll_hvline.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_message.o: lcd/u8g2_message.c  .generated_files/flags/default/12728c1d195e8c9ef1e72d2fc404f8e65798502f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_message.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_message.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_message.o.d" -MT "${OBJECTDIR}/lcd/u8g2_message.o.d" -MT ${OBJECTDIR}/lcd/u8g2_message.o  -o ${OBJECTDIR}/lcd/u8g2_message.o lcd/u8g2_message.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_polygon.o: lcd/u8g2_polygon.c  .generated_files/flags/default/c92a1c7ec734d6e7cf00b6d728c077093cdba7e0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_polygon.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_polygon.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_polygon.o.d" -MT "${OBJECTDIR}/lcd/u8g2_polygon.o.d" -MT ${OBJECTDIR}/lcd/u8g2_polygon.o  -o ${OBJECTDIR}/lcd/u8g2_polygon.o lcd/u8g2_polygon.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_selection_list.o: lcd/u8g2_selection_list.c  .generated_files/flags/default/2cea434aa64ee9845bd6d7fb5441cf452415fed4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_selection_list.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_selection_list.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_selection_list.o.d" -MT "${OBJECTDIR}/lcd/u8g2_selection_list.o.d" -MT ${OBJECTDIR}/lcd/u8g2_selection_list.o  -o ${OBJECTDIR}/lcd/u8g2_selection_list.o lcd/u8g2_selection_list.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_setup.o: lcd/u8g2_setup.c  .generated_files/flags/default/85640a871c0bc9006fe03e4b71f2532f111c052a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_setup.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_setup.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_setup.o.d" -MT "${OBJECTDIR}/lcd/u8g2_setup.o.d" -MT ${OBJECTDIR}/lcd/u8g2_setup.o  -o ${OBJECTDIR}/lcd/u8g2_setup.o lcd/u8g2_setup.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8log.o: lcd/u8log.c  .generated_files/flags/default/dc2634fbda720ee594ae51c58fc6c6bc1d8845d4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8log.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8log.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8log.o.d" -MT "${OBJECTDIR}/lcd/u8log.o.d" -MT ${OBJECTDIR}/lcd/u8log.o  -o ${OBJECTDIR}/lcd/u8log.o lcd/u8log.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8log_u8g2.o: lcd/u8log_u8g2.c  .generated_files/flags/default/24c250292e9d2493a1cff21efa18616a5c2829cc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8log_u8g2.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8log_u8g2.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8log_u8g2.o.d" -MT "${OBJECTDIR}/lcd/u8log_u8g2.o.d" -MT ${OBJECTDIR}/lcd/u8log_u8g2.o  -o ${OBJECTDIR}/lcd/u8log_u8g2.o lcd/u8log_u8g2.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8log_u8x8.o: lcd/u8log_u8x8.c  .generated_files/flags/default/c29a6c5118eabe706af35e90c1ba71b2f216851 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8log_u8x8.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8log_u8x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8log_u8x8.o.d" -MT "${OBJECTDIR}/lcd/u8log_u8x8.o.d" -MT ${OBJECTDIR}/lcd/u8log_u8x8.o  -o ${OBJECTDIR}/lcd/u8log_u8x8.o lcd/u8log_u8x8.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_8x8.o: lcd/u8x8_8x8.c  .generated_files/flags/default/452bb3bec79a75d21d03abc7a9b484512adccfc4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_8x8.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_8x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_8x8.o.d" -MT "${OBJECTDIR}/lcd/u8x8_8x8.o.d" -MT ${OBJECTDIR}/lcd/u8x8_8x8.o  -o ${OBJECTDIR}/lcd/u8x8_8x8.o lcd/u8x8_8x8.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_byte.o: lcd/u8x8_byte.c  .generated_files/flags/default/a23ec0ffc371f47aff256b9a6e1a1c091c0696d7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_byte.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_byte.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_byte.o.d" -MT "${OBJECTDIR}/lcd/u8x8_byte.o.d" -MT ${OBJECTDIR}/lcd/u8x8_byte.o  -o ${OBJECTDIR}/lcd/u8x8_byte.o lcd/u8x8_byte.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_cad.o: lcd/u8x8_cad.c  .generated_files/flags/default/37bd33b5c7b7d1880bae1dd4c1822db787407d99 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_cad.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_cad.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_cad.o.d" -MT "${OBJECTDIR}/lcd/u8x8_cad.o.d" -MT ${OBJECTDIR}/lcd/u8x8_cad.o  -o ${OBJECTDIR}/lcd/u8x8_cad.o lcd/u8x8_cad.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_capture.o: lcd/u8x8_capture.c  .generated_files/flags/default/7625074a829503adba9db45a8757bcbbfd4aae22 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_capture.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_capture.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_capture.o.d" -MT "${OBJECTDIR}/lcd/u8x8_capture.o.d" -MT ${OBJECTDIR}/lcd/u8x8_capture.o  -o ${OBJECTDIR}/lcd/u8x8_capture.o lcd/u8x8_capture.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_a2printer.o: lcd/u8x8_d_a2printer.c  .generated_files/flags/default/f3e12615ae78548632d10394e6902858686cdee9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_a2printer.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_a2printer.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_a2printer.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_a2printer.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_a2printer.o  -o ${OBJECTDIR}/lcd/u8x8_d_a2printer.o lcd/u8x8_d_a2printer.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ch1120.o: lcd/u8x8_d_ch1120.c  .generated_files/flags/default/11029173466c581c74e50a616ef70ca609fd112 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ch1120.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ch1120.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ch1120.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ch1120.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ch1120.o  -o ${OBJECTDIR}/lcd/u8x8_d_ch1120.o lcd/u8x8_d_ch1120.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o: lcd/u8x8_d_gp1247ai.c  .generated_files/flags/default/b319421bcf3180db0b12cfe480bb694936c10859 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o  -o ${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o lcd/u8x8_d_gp1247ai.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o: lcd/u8x8_d_gp1287ai.c  .generated_files/flags/default/103346e51f8ad33dde6395d2589f790e6905b5a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o  -o ${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o lcd/u8x8_d_gp1287ai.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o: lcd/u8x8_d_gp1294ai.c  .generated_files/flags/default/b6e23b7be59c047673e2d79ca0fcec939db4d23b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o  -o ${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o lcd/u8x8_d_gp1294ai.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_gu800.o: lcd/u8x8_d_gu800.c  .generated_files/flags/default/7a4864432a6848a3c090e2d3f8551ba04ff888e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gu800.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gu800.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_gu800.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_gu800.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_gu800.o  -o ${OBJECTDIR}/lcd/u8x8_d_gu800.o lcd/u8x8_d_gu800.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_hd44102.o: lcd/u8x8_d_hd44102.c  .generated_files/flags/default/adf704f08e124c8e9f48b1ea00842218811fd016 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_hd44102.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_hd44102.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_hd44102.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_hd44102.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_hd44102.o  -o ${OBJECTDIR}/lcd/u8x8_d_hd44102.o lcd/u8x8_d_hd44102.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o: lcd/u8x8_d_il3820_296x128.c  .generated_files/flags/default/793ecb3383f1e79a6f3404107cb62d9ec4af927e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o  -o ${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o lcd/u8x8_d_il3820_296x128.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ist3020.o: lcd/u8x8_d_ist3020.c  .generated_files/flags/default/b8b2f64526f878dadcf063746b663ef2b9982181 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ist3020.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ist3020.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ist3020.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ist3020.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ist3020.o  -o ${OBJECTDIR}/lcd/u8x8_d_ist3020.o lcd/u8x8_d_ist3020.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ist3088.o: lcd/u8x8_d_ist3088.c  .generated_files/flags/default/9d12c7cac719412823a8f0ed1bcd23a83876c753 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ist3088.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ist3088.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ist3088.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ist3088.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ist3088.o  -o ${OBJECTDIR}/lcd/u8x8_d_ist3088.o lcd/u8x8_d_ist3088.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ist7920.o: lcd/u8x8_d_ist7920.c  .generated_files/flags/default/4ecb70c810b14ed71583369dce501c640dcecf8c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ist7920.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ist7920.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ist7920.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ist7920.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ist7920.o  -o ${OBJECTDIR}/lcd/u8x8_d_ist7920.o lcd/u8x8_d_ist7920.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ks0108.o: lcd/u8x8_d_ks0108.c  .generated_files/flags/default/dbbe1eb1918186c7a99a0dd73918bece716c6255 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ks0108.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ks0108.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ks0108.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ks0108.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ks0108.o  -o ${OBJECTDIR}/lcd/u8x8_d_ks0108.o lcd/u8x8_d_ks0108.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_lc7981.o: lcd/u8x8_d_lc7981.c  .generated_files/flags/default/3b5dc0d4db20fe780e09f241219ae321721bba78 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_lc7981.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_lc7981.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_lc7981.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_lc7981.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_lc7981.o  -o ${OBJECTDIR}/lcd/u8x8_d_lc7981.o lcd/u8x8_d_lc7981.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o: lcd/u8x8_d_ld7032_60x32.c  .generated_files/flags/default/5e5b5c3eb9265c74da4708ab375f90f8243823a6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o  -o ${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o lcd/u8x8_d_ld7032_60x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o: lcd/u8x8_d_ls013b7dh03.c  .generated_files/flags/default/c1912593e6831d8e09b9e58e57b06a5f33d2f15f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o  -o ${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o lcd/u8x8_d_ls013b7dh03.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_max7219.o: lcd/u8x8_d_max7219.c  .generated_files/flags/default/e1098719637386d8389882fd4d1a98b58daf2f59 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_max7219.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_max7219.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_max7219.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_max7219.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_max7219.o  -o ${OBJECTDIR}/lcd/u8x8_d_max7219.o lcd/u8x8_d_max7219.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o: lcd/u8x8_d_pcd8544_84x48.c  .generated_files/flags/default/3d773f39afac00ee51fd930eab6f93b8d4efbebd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o  -o ${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o lcd/u8x8_d_pcd8544_84x48.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_pcf8812.o: lcd/u8x8_d_pcf8812.c  .generated_files/flags/default/1d4963bb19b2c0d0ad56e63db094a29d2d367fa0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_pcf8812.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_pcf8812.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_pcf8812.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_pcf8812.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_pcf8812.o  -o ${OBJECTDIR}/lcd/u8x8_d_pcf8812.o lcd/u8x8_d_pcf8812.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o: lcd/u8x8_d_pcf8814_hx1230.c  .generated_files/flags/default/a9c4751965fba23f967e32fbbc814adb59c7fd61 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o  -o ${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o lcd/u8x8_d_pcf8814_hx1230.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_s1d15300.o: lcd/u8x8_d_s1d15300.c  .generated_files/flags/default/cb8a14aface02ea512610f6ff8b7bbc7fdb81157 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_s1d15300.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_s1d15300.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_s1d15300.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_s1d15300.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_s1d15300.o  -o ${OBJECTDIR}/lcd/u8x8_d_s1d15300.o lcd/u8x8_d_s1d15300.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_s1d15721.o: lcd/u8x8_d_s1d15721.c  .generated_files/flags/default/77c68df5cd9b1ffd38717c7b272086b87290b41e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_s1d15721.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_s1d15721.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_s1d15721.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_s1d15721.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_s1d15721.o  -o ${OBJECTDIR}/lcd/u8x8_d_s1d15721.o lcd/u8x8_d_s1d15721.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o: lcd/u8x8_d_s1d15e06.c  .generated_files/flags/default/acce54ec625f84902c8a71b217c28cb46809f167 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o  -o ${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o lcd/u8x8_d_s1d15e06.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sbn1661.o: lcd/u8x8_d_sbn1661.c  .generated_files/flags/default/edd6d081cd981883323c4e8f5bc9ca0da23ac5e8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sbn1661.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sbn1661.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sbn1661.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sbn1661.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sbn1661.o  -o ${OBJECTDIR}/lcd/u8x8_d_sbn1661.o lcd/u8x8_d_sbn1661.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sed1330.o: lcd/u8x8_d_sed1330.c  .generated_files/flags/default/81e1109fa6629c3cb33de574f89bd40e47699e4b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sed1330.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sed1330.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sed1330.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sed1330.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sed1330.o  -o ${OBJECTDIR}/lcd/u8x8_d_sed1330.o lcd/u8x8_d_sed1330.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o: lcd/u8x8_d_sh1106_64x32.c  .generated_files/flags/default/4d075f3821c042efe8857c3fc45685dfb7816a41 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o  -o ${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o lcd/u8x8_d_sh1106_64x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o: lcd/u8x8_d_sh1106_72x40.c  .generated_files/flags/default/c0f006ddd1b830055e337b5f65968d84e5fc486e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o  -o ${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o lcd/u8x8_d_sh1106_72x40.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sh1107.o: lcd/u8x8_d_sh1107.c  .generated_files/flags/default/df6b0134caff2845b146284ad8e313858901af17 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1107.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1107.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sh1107.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sh1107.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sh1107.o  -o ${OBJECTDIR}/lcd/u8x8_d_sh1107.o lcd/u8x8_d_sh1107.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sh1108.o: lcd/u8x8_d_sh1108.c  .generated_files/flags/default/b92e3b5292c9c63b28c97f19bf34ff56c1800b1b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1108.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1108.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sh1108.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sh1108.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sh1108.o  -o ${OBJECTDIR}/lcd/u8x8_d_sh1108.o lcd/u8x8_d_sh1108.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sh1122.o: lcd/u8x8_d_sh1122.c  .generated_files/flags/default/5874309e1065b6ee5e6a9eb5f57c6f18b0fbb1d5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1122.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1122.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sh1122.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sh1122.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sh1122.o  -o ${OBJECTDIR}/lcd/u8x8_d_sh1122.o lcd/u8x8_d_sh1122.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1305.o: lcd/u8x8_d_ssd1305.c  .generated_files/flags/default/fecdbc84a1a26981b21d428085c5b9e0c0859d36 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1305.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1305.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1305.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1305.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1305.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1305.o lcd/u8x8_d_ssd1305.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o: lcd/u8x8_d_ssd1306_128x32.c  .generated_files/flags/default/3e703d4b5f5542ab04c5fec67eddd5d1ba454dd5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o lcd/u8x8_d_ssd1306_128x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o: lcd/u8x8_d_ssd1306_128x64_noname.c  .generated_files/flags/default/688c9fb3f4bed7b5912f470f17c14590e8704c12 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o lcd/u8x8_d_ssd1306_128x64_noname.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o: lcd/u8x8_d_ssd1306_2040x16.c  .generated_files/flags/default/e123667d9642c2dec08e0e1fbbd05531adcba70d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o lcd/u8x8_d_ssd1306_2040x16.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o: lcd/u8x8_d_ssd1306_48x64.c  .generated_files/flags/default/723b8d3a83f8460e422b47a82ad71613e5c0d81f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o lcd/u8x8_d_ssd1306_48x64.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o: lcd/u8x8_d_ssd1306_64x32.c  .generated_files/flags/default/ed21135d9df502fe2b13eea54bfa907c9085e1e7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o lcd/u8x8_d_ssd1306_64x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o: lcd/u8x8_d_ssd1306_64x48.c  .generated_files/flags/default/67c174605bd5672bc21656323ef76621dc32c6d9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o lcd/u8x8_d_ssd1306_64x48.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o: lcd/u8x8_d_ssd1306_72x40.c  .generated_files/flags/default/bf06b2b338c4172ab034930f0f081b1f48bb6d50 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o lcd/u8x8_d_ssd1306_72x40.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o: lcd/u8x8_d_ssd1306_96x16.c  .generated_files/flags/default/f1f257888549c589edce242e488c00d235b8df36 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o lcd/u8x8_d_ssd1306_96x16.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o: lcd/u8x8_d_ssd1306_96x40.c  .generated_files/flags/default/621cbe8ba5c71426ae71924a141378da194a7f9c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o lcd/u8x8_d_ssd1306_96x40.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1309.o: lcd/u8x8_d_ssd1309.c  .generated_files/flags/default/c9df9800a678a3284905d2d94eee77db25c77335 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1309.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1309.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1309.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1309.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1309.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1309.o lcd/u8x8_d_ssd1309.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1312.o: lcd/u8x8_d_ssd1312.c  .generated_files/flags/default/37c32ee2c29278ff9bc9ab611fa722237d34c6e8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1312.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1312.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1312.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1312.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1312.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1312.o lcd/u8x8_d_ssd1312.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o: lcd/u8x8_d_ssd1315_128x64_noname.c  .generated_files/flags/default/624312a2c2bcd911574390894cfc952cfb997813 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o lcd/u8x8_d_ssd1315_128x64_noname.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1316.o: lcd/u8x8_d_ssd1316.c  .generated_files/flags/default/d4a6e6929a0bc0841ac697453a58948ac0e0d0a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1316.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1316.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1316.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1316.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1316.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1316.o lcd/u8x8_d_ssd1316.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1317.o: lcd/u8x8_d_ssd1317.c  .generated_files/flags/default/6c21515fe1e96833c62b3b011b8bf8f1e5205b55 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1317.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1317.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1317.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1317.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1317.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1317.o lcd/u8x8_d_ssd1317.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1318.o: lcd/u8x8_d_ssd1318.c  .generated_files/flags/default/7908cc9eaa4bef78c38ec244869b1974b860c6d6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1318.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1318.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1318.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1318.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1318.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1318.o lcd/u8x8_d_ssd1318.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1320.o: lcd/u8x8_d_ssd1320.c  .generated_files/flags/default/3453c606de910926df78200213b7f3f37d33d987 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1320.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1320.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1320.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1320.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1320.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1320.o lcd/u8x8_d_ssd1320.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1322.o: lcd/u8x8_d_ssd1322.c  .generated_files/flags/default/20f69d479f44652642153cdd5a02015734760b7e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1322.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1322.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1322.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1322.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1322.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1322.o lcd/u8x8_d_ssd1322.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1325.o: lcd/u8x8_d_ssd1325.c  .generated_files/flags/default/6c0a1ee4e8220408bfd1be73309807db85c7abac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1325.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1325.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1325.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1325.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1325.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1325.o lcd/u8x8_d_ssd1325.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1326.o: lcd/u8x8_d_ssd1326.c  .generated_files/flags/default/42995e40df7a3933eec6d631074a5619e3544fe0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1326.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1326.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1326.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1326.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1326.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1326.o lcd/u8x8_d_ssd1326.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1327.o: lcd/u8x8_d_ssd1327.c  .generated_files/flags/default/7a9c877c4d552780c7b6bc8857029ec5b11342d7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1327.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1327.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1327.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1327.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1327.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1327.o lcd/u8x8_d_ssd1327.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1329.o: lcd/u8x8_d_ssd1329.c  .generated_files/flags/default/1d6ec151557fae11b1730e1d312499b1d40bff21 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1329.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1329.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1329.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1329.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1329.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1329.o lcd/u8x8_d_ssd1329.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1362.o: lcd/u8x8_d_ssd1362.c  .generated_files/flags/default/fb516d3ffdb970f83209ac6bd6640b3388c3052 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1362.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1362.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1362.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1362.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1362.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1362.o lcd/u8x8_d_ssd1362.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o: lcd/u8x8_d_ssd1362z.c  .generated_files/flags/default/488ce5ee27429252d8a6a2c6cc7c38ba30bbd1a7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o lcd/u8x8_d_ssd1362z.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1363.o: lcd/u8x8_d_ssd1363.c  .generated_files/flags/default/8e9023251ef2c087d674a7f5764b7d41c8600dfb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1363.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1363.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1363.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1363.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1363.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1363.o lcd/u8x8_d_ssd1363.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o: lcd/u8x8_d_ssd1606_172x72.c  .generated_files/flags/default/f04f3d4873ffa402454706c2c13671baab67258b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o lcd/u8x8_d_ssd1606_172x72.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o: lcd/u8x8_d_ssd1607_200x200.c  .generated_files/flags/default/d4cefb29757a28ee19456ff3a05b8f7fc2b0ce06 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o lcd/u8x8_d_ssd1607_200x200.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7302.o: lcd/u8x8_d_st7302.c  .generated_files/flags/default/412025716d192e5abf493df510bd7c79ad47880d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7302.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7302.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7302.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7302.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7302.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7302.o lcd/u8x8_d_st7302.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7305.o: lcd/u8x8_d_st7305.c  .generated_files/flags/default/d65d1c50a52a35b62ef55cc9473de7adbc03e2fa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7305.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7305.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7305.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7305.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7305.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7305.o lcd/u8x8_d_st7305.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7511.o: lcd/u8x8_d_st7511.c  .generated_files/flags/default/1b3cf7ac3d36a14ed874db5a5f99c09b69b39fc5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7511.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7511.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7511.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7511.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7511.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7511.o lcd/u8x8_d_st7511.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st75160.o: lcd/u8x8_d_st75160.c  .generated_files/flags/default/3a8c69cf7dbc3469d5bf5e117cb0deb20c412d04 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75160.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st75160.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st75160.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st75160.o  -o ${OBJECTDIR}/lcd/u8x8_d_st75160.o lcd/u8x8_d_st75160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st75161.o: lcd/u8x8_d_st75161.c  .generated_files/flags/default/54cac92f8f6dc14cc8efbc4d5bf836edae061028 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75161.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75161.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st75161.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st75161.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st75161.o  -o ${OBJECTDIR}/lcd/u8x8_d_st75161.o lcd/u8x8_d_st75161.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st75256.o: lcd/u8x8_d_st75256.c  .generated_files/flags/default/c8f2fe60b4d3a157e59f3df4f13bc41f7b234d04 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75256.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75256.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st75256.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st75256.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st75256.o  -o ${OBJECTDIR}/lcd/u8x8_d_st75256.o lcd/u8x8_d_st75256.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7528.o: lcd/u8x8_d_st7528.c  .generated_files/flags/default/5800f956216de44e8ab1aed080f640e7284338ab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7528.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7528.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7528.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7528.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7528.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7528.o lcd/u8x8_d_st7528.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st75320.o: lcd/u8x8_d_st75320.c  .generated_files/flags/default/f78d3f138667c0337e03817f320e965040082f30 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75320.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75320.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st75320.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st75320.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st75320.o  -o ${OBJECTDIR}/lcd/u8x8_d_st75320.o lcd/u8x8_d_st75320.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7539.o: lcd/u8x8_d_st7539.c  .generated_files/flags/default/34b7f12b27cf35ad41df5d539c2762fd1594d91b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7539.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7539.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7539.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7539.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7539.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7539.o lcd/u8x8_d_st7539.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7565.o: lcd/u8x8_d_st7565.c  .generated_files/flags/default/bafa47e8f5a4fcd94f93b276c653e40368084306 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7565.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7565.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7565.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7565.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7565.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7565.o lcd/u8x8_d_st7565.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7567.o: lcd/u8x8_d_st7567.c  .generated_files/flags/default/fe6d94ec85d46965b33ec8e925be08ba6052af6f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7567.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7567.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7567.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7567.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7567.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7567.o lcd/u8x8_d_st7567.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7571.o: lcd/u8x8_d_st7571.c  .generated_files/flags/default/78841ef4a9ed5e8f3d44c8f52dc982e31b78ec9c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7571.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7571.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7571.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7571.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7571.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7571.o lcd/u8x8_d_st7571.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o: lcd/u8x8_d_st7586s_erc240160.c  .generated_files/flags/default/45ed15c8e9f3fae2728cc700b118ef016d4f0a32 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o lcd/u8x8_d_st7586s_erc240160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o: lcd/u8x8_d_st7586s_jlx320160.c  .generated_files/flags/default/274a501318fc22116e5805fbc6f67169879713a5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o lcd/u8x8_d_st7586s_jlx320160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o: lcd/u8x8_d_st7586s_jlx384160.c  .generated_files/flags/default/36f7af2e055c3f7710673142afa48492785ee462 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o lcd/u8x8_d_st7586s_jlx384160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o: lcd/u8x8_d_st7586s_md240128.c  .generated_files/flags/default/b13c4136a9901b89398b1261d365e0ae7eab5500 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o lcd/u8x8_d_st7586s_md240128.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o: lcd/u8x8_d_st7586s_s028hn118a.c  .generated_files/flags/default/348e157f42aecbabcb126857656256c49a9b8369 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o lcd/u8x8_d_st7586s_s028hn118a.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o: lcd/u8x8_d_st7586s_ymc240160.c  .generated_files/flags/default/f710ecb8b0fbd439f8ec4b53a3f8f19f7226191d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o lcd/u8x8_d_st7586s_ymc240160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7588.o: lcd/u8x8_d_st7588.c  .generated_files/flags/default/8c9a19558545a1ab3f383cea2b8557d3d4a3c179 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7588.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7588.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7588.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7588.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7588.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7588.o lcd/u8x8_d_st7588.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7920.o: lcd/u8x8_d_st7920.c  .generated_files/flags/default/7ba2b8ecbbfd125fe1f31d3680fe8cc7ff87ca29 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7920.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7920.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7920.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7920.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7920.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7920.o lcd/u8x8_d_st7920.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_stdio.o: lcd/u8x8_d_stdio.c  .generated_files/flags/default/5ed23449e2ff4acddf81f94b6c83909b4a1026b3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_stdio.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_stdio.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_stdio.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_stdio.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_stdio.o  -o ${OBJECTDIR}/lcd/u8x8_d_stdio.o lcd/u8x8_d_stdio.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_t6963.o: lcd/u8x8_d_t6963.c  .generated_files/flags/default/14ebaf434c72ff5b9fd5997e26b2e57d02aa2522 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_t6963.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_t6963.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_t6963.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_t6963.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_t6963.o  -o ${OBJECTDIR}/lcd/u8x8_d_t6963.o lcd/u8x8_d_t6963.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1601.o: lcd/u8x8_d_uc1601.c  .generated_files/flags/default/448a84ed1c6ad0f0a0e1751e02e20831cb92dc37 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1601.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1601.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1601.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1601.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1601.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1601.o lcd/u8x8_d_uc1601.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1604.o: lcd/u8x8_d_uc1604.c  .generated_files/flags/default/9c22e4a2f9186f20e7579fba5c237e9d41542ac5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1604.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1604.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1604.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1604.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1604.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1604.o lcd/u8x8_d_uc1604.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1608.o: lcd/u8x8_d_uc1608.c  .generated_files/flags/default/a28703b100533e4547d1023880634db7cfda006d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1608.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1608.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1608.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1608.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1608.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1608.o lcd/u8x8_d_uc1608.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1609.o: lcd/u8x8_d_uc1609.c  .generated_files/flags/default/19c1d267c7e09c42b4d32db7ae0e8ae8253d6746 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1609.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1609.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1609.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1609.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1609.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1609.o lcd/u8x8_d_uc1609.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1610.o: lcd/u8x8_d_uc1610.c  .generated_files/flags/default/34c152d6412c7e178c0778f0acae2fb8660ccfe4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1610.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1610.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1610.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1610.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1610.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1610.o lcd/u8x8_d_uc1610.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1611.o: lcd/u8x8_d_uc1611.c  .generated_files/flags/default/b9699139a27bebcb72e4e36d1833823af39f25f5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1611.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1611.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1611.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1611.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1611.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1611.o lcd/u8x8_d_uc1611.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1617.o: lcd/u8x8_d_uc1617.c  .generated_files/flags/default/82fc777e466a18a728060eec76a91836d0da5db9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1617.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1617.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1617.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1617.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1617.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1617.o lcd/u8x8_d_uc1617.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1628.o: lcd/u8x8_d_uc1628.c  .generated_files/flags/default/a700559110646712fcae4e4bbff69121d45452ac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1628.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1628.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1628.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1628.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1628.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1628.o lcd/u8x8_d_uc1628.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1638.o: lcd/u8x8_d_uc1638.c  .generated_files/flags/default/59f4f1c8d21a79e651bc3833d16cf7dd31a648e0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1638.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1638.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1638.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1638.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1638.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1638.o lcd/u8x8_d_uc1638.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1698.o: lcd/u8x8_d_uc1698.c  .generated_files/flags/default/2ca5ad01391cd22ce20b850f4b1b0d78f53371 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1698.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1698.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1698.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1698.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1698.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1698.o lcd/u8x8_d_uc1698.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o: lcd/u8x8_d_uc1701_dogs102.c  .generated_files/flags/default/552366a8f14ac5308bf2f7506c431472207269a8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o lcd/u8x8_d_uc1701_dogs102.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o: lcd/u8x8_d_uc1701_mini12864.c  .generated_files/flags/default/b778e484a2f55150fdd2c01d13456d2e2c16edf3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o lcd/u8x8_d_uc1701_mini12864.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_debounce.o: lcd/u8x8_debounce.c  .generated_files/flags/default/675c23ee661e63f662e262d4ac90ad26f52988eb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_debounce.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_debounce.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_debounce.o.d" -MT "${OBJECTDIR}/lcd/u8x8_debounce.o.d" -MT ${OBJECTDIR}/lcd/u8x8_debounce.o  -o ${OBJECTDIR}/lcd/u8x8_debounce.o lcd/u8x8_debounce.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_display.o: lcd/u8x8_display.c  .generated_files/flags/default/b76c65cf386c38fa96c0138c1213f6403461f446 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_display.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_display.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_display.o.d" -MT "${OBJECTDIR}/lcd/u8x8_display.o.d" -MT ${OBJECTDIR}/lcd/u8x8_display.o  -o ${OBJECTDIR}/lcd/u8x8_display.o lcd/u8x8_display.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_fonts.o: lcd/u8x8_fonts.c  .generated_files/flags/default/873f747c0f716ff681e5db4fef32ab9a7b66572d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_fonts.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_fonts.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_fonts.o.d" -MT "${OBJECTDIR}/lcd/u8x8_fonts.o.d" -MT ${OBJECTDIR}/lcd/u8x8_fonts.o  -o ${OBJECTDIR}/lcd/u8x8_fonts.o lcd/u8x8_fonts.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_gpio.o: lcd/u8x8_gpio.c  .generated_files/flags/default/82ff51c2f98da6b262f8ecf34a88e36a04169c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_gpio.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_gpio.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_gpio.o.d" -MT "${OBJECTDIR}/lcd/u8x8_gpio.o.d" -MT ${OBJECTDIR}/lcd/u8x8_gpio.o  -o ${OBJECTDIR}/lcd/u8x8_gpio.o lcd/u8x8_gpio.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_input_value.o: lcd/u8x8_input_value.c  .generated_files/flags/default/b1598d36397cd0520c556fa8e718d6c98fbacca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_input_value.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_input_value.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_input_value.o.d" -MT "${OBJECTDIR}/lcd/u8x8_input_value.o.d" -MT ${OBJECTDIR}/lcd/u8x8_input_value.o  -o ${OBJECTDIR}/lcd/u8x8_input_value.o lcd/u8x8_input_value.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_message.o: lcd/u8x8_message.c  .generated_files/flags/default/f30f7d2f3a5abee36f827b4f4ec48af896a880bc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_message.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_message.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_message.o.d" -MT "${OBJECTDIR}/lcd/u8x8_message.o.d" -MT ${OBJECTDIR}/lcd/u8x8_message.o  -o ${OBJECTDIR}/lcd/u8x8_message.o lcd/u8x8_message.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_selection_list.o: lcd/u8x8_selection_list.c  .generated_files/flags/default/756106fa9fceb19abcb5e03b80a4090e876082a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_selection_list.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_selection_list.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_selection_list.o.d" -MT "${OBJECTDIR}/lcd/u8x8_selection_list.o.d" -MT ${OBJECTDIR}/lcd/u8x8_selection_list.o  -o ${OBJECTDIR}/lcd/u8x8_selection_list.o lcd/u8x8_selection_list.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_setup.o: lcd/u8x8_setup.c  .generated_files/flags/default/c49a6a8d8af2a14ec951cf1eb2da15fa5d38031c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_setup.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_setup.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_setup.o.d" -MT "${OBJECTDIR}/lcd/u8x8_setup.o.d" -MT ${OBJECTDIR}/lcd/u8x8_setup.o  -o ${OBJECTDIR}/lcd/u8x8_setup.o lcd/u8x8_setup.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_string.o: lcd/u8x8_string.c  .generated_files/flags/default/d4b3e6ce46dc65f54142345bd75ac69d67c26a1d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_string.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_string.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_string.o.d" -MT "${OBJECTDIR}/lcd/u8x8_string.o.d" -MT ${OBJECTDIR}/lcd/u8x8_string.o  -o ${OBJECTDIR}/lcd/u8x8_string.o lcd/u8x8_string.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_u16toa.o: lcd/u8x8_u16toa.c  .generated_files/flags/default/d5f1ec931122cf5d679346e1434d554500598771 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_u16toa.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_u16toa.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_u16toa.o.d" -MT "${OBJECTDIR}/lcd/u8x8_u16toa.o.d" -MT ${OBJECTDIR}/lcd/u8x8_u16toa.o  -o ${OBJECTDIR}/lcd/u8x8_u16toa.o lcd/u8x8_u16toa.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_u8toa.o: lcd/u8x8_u8toa.c  .generated_files/flags/default/624b69e1f4339cdba6ddc57a963fde7729ac2d5e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_u8toa.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_u8toa.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_u8toa.o.d" -MT "${OBJECTDIR}/lcd/u8x8_u8toa.o.d" -MT ${OBJECTDIR}/lcd/u8x8_u8toa.o  -o ${OBJECTDIR}/lcd/u8x8_u8toa.o lcd/u8x8_u8toa.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/lcd/main.o: lcd/main.c  .generated_files/flags/default/3e39f89c680b9e60f89fcb54de79b04bdc87bac8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/main.o.d 
	@${RM} ${OBJECTDIR}/lcd/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/main.o.d" -MT "${OBJECTDIR}/lcd/main.o.d" -MT ${OBJECTDIR}/lcd/main.o  -o ${OBJECTDIR}/lcd/main.o lcd/main.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/mui.o: lcd/mui.c  .generated_files/flags/default/c051055937c8dc6d5896937aa25b79c30ee1da9d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/mui.o.d 
	@${RM} ${OBJECTDIR}/lcd/mui.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/mui.o.d" -MT "${OBJECTDIR}/lcd/mui.o.d" -MT ${OBJECTDIR}/lcd/mui.o  -o ${OBJECTDIR}/lcd/mui.o lcd/mui.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/mui_u8g2.o: lcd/mui_u8g2.c  .generated_files/flags/default/1a6b92d6c49d3750af477c43aab2a0d56085a038 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/mui_u8g2.o.d 
	@${RM} ${OBJECTDIR}/lcd/mui_u8g2.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/mui_u8g2.o.d" -MT "${OBJECTDIR}/lcd/mui_u8g2.o.d" -MT ${OBJECTDIR}/lcd/mui_u8g2.o  -o ${OBJECTDIR}/lcd/mui_u8g2.o lcd/mui_u8g2.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_arc.o: lcd/u8g2_arc.c  .generated_files/flags/default/13bad9912f369c62f54eb8c8eef3d1e6a920f680 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_arc.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_arc.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_arc.o.d" -MT "${OBJECTDIR}/lcd/u8g2_arc.o.d" -MT ${OBJECTDIR}/lcd/u8g2_arc.o  -o ${OBJECTDIR}/lcd/u8g2_arc.o lcd/u8g2_arc.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_bitmap.o: lcd/u8g2_bitmap.c  .generated_files/flags/default/92c4c0aaef50b6a5eda0f34bb86cd0ada7ecf577 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_bitmap.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_bitmap.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_bitmap.o.d" -MT "${OBJECTDIR}/lcd/u8g2_bitmap.o.d" -MT ${OBJECTDIR}/lcd/u8g2_bitmap.o  -o ${OBJECTDIR}/lcd/u8g2_bitmap.o lcd/u8g2_bitmap.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_box.o: lcd/u8g2_box.c  .generated_files/flags/default/41c5030fb76789c0281f6c131b2c091cf6df5ac5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_box.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_box.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_box.o.d" -MT "${OBJECTDIR}/lcd/u8g2_box.o.d" -MT ${OBJECTDIR}/lcd/u8g2_box.o  -o ${OBJECTDIR}/lcd/u8g2_box.o lcd/u8g2_box.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_buffer.o: lcd/u8g2_buffer.c  .generated_files/flags/default/580067f075ca48a7bbf19573ec6521ef804d8245 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_buffer.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_buffer.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_buffer.o.d" -MT "${OBJECTDIR}/lcd/u8g2_buffer.o.d" -MT ${OBJECTDIR}/lcd/u8g2_buffer.o  -o ${OBJECTDIR}/lcd/u8g2_buffer.o lcd/u8g2_buffer.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_button.o: lcd/u8g2_button.c  .generated_files/flags/default/882a8b6709e947adfc7074e86de7396731d74b7f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_button.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_button.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_button.o.d" -MT "${OBJECTDIR}/lcd/u8g2_button.o.d" -MT ${OBJECTDIR}/lcd/u8g2_button.o  -o ${OBJECTDIR}/lcd/u8g2_button.o lcd/u8g2_button.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_circle.o: lcd/u8g2_circle.c  .generated_files/flags/default/51e980772e6c3d6378612e1199fff6669121111c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_circle.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_circle.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_circle.o.d" -MT "${OBJECTDIR}/lcd/u8g2_circle.o.d" -MT ${OBJECTDIR}/lcd/u8g2_circle.o  -o ${OBJECTDIR}/lcd/u8g2_circle.o lcd/u8g2_circle.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_cleardisplay.o: lcd/u8g2_cleardisplay.c  .generated_files/flags/default/1d77742efed9e0bcecd34ca4760e176717f59fd9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_cleardisplay.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_cleardisplay.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_cleardisplay.o.d" -MT "${OBJECTDIR}/lcd/u8g2_cleardisplay.o.d" -MT ${OBJECTDIR}/lcd/u8g2_cleardisplay.o  -o ${OBJECTDIR}/lcd/u8g2_cleardisplay.o lcd/u8g2_cleardisplay.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_d_memory.o: lcd/u8g2_d_memory.c  .generated_files/flags/default/d02a29aad565fc69097ed6350d16c14dd4f43f97 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_d_memory.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_d_memory.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_d_memory.o.d" -MT "${OBJECTDIR}/lcd/u8g2_d_memory.o.d" -MT ${OBJECTDIR}/lcd/u8g2_d_memory.o  -o ${OBJECTDIR}/lcd/u8g2_d_memory.o lcd/u8g2_d_memory.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_d_setup.o: lcd/u8g2_d_setup.c  .generated_files/flags/default/c4f6681f280bb7e2748260fc89247586f293ebd3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_d_setup.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_d_setup.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_d_setup.o.d" -MT "${OBJECTDIR}/lcd/u8g2_d_setup.o.d" -MT ${OBJECTDIR}/lcd/u8g2_d_setup.o  -o ${OBJECTDIR}/lcd/u8g2_d_setup.o lcd/u8g2_d_setup.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_font.o: lcd/u8g2_font.c  .generated_files/flags/default/10fdbd2e8327f6a4149ff7af2cd309dc526e290a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_font.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_font.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_font.o.d" -MT "${OBJECTDIR}/lcd/u8g2_font.o.d" -MT ${OBJECTDIR}/lcd/u8g2_font.o  -o ${OBJECTDIR}/lcd/u8g2_font.o lcd/u8g2_font.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_fonts.o: lcd/u8g2_fonts.c  .generated_files/flags/default/959d1a37ee922dcf2d76e077b4fb9c350fe98578 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_fonts.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_fonts.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_fonts.o.d" -MT "${OBJECTDIR}/lcd/u8g2_fonts.o.d" -MT ${OBJECTDIR}/lcd/u8g2_fonts.o  -o ${OBJECTDIR}/lcd/u8g2_fonts.o lcd/u8g2_fonts.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_hvline.o: lcd/u8g2_hvline.c  .generated_files/flags/default/40f284cfc54319c1bdd46a05f9239d0839c444c8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_hvline.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_hvline.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_hvline.o.d" -MT "${OBJECTDIR}/lcd/u8g2_hvline.o.d" -MT ${OBJECTDIR}/lcd/u8g2_hvline.o  -o ${OBJECTDIR}/lcd/u8g2_hvline.o lcd/u8g2_hvline.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_input_value.o: lcd/u8g2_input_value.c  .generated_files/flags/default/bf402ae7f69b8f08ad3583fddec4d3e60905492e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_input_value.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_input_value.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_input_value.o.d" -MT "${OBJECTDIR}/lcd/u8g2_input_value.o.d" -MT ${OBJECTDIR}/lcd/u8g2_input_value.o  -o ${OBJECTDIR}/lcd/u8g2_input_value.o lcd/u8g2_input_value.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_intersection.o: lcd/u8g2_intersection.c  .generated_files/flags/default/8b8bd2eb43e7e9c22087f798ed5ec69c839f7e30 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_intersection.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_intersection.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_intersection.o.d" -MT "${OBJECTDIR}/lcd/u8g2_intersection.o.d" -MT ${OBJECTDIR}/lcd/u8g2_intersection.o  -o ${OBJECTDIR}/lcd/u8g2_intersection.o lcd/u8g2_intersection.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_kerning.o: lcd/u8g2_kerning.c  .generated_files/flags/default/f8e390d297254d8f008ca9de6d8509eb2ad675aa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_kerning.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_kerning.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_kerning.o.d" -MT "${OBJECTDIR}/lcd/u8g2_kerning.o.d" -MT ${OBJECTDIR}/lcd/u8g2_kerning.o  -o ${OBJECTDIR}/lcd/u8g2_kerning.o lcd/u8g2_kerning.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_line.o: lcd/u8g2_line.c  .generated_files/flags/default/451f4383a505d9b1d88d2b96ce1c789ec0b0c86e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_line.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_line.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_line.o.d" -MT "${OBJECTDIR}/lcd/u8g2_line.o.d" -MT ${OBJECTDIR}/lcd/u8g2_line.o  -o ${OBJECTDIR}/lcd/u8g2_line.o lcd/u8g2_line.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_ll_hvline.o: lcd/u8g2_ll_hvline.c  .generated_files/flags/default/413deacd2ae903b70a3e4cee7f9f9f14a07dc936 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_ll_hvline.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_ll_hvline.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_ll_hvline.o.d" -MT "${OBJECTDIR}/lcd/u8g2_ll_hvline.o.d" -MT ${OBJECTDIR}/lcd/u8g2_ll_hvline.o  -o ${OBJECTDIR}/lcd/u8g2_ll_hvline.o lcd/u8g2_ll_hvline.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_message.o: lcd/u8g2_message.c  .generated_files/flags/default/6bc9f744f7f307ddf09a56e232c5444330f8b22c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_message.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_message.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_message.o.d" -MT "${OBJECTDIR}/lcd/u8g2_message.o.d" -MT ${OBJECTDIR}/lcd/u8g2_message.o  -o ${OBJECTDIR}/lcd/u8g2_message.o lcd/u8g2_message.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_polygon.o: lcd/u8g2_polygon.c  .generated_files/flags/default/5312b1205e5449298c9ee20cd8c05da9114a1605 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_polygon.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_polygon.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_polygon.o.d" -MT "${OBJECTDIR}/lcd/u8g2_polygon.o.d" -MT ${OBJECTDIR}/lcd/u8g2_polygon.o  -o ${OBJECTDIR}/lcd/u8g2_polygon.o lcd/u8g2_polygon.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_selection_list.o: lcd/u8g2_selection_list.c  .generated_files/flags/default/f760deb09cf68f6c0c604483dd09eae4c1bd610e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_selection_list.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_selection_list.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_selection_list.o.d" -MT "${OBJECTDIR}/lcd/u8g2_selection_list.o.d" -MT ${OBJECTDIR}/lcd/u8g2_selection_list.o  -o ${OBJECTDIR}/lcd/u8g2_selection_list.o lcd/u8g2_selection_list.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8g2_setup.o: lcd/u8g2_setup.c  .generated_files/flags/default/295f9e46b1e3f16a30c31f072026ac1696a63d24 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8g2_setup.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8g2_setup.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8g2_setup.o.d" -MT "${OBJECTDIR}/lcd/u8g2_setup.o.d" -MT ${OBJECTDIR}/lcd/u8g2_setup.o  -o ${OBJECTDIR}/lcd/u8g2_setup.o lcd/u8g2_setup.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8log.o: lcd/u8log.c  .generated_files/flags/default/e07e970ffa421a54d4ea0c2eb7ee7426d5a5e29f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8log.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8log.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8log.o.d" -MT "${OBJECTDIR}/lcd/u8log.o.d" -MT ${OBJECTDIR}/lcd/u8log.o  -o ${OBJECTDIR}/lcd/u8log.o lcd/u8log.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8log_u8g2.o: lcd/u8log_u8g2.c  .generated_files/flags/default/57726dec91cac2ce73c189406cc69a597a87dd3d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8log_u8g2.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8log_u8g2.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8log_u8g2.o.d" -MT "${OBJECTDIR}/lcd/u8log_u8g2.o.d" -MT ${OBJECTDIR}/lcd/u8log_u8g2.o  -o ${OBJECTDIR}/lcd/u8log_u8g2.o lcd/u8log_u8g2.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8log_u8x8.o: lcd/u8log_u8x8.c  .generated_files/flags/default/32bec66e9884d6d96ae074bd539a051e046bceb3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8log_u8x8.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8log_u8x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8log_u8x8.o.d" -MT "${OBJECTDIR}/lcd/u8log_u8x8.o.d" -MT ${OBJECTDIR}/lcd/u8log_u8x8.o  -o ${OBJECTDIR}/lcd/u8log_u8x8.o lcd/u8log_u8x8.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_8x8.o: lcd/u8x8_8x8.c  .generated_files/flags/default/1f55e13ceaaec2353d5f7b7d1a76c4da125cf18e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_8x8.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_8x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_8x8.o.d" -MT "${OBJECTDIR}/lcd/u8x8_8x8.o.d" -MT ${OBJECTDIR}/lcd/u8x8_8x8.o  -o ${OBJECTDIR}/lcd/u8x8_8x8.o lcd/u8x8_8x8.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_byte.o: lcd/u8x8_byte.c  .generated_files/flags/default/ecd41ef0f35d02130f544fd73e7e3d2d2a5ad782 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_byte.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_byte.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_byte.o.d" -MT "${OBJECTDIR}/lcd/u8x8_byte.o.d" -MT ${OBJECTDIR}/lcd/u8x8_byte.o  -o ${OBJECTDIR}/lcd/u8x8_byte.o lcd/u8x8_byte.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_cad.o: lcd/u8x8_cad.c  .generated_files/flags/default/afa579522736f2bad084d34fa2af688d32aed37 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_cad.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_cad.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_cad.o.d" -MT "${OBJECTDIR}/lcd/u8x8_cad.o.d" -MT ${OBJECTDIR}/lcd/u8x8_cad.o  -o ${OBJECTDIR}/lcd/u8x8_cad.o lcd/u8x8_cad.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_capture.o: lcd/u8x8_capture.c  .generated_files/flags/default/d57999a45e920612fad7d9247dadeb9419b8813f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_capture.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_capture.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_capture.o.d" -MT "${OBJECTDIR}/lcd/u8x8_capture.o.d" -MT ${OBJECTDIR}/lcd/u8x8_capture.o  -o ${OBJECTDIR}/lcd/u8x8_capture.o lcd/u8x8_capture.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_a2printer.o: lcd/u8x8_d_a2printer.c  .generated_files/flags/default/77feb8cdec86db22fe5c013a4b53e27a47f7192 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_a2printer.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_a2printer.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_a2printer.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_a2printer.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_a2printer.o  -o ${OBJECTDIR}/lcd/u8x8_d_a2printer.o lcd/u8x8_d_a2printer.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ch1120.o: lcd/u8x8_d_ch1120.c  .generated_files/flags/default/11aa5effb908c15c673dded175106c9ef4c0d934 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ch1120.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ch1120.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ch1120.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ch1120.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ch1120.o  -o ${OBJECTDIR}/lcd/u8x8_d_ch1120.o lcd/u8x8_d_ch1120.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o: lcd/u8x8_d_gp1247ai.c  .generated_files/flags/default/4b4a09a84fa650eb1341f3ec41698a715c5da93 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o  -o ${OBJECTDIR}/lcd/u8x8_d_gp1247ai.o lcd/u8x8_d_gp1247ai.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o: lcd/u8x8_d_gp1287ai.c  .generated_files/flags/default/5fa686d1d815182168e4ba6705e2e62fa293c3a7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o  -o ${OBJECTDIR}/lcd/u8x8_d_gp1287ai.o lcd/u8x8_d_gp1287ai.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o: lcd/u8x8_d_gp1294ai.c  .generated_files/flags/default/96fcaecfab38e14374c1c717570e14704cabf795 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o  -o ${OBJECTDIR}/lcd/u8x8_d_gp1294ai.o lcd/u8x8_d_gp1294ai.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_gu800.o: lcd/u8x8_d_gu800.c  .generated_files/flags/default/eb594b39d21e2b8cd12ac8fd7ff84150feb4b010 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gu800.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_gu800.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_gu800.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_gu800.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_gu800.o  -o ${OBJECTDIR}/lcd/u8x8_d_gu800.o lcd/u8x8_d_gu800.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_hd44102.o: lcd/u8x8_d_hd44102.c  .generated_files/flags/default/5aa434903b0f5c6bf8656e20aeae36173c74ab3b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_hd44102.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_hd44102.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_hd44102.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_hd44102.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_hd44102.o  -o ${OBJECTDIR}/lcd/u8x8_d_hd44102.o lcd/u8x8_d_hd44102.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o: lcd/u8x8_d_il3820_296x128.c  .generated_files/flags/default/f92687ee9688701ded06af4fa9317c466f7c9ebb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o  -o ${OBJECTDIR}/lcd/u8x8_d_il3820_296x128.o lcd/u8x8_d_il3820_296x128.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ist3020.o: lcd/u8x8_d_ist3020.c  .generated_files/flags/default/4028a08fa6f8dbf0c4e38baca648dd64af1189fb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ist3020.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ist3020.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ist3020.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ist3020.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ist3020.o  -o ${OBJECTDIR}/lcd/u8x8_d_ist3020.o lcd/u8x8_d_ist3020.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ist3088.o: lcd/u8x8_d_ist3088.c  .generated_files/flags/default/280b37ce169187b39d414d708b88d35f74abc36a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ist3088.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ist3088.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ist3088.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ist3088.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ist3088.o  -o ${OBJECTDIR}/lcd/u8x8_d_ist3088.o lcd/u8x8_d_ist3088.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ist7920.o: lcd/u8x8_d_ist7920.c  .generated_files/flags/default/94625ad8aeaa69fcbc084a3baca21fb73e4abb06 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ist7920.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ist7920.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ist7920.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ist7920.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ist7920.o  -o ${OBJECTDIR}/lcd/u8x8_d_ist7920.o lcd/u8x8_d_ist7920.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ks0108.o: lcd/u8x8_d_ks0108.c  .generated_files/flags/default/d590a2dbbd884480ffeb312df9104d75b3ed9476 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ks0108.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ks0108.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ks0108.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ks0108.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ks0108.o  -o ${OBJECTDIR}/lcd/u8x8_d_ks0108.o lcd/u8x8_d_ks0108.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_lc7981.o: lcd/u8x8_d_lc7981.c  .generated_files/flags/default/67b55333b8ec87aaf849cb9924c03453563603b8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_lc7981.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_lc7981.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_lc7981.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_lc7981.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_lc7981.o  -o ${OBJECTDIR}/lcd/u8x8_d_lc7981.o lcd/u8x8_d_lc7981.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o: lcd/u8x8_d_ld7032_60x32.c  .generated_files/flags/default/cb1f071ea6f0d284c1087c95b4a6e088058260f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o  -o ${OBJECTDIR}/lcd/u8x8_d_ld7032_60x32.o lcd/u8x8_d_ld7032_60x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o: lcd/u8x8_d_ls013b7dh03.c  .generated_files/flags/default/3210c24f7be7dc6d60010a04826bf860e75d9621 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o  -o ${OBJECTDIR}/lcd/u8x8_d_ls013b7dh03.o lcd/u8x8_d_ls013b7dh03.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_max7219.o: lcd/u8x8_d_max7219.c  .generated_files/flags/default/434dd9d3759e9f44ff9a5750c42ae8fc30c527a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_max7219.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_max7219.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_max7219.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_max7219.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_max7219.o  -o ${OBJECTDIR}/lcd/u8x8_d_max7219.o lcd/u8x8_d_max7219.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o: lcd/u8x8_d_pcd8544_84x48.c  .generated_files/flags/default/9f93e1b992840b1bd42b4c15e502525a5a3989c1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o  -o ${OBJECTDIR}/lcd/u8x8_d_pcd8544_84x48.o lcd/u8x8_d_pcd8544_84x48.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_pcf8812.o: lcd/u8x8_d_pcf8812.c  .generated_files/flags/default/f6aa150e36ee7e17598cc14ff313f3fff6436bb8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_pcf8812.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_pcf8812.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_pcf8812.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_pcf8812.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_pcf8812.o  -o ${OBJECTDIR}/lcd/u8x8_d_pcf8812.o lcd/u8x8_d_pcf8812.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o: lcd/u8x8_d_pcf8814_hx1230.c  .generated_files/flags/default/748739a23efc90b59b856487339c2050285b7ae2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o  -o ${OBJECTDIR}/lcd/u8x8_d_pcf8814_hx1230.o lcd/u8x8_d_pcf8814_hx1230.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_s1d15300.o: lcd/u8x8_d_s1d15300.c  .generated_files/flags/default/7f980ebdb2b3fb7fd0a51b57c03d76275d864ea6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_s1d15300.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_s1d15300.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_s1d15300.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_s1d15300.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_s1d15300.o  -o ${OBJECTDIR}/lcd/u8x8_d_s1d15300.o lcd/u8x8_d_s1d15300.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_s1d15721.o: lcd/u8x8_d_s1d15721.c  .generated_files/flags/default/f08b48488f4704105087145f301e46ef3bceddac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_s1d15721.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_s1d15721.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_s1d15721.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_s1d15721.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_s1d15721.o  -o ${OBJECTDIR}/lcd/u8x8_d_s1d15721.o lcd/u8x8_d_s1d15721.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o: lcd/u8x8_d_s1d15e06.c  .generated_files/flags/default/c2dc2e28aaaa8786d2bb7a73887e2741449487e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o  -o ${OBJECTDIR}/lcd/u8x8_d_s1d15e06.o lcd/u8x8_d_s1d15e06.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sbn1661.o: lcd/u8x8_d_sbn1661.c  .generated_files/flags/default/2ce3a88a11a3a307973d0ebb7d86de3e55408496 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sbn1661.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sbn1661.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sbn1661.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sbn1661.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sbn1661.o  -o ${OBJECTDIR}/lcd/u8x8_d_sbn1661.o lcd/u8x8_d_sbn1661.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sed1330.o: lcd/u8x8_d_sed1330.c  .generated_files/flags/default/80b4482747a05202069126c9c1d08a55b1759a67 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sed1330.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sed1330.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sed1330.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sed1330.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sed1330.o  -o ${OBJECTDIR}/lcd/u8x8_d_sed1330.o lcd/u8x8_d_sed1330.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o: lcd/u8x8_d_sh1106_64x32.c  .generated_files/flags/default/46a3a72d16fcbd62be8095f2be8411e2a203bca8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o  -o ${OBJECTDIR}/lcd/u8x8_d_sh1106_64x32.o lcd/u8x8_d_sh1106_64x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o: lcd/u8x8_d_sh1106_72x40.c  .generated_files/flags/default/3e972136cf3ccfadf8e879a929022924c9028a3b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o  -o ${OBJECTDIR}/lcd/u8x8_d_sh1106_72x40.o lcd/u8x8_d_sh1106_72x40.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sh1107.o: lcd/u8x8_d_sh1107.c  .generated_files/flags/default/116645a74a65822181cc19dd662f8d8174d0cd9c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1107.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1107.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sh1107.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sh1107.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sh1107.o  -o ${OBJECTDIR}/lcd/u8x8_d_sh1107.o lcd/u8x8_d_sh1107.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sh1108.o: lcd/u8x8_d_sh1108.c  .generated_files/flags/default/14e2747cca7132c271e34edc882c4f0097860374 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1108.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1108.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sh1108.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sh1108.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sh1108.o  -o ${OBJECTDIR}/lcd/u8x8_d_sh1108.o lcd/u8x8_d_sh1108.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_sh1122.o: lcd/u8x8_d_sh1122.c  .generated_files/flags/default/1a6c9fe18cb9abea301062b5e5f6f8c57cfc9224 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1122.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_sh1122.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_sh1122.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_sh1122.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_sh1122.o  -o ${OBJECTDIR}/lcd/u8x8_d_sh1122.o lcd/u8x8_d_sh1122.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1305.o: lcd/u8x8_d_ssd1305.c  .generated_files/flags/default/8a909f7bdaa7e7411be528f85c32316716584f4a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1305.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1305.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1305.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1305.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1305.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1305.o lcd/u8x8_d_ssd1305.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o: lcd/u8x8_d_ssd1306_128x32.c  .generated_files/flags/default/85382b7a3dad63d908fbe575800c07aaf2f385ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x32.o lcd/u8x8_d_ssd1306_128x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o: lcd/u8x8_d_ssd1306_128x64_noname.c  .generated_files/flags/default/302531352701750d3569a6de03693c5d091bdac8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_128x64_noname.o lcd/u8x8_d_ssd1306_128x64_noname.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o: lcd/u8x8_d_ssd1306_2040x16.c  .generated_files/flags/default/3988f96b5d1277b9e505baa4d3c2146d579fb0b8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_2040x16.o lcd/u8x8_d_ssd1306_2040x16.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o: lcd/u8x8_d_ssd1306_48x64.c  .generated_files/flags/default/de529aab52a7c732d4d1456a3b353ee7540e895 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_48x64.o lcd/u8x8_d_ssd1306_48x64.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o: lcd/u8x8_d_ssd1306_64x32.c  .generated_files/flags/default/8568131ef2ba768598eb7bef020a8fc4f3aa77be .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x32.o lcd/u8x8_d_ssd1306_64x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o: lcd/u8x8_d_ssd1306_64x48.c  .generated_files/flags/default/557fb8a1bb87022ca28fd4b1e4437e351852e863 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_64x48.o lcd/u8x8_d_ssd1306_64x48.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o: lcd/u8x8_d_ssd1306_72x40.c  .generated_files/flags/default/e63bec643a99197c4c976c84798b8b95d376161b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_72x40.o lcd/u8x8_d_ssd1306_72x40.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o: lcd/u8x8_d_ssd1306_96x16.c  .generated_files/flags/default/bc13d4a8a7ee532f9765adc9ebbd6d7fdda8f72e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x16.o lcd/u8x8_d_ssd1306_96x16.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o: lcd/u8x8_d_ssd1306_96x40.c  .generated_files/flags/default/5e4a8b65130d8003072accca64f9f9c2c2f8e932 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1306_96x40.o lcd/u8x8_d_ssd1306_96x40.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1309.o: lcd/u8x8_d_ssd1309.c  .generated_files/flags/default/b8911105f37c59999be0d17696736e8bbde30b84 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1309.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1309.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1309.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1309.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1309.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1309.o lcd/u8x8_d_ssd1309.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1312.o: lcd/u8x8_d_ssd1312.c  .generated_files/flags/default/48db6a099fc4a5a95057d0f1d5725f5056b9219f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1312.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1312.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1312.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1312.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1312.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1312.o lcd/u8x8_d_ssd1312.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o: lcd/u8x8_d_ssd1315_128x64_noname.c  .generated_files/flags/default/360c1c973407e16e00910b685bf67f56b1a372c3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1315_128x64_noname.o lcd/u8x8_d_ssd1315_128x64_noname.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1316.o: lcd/u8x8_d_ssd1316.c  .generated_files/flags/default/3d008b6ee4b2a2203444ba34c85f45e12ae82c96 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1316.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1316.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1316.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1316.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1316.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1316.o lcd/u8x8_d_ssd1316.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1317.o: lcd/u8x8_d_ssd1317.c  .generated_files/flags/default/6a1d642669e2273e99da1a831dcdf059d891c49e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1317.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1317.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1317.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1317.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1317.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1317.o lcd/u8x8_d_ssd1317.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1318.o: lcd/u8x8_d_ssd1318.c  .generated_files/flags/default/5a30ebf0aa7bd8e3db957f1a105bc0c06c6bd2f0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1318.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1318.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1318.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1318.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1318.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1318.o lcd/u8x8_d_ssd1318.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1320.o: lcd/u8x8_d_ssd1320.c  .generated_files/flags/default/ebc283e1a98790201a8f613b518f5215e1013a00 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1320.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1320.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1320.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1320.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1320.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1320.o lcd/u8x8_d_ssd1320.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1322.o: lcd/u8x8_d_ssd1322.c  .generated_files/flags/default/c77b289e4810ff144f7a6b72fc859a54da5ae5a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1322.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1322.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1322.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1322.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1322.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1322.o lcd/u8x8_d_ssd1322.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1325.o: lcd/u8x8_d_ssd1325.c  .generated_files/flags/default/b2f9e6e7b16366a5ea4df69487b1b366ab26b419 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1325.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1325.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1325.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1325.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1325.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1325.o lcd/u8x8_d_ssd1325.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1326.o: lcd/u8x8_d_ssd1326.c  .generated_files/flags/default/926293c8608193bff6d170ca096329f154eb5e21 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1326.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1326.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1326.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1326.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1326.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1326.o lcd/u8x8_d_ssd1326.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1327.o: lcd/u8x8_d_ssd1327.c  .generated_files/flags/default/46d7c252f8c0e12bba59a462ba1187bf6873dd74 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1327.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1327.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1327.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1327.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1327.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1327.o lcd/u8x8_d_ssd1327.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1329.o: lcd/u8x8_d_ssd1329.c  .generated_files/flags/default/25d4fd07c497d1b86a943f2ddf16c834602119d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1329.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1329.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1329.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1329.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1329.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1329.o lcd/u8x8_d_ssd1329.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1362.o: lcd/u8x8_d_ssd1362.c  .generated_files/flags/default/f9751d9dce29812354d9e8419decab8444fb5272 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1362.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1362.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1362.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1362.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1362.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1362.o lcd/u8x8_d_ssd1362.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o: lcd/u8x8_d_ssd1362z.c  .generated_files/flags/default/9da7f9518effe18acde1c8a9be5690dc5dd8a94f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1362z.o lcd/u8x8_d_ssd1362z.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1363.o: lcd/u8x8_d_ssd1363.c  .generated_files/flags/default/7dd98d9d3de29227f596e9d4ef47acf11374e234 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1363.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1363.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1363.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1363.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1363.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1363.o lcd/u8x8_d_ssd1363.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o: lcd/u8x8_d_ssd1606_172x72.c  .generated_files/flags/default/f46f3ca7ea5157920913df96c7ab64cfa6eb4145 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1606_172x72.o lcd/u8x8_d_ssd1606_172x72.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o: lcd/u8x8_d_ssd1607_200x200.c  .generated_files/flags/default/986b5b52590d1530b27ec9985c2fa3c4bbe28de7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o  -o ${OBJECTDIR}/lcd/u8x8_d_ssd1607_200x200.o lcd/u8x8_d_ssd1607_200x200.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7302.o: lcd/u8x8_d_st7302.c  .generated_files/flags/default/8678562cc10e5cd2ab943cd93869cb160ee6bef .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7302.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7302.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7302.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7302.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7302.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7302.o lcd/u8x8_d_st7302.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7305.o: lcd/u8x8_d_st7305.c  .generated_files/flags/default/48847d37d055a64034587554048afffe70c0a242 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7305.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7305.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7305.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7305.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7305.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7305.o lcd/u8x8_d_st7305.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7511.o: lcd/u8x8_d_st7511.c  .generated_files/flags/default/d6822840c528c1f56d315ae40d0cc0b174dd9a03 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7511.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7511.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7511.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7511.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7511.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7511.o lcd/u8x8_d_st7511.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st75160.o: lcd/u8x8_d_st75160.c  .generated_files/flags/default/af4047a8c657d9bdafceeee5195e1616c221aec1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75160.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st75160.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st75160.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st75160.o  -o ${OBJECTDIR}/lcd/u8x8_d_st75160.o lcd/u8x8_d_st75160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st75161.o: lcd/u8x8_d_st75161.c  .generated_files/flags/default/e10ec9e30fcf22a8ff8452f1bf116110725aaf43 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75161.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75161.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st75161.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st75161.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st75161.o  -o ${OBJECTDIR}/lcd/u8x8_d_st75161.o lcd/u8x8_d_st75161.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st75256.o: lcd/u8x8_d_st75256.c  .generated_files/flags/default/fc297bca19851562ec0d7d067975f5b8980e8ea9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75256.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75256.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st75256.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st75256.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st75256.o  -o ${OBJECTDIR}/lcd/u8x8_d_st75256.o lcd/u8x8_d_st75256.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7528.o: lcd/u8x8_d_st7528.c  .generated_files/flags/default/abe9d0f1e0bce58bc03216a310f089b05ad7431a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7528.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7528.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7528.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7528.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7528.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7528.o lcd/u8x8_d_st7528.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st75320.o: lcd/u8x8_d_st75320.c  .generated_files/flags/default/1c31ed457f5f0c78c88547a2baf49074693fb3d5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75320.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st75320.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st75320.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st75320.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st75320.o  -o ${OBJECTDIR}/lcd/u8x8_d_st75320.o lcd/u8x8_d_st75320.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7539.o: lcd/u8x8_d_st7539.c  .generated_files/flags/default/1c00a0ab5ad9589b84ab74e47dbcecf597738f36 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7539.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7539.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7539.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7539.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7539.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7539.o lcd/u8x8_d_st7539.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7565.o: lcd/u8x8_d_st7565.c  .generated_files/flags/default/bbb67a99255715b40d737d552ae068b57843035b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7565.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7565.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7565.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7565.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7565.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7565.o lcd/u8x8_d_st7565.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7567.o: lcd/u8x8_d_st7567.c  .generated_files/flags/default/b13831ae825846689ae142dc8ed12002fb4b5b7b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7567.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7567.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7567.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7567.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7567.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7567.o lcd/u8x8_d_st7567.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7571.o: lcd/u8x8_d_st7571.c  .generated_files/flags/default/b06b094ca71c1ac68381c5b4fbff1fa417d28da6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7571.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7571.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7571.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7571.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7571.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7571.o lcd/u8x8_d_st7571.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o: lcd/u8x8_d_st7586s_erc240160.c  .generated_files/flags/default/40887884210391d926d9ac597104ef7e8ffcd651 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7586s_erc240160.o lcd/u8x8_d_st7586s_erc240160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o: lcd/u8x8_d_st7586s_jlx320160.c  .generated_files/flags/default/99e32dd03a664cedc9f3710ef255cc055db2f8c4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx320160.o lcd/u8x8_d_st7586s_jlx320160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o: lcd/u8x8_d_st7586s_jlx384160.c  .generated_files/flags/default/be829dd3d6088957a72feaacd75e441dacf725e2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7586s_jlx384160.o lcd/u8x8_d_st7586s_jlx384160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o: lcd/u8x8_d_st7586s_md240128.c  .generated_files/flags/default/1a0a2723c9badb8c236743a8a889659913ed3a94 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7586s_md240128.o lcd/u8x8_d_st7586s_md240128.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o: lcd/u8x8_d_st7586s_s028hn118a.c  .generated_files/flags/default/266b3692e87cb7e657a31b75de8ca4f5f5d9bdf6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7586s_s028hn118a.o lcd/u8x8_d_st7586s_s028hn118a.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o: lcd/u8x8_d_st7586s_ymc240160.c  .generated_files/flags/default/da03031b6719a1e6bc08e634773b96b574e0b36 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7586s_ymc240160.o lcd/u8x8_d_st7586s_ymc240160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7588.o: lcd/u8x8_d_st7588.c  .generated_files/flags/default/e0f63412af556933e5e2d86e5660d2e6e08adcd4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7588.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7588.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7588.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7588.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7588.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7588.o lcd/u8x8_d_st7588.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_st7920.o: lcd/u8x8_d_st7920.c  .generated_files/flags/default/f43407c7dc5119ff1b95401bf37cea6377c8f48d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7920.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_st7920.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_st7920.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_st7920.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_st7920.o  -o ${OBJECTDIR}/lcd/u8x8_d_st7920.o lcd/u8x8_d_st7920.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_stdio.o: lcd/u8x8_d_stdio.c  .generated_files/flags/default/cbc3ac78f0f5d5bf59ccb480d5b7cf42b2d5b1d1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_stdio.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_stdio.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_stdio.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_stdio.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_stdio.o  -o ${OBJECTDIR}/lcd/u8x8_d_stdio.o lcd/u8x8_d_stdio.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_t6963.o: lcd/u8x8_d_t6963.c  .generated_files/flags/default/270d5cf8330a38e5f5101860d0c1f084abbb03c5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_t6963.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_t6963.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_t6963.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_t6963.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_t6963.o  -o ${OBJECTDIR}/lcd/u8x8_d_t6963.o lcd/u8x8_d_t6963.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1601.o: lcd/u8x8_d_uc1601.c  .generated_files/flags/default/dacd07dfa2926e24c632604c857604bfafea8de2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1601.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1601.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1601.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1601.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1601.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1601.o lcd/u8x8_d_uc1601.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1604.o: lcd/u8x8_d_uc1604.c  .generated_files/flags/default/defefa2dda292d490e907b624ed6053110a78039 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1604.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1604.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1604.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1604.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1604.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1604.o lcd/u8x8_d_uc1604.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1608.o: lcd/u8x8_d_uc1608.c  .generated_files/flags/default/6693bf6f4faa6b785fa528de1cf2069486b7b05 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1608.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1608.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1608.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1608.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1608.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1608.o lcd/u8x8_d_uc1608.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1609.o: lcd/u8x8_d_uc1609.c  .generated_files/flags/default/650421497e5d7210b4d5776f3a0c5657ce452ff4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1609.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1609.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1609.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1609.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1609.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1609.o lcd/u8x8_d_uc1609.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1610.o: lcd/u8x8_d_uc1610.c  .generated_files/flags/default/6429c4b136e5ab5bb3addced3be15031c2cd8600 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1610.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1610.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1610.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1610.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1610.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1610.o lcd/u8x8_d_uc1610.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1611.o: lcd/u8x8_d_uc1611.c  .generated_files/flags/default/e22b0db97fddc6d389f71481e85333224457772 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1611.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1611.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1611.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1611.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1611.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1611.o lcd/u8x8_d_uc1611.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1617.o: lcd/u8x8_d_uc1617.c  .generated_files/flags/default/79346f71c197655328550eacee3b2cd9fc4204f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1617.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1617.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1617.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1617.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1617.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1617.o lcd/u8x8_d_uc1617.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1628.o: lcd/u8x8_d_uc1628.c  .generated_files/flags/default/d567a3dadd4a68221bc446b89fbb5ea46d7ac3c7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1628.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1628.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1628.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1628.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1628.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1628.o lcd/u8x8_d_uc1628.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1638.o: lcd/u8x8_d_uc1638.c  .generated_files/flags/default/ab4ee004fe6732d305ec0465b5767da8d2286452 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1638.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1638.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1638.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1638.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1638.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1638.o lcd/u8x8_d_uc1638.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1698.o: lcd/u8x8_d_uc1698.c  .generated_files/flags/default/4995842cff364ee00d9e14892a4056fad7905109 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1698.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1698.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1698.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1698.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1698.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1698.o lcd/u8x8_d_uc1698.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o: lcd/u8x8_d_uc1701_dogs102.c  .generated_files/flags/default/9b15277ec05739d857e0070e0111fab2b5c2cb7d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1701_dogs102.o lcd/u8x8_d_uc1701_dogs102.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o: lcd/u8x8_d_uc1701_mini12864.c  .generated_files/flags/default/8c6b68e6d11e5755d9e4638f62f3dc0c65df87f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o.d" -MT "${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o.d" -MT ${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o  -o ${OBJECTDIR}/lcd/u8x8_d_uc1701_mini12864.o lcd/u8x8_d_uc1701_mini12864.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_debounce.o: lcd/u8x8_debounce.c  .generated_files/flags/default/3182edec5c76bfaf9e5296ae328aeffb410c2d8e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_debounce.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_debounce.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_debounce.o.d" -MT "${OBJECTDIR}/lcd/u8x8_debounce.o.d" -MT ${OBJECTDIR}/lcd/u8x8_debounce.o  -o ${OBJECTDIR}/lcd/u8x8_debounce.o lcd/u8x8_debounce.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_display.o: lcd/u8x8_display.c  .generated_files/flags/default/50d7da2ad9d2b0a51e1d6a5660cab857b8840cb3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_display.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_display.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_display.o.d" -MT "${OBJECTDIR}/lcd/u8x8_display.o.d" -MT ${OBJECTDIR}/lcd/u8x8_display.o  -o ${OBJECTDIR}/lcd/u8x8_display.o lcd/u8x8_display.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_fonts.o: lcd/u8x8_fonts.c  .generated_files/flags/default/f8fb9445806f7171b547585b389c696c234c2f70 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_fonts.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_fonts.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_fonts.o.d" -MT "${OBJECTDIR}/lcd/u8x8_fonts.o.d" -MT ${OBJECTDIR}/lcd/u8x8_fonts.o  -o ${OBJECTDIR}/lcd/u8x8_fonts.o lcd/u8x8_fonts.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_gpio.o: lcd/u8x8_gpio.c  .generated_files/flags/default/a84b6c0caeb491292a9875a08abdf16534666e81 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_gpio.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_gpio.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_gpio.o.d" -MT "${OBJECTDIR}/lcd/u8x8_gpio.o.d" -MT ${OBJECTDIR}/lcd/u8x8_gpio.o  -o ${OBJECTDIR}/lcd/u8x8_gpio.o lcd/u8x8_gpio.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_input_value.o: lcd/u8x8_input_value.c  .generated_files/flags/default/aec82bdc46139ba10f3916ff8bd8d7c7a1006fdb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_input_value.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_input_value.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_input_value.o.d" -MT "${OBJECTDIR}/lcd/u8x8_input_value.o.d" -MT ${OBJECTDIR}/lcd/u8x8_input_value.o  -o ${OBJECTDIR}/lcd/u8x8_input_value.o lcd/u8x8_input_value.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_message.o: lcd/u8x8_message.c  .generated_files/flags/default/776f65e3f456cd45e0f299b2f025b5567894458 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_message.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_message.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_message.o.d" -MT "${OBJECTDIR}/lcd/u8x8_message.o.d" -MT ${OBJECTDIR}/lcd/u8x8_message.o  -o ${OBJECTDIR}/lcd/u8x8_message.o lcd/u8x8_message.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_selection_list.o: lcd/u8x8_selection_list.c  .generated_files/flags/default/130280b555c9ce656b4829f59b094684d7bf3b52 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_selection_list.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_selection_list.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_selection_list.o.d" -MT "${OBJECTDIR}/lcd/u8x8_selection_list.o.d" -MT ${OBJECTDIR}/lcd/u8x8_selection_list.o  -o ${OBJECTDIR}/lcd/u8x8_selection_list.o lcd/u8x8_selection_list.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_setup.o: lcd/u8x8_setup.c  .generated_files/flags/default/1f92b4c8525131ca821baa3d3a2a42ad6891f946 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_setup.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_setup.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_setup.o.d" -MT "${OBJECTDIR}/lcd/u8x8_setup.o.d" -MT ${OBJECTDIR}/lcd/u8x8_setup.o  -o ${OBJECTDIR}/lcd/u8x8_setup.o lcd/u8x8_setup.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_string.o: lcd/u8x8_string.c  .generated_files/flags/default/d07ef650ab1ba0506539b2fed1453b59ddb6b023 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_string.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_string.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_string.o.d" -MT "${OBJECTDIR}/lcd/u8x8_string.o.d" -MT ${OBJECTDIR}/lcd/u8x8_string.o  -o ${OBJECTDIR}/lcd/u8x8_string.o lcd/u8x8_string.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_u16toa.o: lcd/u8x8_u16toa.c  .generated_files/flags/default/78677fe2fe4e9e150b1a455f1846dd3eefebc101 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_u16toa.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_u16toa.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_u16toa.o.d" -MT "${OBJECTDIR}/lcd/u8x8_u16toa.o.d" -MT ${OBJECTDIR}/lcd/u8x8_u16toa.o  -o ${OBJECTDIR}/lcd/u8x8_u16toa.o lcd/u8x8_u16toa.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/lcd/u8x8_u8toa.o: lcd/u8x8_u8toa.c  .generated_files/flags/default/82053c1197861ed42363db3634856d7b8d2750ba .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/lcd" 
	@${RM} ${OBJECTDIR}/lcd/u8x8_u8toa.o.d 
	@${RM} ${OBJECTDIR}/lcd/u8x8_u8toa.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/lcd/u8x8_u8toa.o.d" -MT "${OBJECTDIR}/lcd/u8x8_u8toa.o.d" -MT ${OBJECTDIR}/lcd/u8x8_u8toa.o  -o ${OBJECTDIR}/lcd/u8x8_u8toa.o lcd/u8x8_u8toa.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/Talking_to_gui.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2 -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="${DISTDIR}/Talking_to_gui.X.${IMAGE_TYPE}.map"    -o ${DISTDIR}/Talking_to_gui.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SNAP=1 -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	
	
	
	
	
	
else
${DISTDIR}/Talking_to_gui.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="${DISTDIR}/Talking_to_gui.X.${IMAGE_TYPE}.map"    -o ${DISTDIR}/Talking_to_gui.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION) -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}/avr-objcopy -O ihex "${DISTDIR}/Talking_to_gui.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/Talking_to_gui.X.${IMAGE_TYPE}.hex"
	
	
	
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
