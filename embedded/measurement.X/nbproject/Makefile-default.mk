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
FINAL_IMAGE=${DISTDIR}/measurement.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/measurement.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=main.c ../lcd/lcd/mui.c ../lcd/lcd/mui_u8g2.c ../lcd/lcd/u8g2_arc.c ../lcd/lcd/u8g2_bitmap.c ../lcd/lcd/u8g2_box.c ../lcd/lcd/u8g2_buffer.c ../lcd/lcd/u8g2_button.c ../lcd/lcd/u8g2_circle.c ../lcd/lcd/u8g2_cleardisplay.c ../lcd/lcd/u8g2_d_memory.c ../lcd/lcd/u8g2_d_setup.c ../lcd/lcd/u8g2_font.c ../lcd/lcd/u8g2_fonts.c ../lcd/lcd/u8g2_hvline.c ../lcd/lcd/u8g2_input_value.c ../lcd/lcd/u8g2_intersection.c ../lcd/lcd/u8g2_kerning.c ../lcd/lcd/u8g2_line.c ../lcd/lcd/u8g2_ll_hvline.c ../lcd/lcd/u8g2_message.c ../lcd/lcd/u8g2_polygon.c ../lcd/lcd/u8g2_selection_list.c ../lcd/lcd/u8g2_setup.c ../lcd/lcd/u8log.c ../lcd/lcd/u8log_u8g2.c ../lcd/lcd/u8log_u8x8.c ../lcd/lcd/u8x8_8x8.c ../lcd/lcd/u8x8_byte.c ../lcd/lcd/u8x8_cad.c ../lcd/lcd/u8x8_capture.c ../lcd/lcd/u8x8_d_a2printer.c ../lcd/lcd/u8x8_d_ch1120.c ../lcd/lcd/u8x8_d_gp1247ai.c ../lcd/lcd/u8x8_d_gp1287ai.c ../lcd/lcd/u8x8_d_gp1294ai.c ../lcd/lcd/u8x8_d_gu800.c ../lcd/lcd/u8x8_d_hd44102.c ../lcd/lcd/u8x8_d_il3820_296x128.c ../lcd/lcd/u8x8_d_ist3020.c ../lcd/lcd/u8x8_d_ist3088.c ../lcd/lcd/u8x8_d_ist7920.c ../lcd/lcd/u8x8_d_ks0108.c ../lcd/lcd/u8x8_d_lc7981.c ../lcd/lcd/u8x8_d_ld7032_60x32.c ../lcd/lcd/u8x8_d_ls013b7dh03.c ../lcd/lcd/u8x8_d_max7219.c ../lcd/lcd/u8x8_d_pcd8544_84x48.c ../lcd/lcd/u8x8_d_pcf8812.c ../lcd/lcd/u8x8_d_pcf8814_hx1230.c ../lcd/lcd/u8x8_d_s1d15300.c ../lcd/lcd/u8x8_d_s1d15721.c ../lcd/lcd/u8x8_d_s1d15e06.c ../lcd/lcd/u8x8_d_sbn1661.c ../lcd/lcd/u8x8_d_sed1330.c ../lcd/lcd/u8x8_d_sh1106_64x32.c ../lcd/lcd/u8x8_d_sh1106_72x40.c ../lcd/lcd/u8x8_d_sh1107.c ../lcd/lcd/u8x8_d_sh1108.c ../lcd/lcd/u8x8_d_sh1122.c ../lcd/lcd/u8x8_d_ssd1305.c ../lcd/lcd/u8x8_d_ssd1306_128x32.c ../lcd/lcd/u8x8_d_ssd1306_128x64_noname.c ../lcd/lcd/u8x8_d_ssd1306_2040x16.c ../lcd/lcd/u8x8_d_ssd1306_48x64.c ../lcd/lcd/u8x8_d_ssd1306_64x32.c ../lcd/lcd/u8x8_d_ssd1306_64x48.c ../lcd/lcd/u8x8_d_ssd1306_72x40.c ../lcd/lcd/u8x8_d_ssd1306_96x16.c ../lcd/lcd/u8x8_d_ssd1306_96x40.c ../lcd/lcd/u8x8_d_ssd1309.c ../lcd/lcd/u8x8_d_ssd1312.c ../lcd/lcd/u8x8_d_ssd1315_128x64_noname.c ../lcd/lcd/u8x8_d_ssd1316.c ../lcd/lcd/u8x8_d_ssd1317.c ../lcd/lcd/u8x8_d_ssd1318.c ../lcd/lcd/u8x8_d_ssd1320.c ../lcd/lcd/u8x8_d_ssd1322.c ../lcd/lcd/u8x8_d_ssd1325.c ../lcd/lcd/u8x8_d_ssd1326.c ../lcd/lcd/u8x8_d_ssd1327.c ../lcd/lcd/u8x8_d_ssd1329.c ../lcd/lcd/u8x8_d_ssd1362.c ../lcd/lcd/u8x8_d_ssd1362z.c ../lcd/lcd/u8x8_d_ssd1363.c ../lcd/lcd/u8x8_d_ssd1606_172x72.c ../lcd/lcd/u8x8_d_ssd1607_200x200.c ../lcd/lcd/u8x8_d_st7302.c ../lcd/lcd/u8x8_d_st7305.c ../lcd/lcd/u8x8_d_st7511.c ../lcd/lcd/u8x8_d_st75160.c ../lcd/lcd/u8x8_d_st75161.c ../lcd/lcd/u8x8_d_st75256.c ../lcd/lcd/u8x8_d_st7528.c ../lcd/lcd/u8x8_d_st75320.c ../lcd/lcd/u8x8_d_st7539.c ../lcd/lcd/u8x8_d_st7565.c ../lcd/lcd/u8x8_d_st7567.c ../lcd/lcd/u8x8_d_st7571.c ../lcd/lcd/u8x8_d_st7586s_erc240160.c ../lcd/lcd/u8x8_d_st7586s_jlx320160.c ../lcd/lcd/u8x8_d_st7586s_jlx384160.c ../lcd/lcd/u8x8_d_st7586s_md240128.c ../lcd/lcd/u8x8_d_st7586s_s028hn118a.c ../lcd/lcd/u8x8_d_st7586s_ymc240160.c ../lcd/lcd/u8x8_d_st7588.c ../lcd/lcd/u8x8_d_st7920.c ../lcd/lcd/u8x8_d_stdio.c ../lcd/lcd/u8x8_d_t6963.c ../lcd/lcd/u8x8_d_uc1601.c ../lcd/lcd/u8x8_d_uc1604.c ../lcd/lcd/u8x8_d_uc1608.c ../lcd/lcd/u8x8_d_uc1609.c ../lcd/lcd/u8x8_d_uc1610.c ../lcd/lcd/u8x8_d_uc1611.c ../lcd/lcd/u8x8_d_uc1617.c ../lcd/lcd/u8x8_d_uc1628.c ../lcd/lcd/u8x8_d_uc1638.c ../lcd/lcd/u8x8_d_uc1698.c ../lcd/lcd/u8x8_d_uc1701_dogs102.c ../lcd/lcd/u8x8_d_uc1701_mini12864.c ../lcd/lcd/u8x8_debounce.c ../lcd/lcd/u8x8_display.c ../lcd/lcd/u8x8_fonts.c ../lcd/lcd/u8x8_gpio.c ../lcd/lcd/u8x8_input_value.c ../lcd/lcd/u8x8_message.c ../lcd/lcd/u8x8_selection_list.c ../lcd/lcd/u8x8_setup.c ../lcd/lcd/u8x8_string.c ../lcd/lcd/u8x8_u16toa.c ../lcd/lcd/u8x8_u8toa.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/1686211268/mui.o ${OBJECTDIR}/_ext/1686211268/mui_u8g2.o ${OBJECTDIR}/_ext/1686211268/u8g2_arc.o ${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o ${OBJECTDIR}/_ext/1686211268/u8g2_box.o ${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o ${OBJECTDIR}/_ext/1686211268/u8g2_button.o ${OBJECTDIR}/_ext/1686211268/u8g2_circle.o ${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o ${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o ${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o ${OBJECTDIR}/_ext/1686211268/u8g2_font.o ${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o ${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o ${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o ${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o ${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o ${OBJECTDIR}/_ext/1686211268/u8g2_line.o ${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o ${OBJECTDIR}/_ext/1686211268/u8g2_message.o ${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o ${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o ${OBJECTDIR}/_ext/1686211268/u8g2_setup.o ${OBJECTDIR}/_ext/1686211268/u8log.o ${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o ${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o ${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o ${OBJECTDIR}/_ext/1686211268/u8x8_byte.o ${OBJECTDIR}/_ext/1686211268/u8x8_cad.o ${OBJECTDIR}/_ext/1686211268/u8x8_capture.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o ${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o ${OBJECTDIR}/_ext/1686211268/u8x8_display.o ${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o ${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o ${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o ${OBJECTDIR}/_ext/1686211268/u8x8_message.o ${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o ${OBJECTDIR}/_ext/1686211268/u8x8_setup.o ${OBJECTDIR}/_ext/1686211268/u8x8_string.o ${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o ${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/_ext/1686211268/mui.o.d ${OBJECTDIR}/_ext/1686211268/mui_u8g2.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_arc.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_box.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_button.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_circle.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_font.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_line.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_message.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o.d ${OBJECTDIR}/_ext/1686211268/u8g2_setup.o.d ${OBJECTDIR}/_ext/1686211268/u8log.o.d ${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o.d ${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_byte.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_cad.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_capture.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_display.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_message.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_setup.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_string.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o.d ${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/1686211268/mui.o ${OBJECTDIR}/_ext/1686211268/mui_u8g2.o ${OBJECTDIR}/_ext/1686211268/u8g2_arc.o ${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o ${OBJECTDIR}/_ext/1686211268/u8g2_box.o ${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o ${OBJECTDIR}/_ext/1686211268/u8g2_button.o ${OBJECTDIR}/_ext/1686211268/u8g2_circle.o ${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o ${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o ${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o ${OBJECTDIR}/_ext/1686211268/u8g2_font.o ${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o ${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o ${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o ${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o ${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o ${OBJECTDIR}/_ext/1686211268/u8g2_line.o ${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o ${OBJECTDIR}/_ext/1686211268/u8g2_message.o ${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o ${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o ${OBJECTDIR}/_ext/1686211268/u8g2_setup.o ${OBJECTDIR}/_ext/1686211268/u8log.o ${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o ${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o ${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o ${OBJECTDIR}/_ext/1686211268/u8x8_byte.o ${OBJECTDIR}/_ext/1686211268/u8x8_cad.o ${OBJECTDIR}/_ext/1686211268/u8x8_capture.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o ${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o ${OBJECTDIR}/_ext/1686211268/u8x8_display.o ${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o ${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o ${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o ${OBJECTDIR}/_ext/1686211268/u8x8_message.o ${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o ${OBJECTDIR}/_ext/1686211268/u8x8_setup.o ${OBJECTDIR}/_ext/1686211268/u8x8_string.o ${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o ${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o

# Source Files
SOURCEFILES=main.c ../lcd/lcd/mui.c ../lcd/lcd/mui_u8g2.c ../lcd/lcd/u8g2_arc.c ../lcd/lcd/u8g2_bitmap.c ../lcd/lcd/u8g2_box.c ../lcd/lcd/u8g2_buffer.c ../lcd/lcd/u8g2_button.c ../lcd/lcd/u8g2_circle.c ../lcd/lcd/u8g2_cleardisplay.c ../lcd/lcd/u8g2_d_memory.c ../lcd/lcd/u8g2_d_setup.c ../lcd/lcd/u8g2_font.c ../lcd/lcd/u8g2_fonts.c ../lcd/lcd/u8g2_hvline.c ../lcd/lcd/u8g2_input_value.c ../lcd/lcd/u8g2_intersection.c ../lcd/lcd/u8g2_kerning.c ../lcd/lcd/u8g2_line.c ../lcd/lcd/u8g2_ll_hvline.c ../lcd/lcd/u8g2_message.c ../lcd/lcd/u8g2_polygon.c ../lcd/lcd/u8g2_selection_list.c ../lcd/lcd/u8g2_setup.c ../lcd/lcd/u8log.c ../lcd/lcd/u8log_u8g2.c ../lcd/lcd/u8log_u8x8.c ../lcd/lcd/u8x8_8x8.c ../lcd/lcd/u8x8_byte.c ../lcd/lcd/u8x8_cad.c ../lcd/lcd/u8x8_capture.c ../lcd/lcd/u8x8_d_a2printer.c ../lcd/lcd/u8x8_d_ch1120.c ../lcd/lcd/u8x8_d_gp1247ai.c ../lcd/lcd/u8x8_d_gp1287ai.c ../lcd/lcd/u8x8_d_gp1294ai.c ../lcd/lcd/u8x8_d_gu800.c ../lcd/lcd/u8x8_d_hd44102.c ../lcd/lcd/u8x8_d_il3820_296x128.c ../lcd/lcd/u8x8_d_ist3020.c ../lcd/lcd/u8x8_d_ist3088.c ../lcd/lcd/u8x8_d_ist7920.c ../lcd/lcd/u8x8_d_ks0108.c ../lcd/lcd/u8x8_d_lc7981.c ../lcd/lcd/u8x8_d_ld7032_60x32.c ../lcd/lcd/u8x8_d_ls013b7dh03.c ../lcd/lcd/u8x8_d_max7219.c ../lcd/lcd/u8x8_d_pcd8544_84x48.c ../lcd/lcd/u8x8_d_pcf8812.c ../lcd/lcd/u8x8_d_pcf8814_hx1230.c ../lcd/lcd/u8x8_d_s1d15300.c ../lcd/lcd/u8x8_d_s1d15721.c ../lcd/lcd/u8x8_d_s1d15e06.c ../lcd/lcd/u8x8_d_sbn1661.c ../lcd/lcd/u8x8_d_sed1330.c ../lcd/lcd/u8x8_d_sh1106_64x32.c ../lcd/lcd/u8x8_d_sh1106_72x40.c ../lcd/lcd/u8x8_d_sh1107.c ../lcd/lcd/u8x8_d_sh1108.c ../lcd/lcd/u8x8_d_sh1122.c ../lcd/lcd/u8x8_d_ssd1305.c ../lcd/lcd/u8x8_d_ssd1306_128x32.c ../lcd/lcd/u8x8_d_ssd1306_128x64_noname.c ../lcd/lcd/u8x8_d_ssd1306_2040x16.c ../lcd/lcd/u8x8_d_ssd1306_48x64.c ../lcd/lcd/u8x8_d_ssd1306_64x32.c ../lcd/lcd/u8x8_d_ssd1306_64x48.c ../lcd/lcd/u8x8_d_ssd1306_72x40.c ../lcd/lcd/u8x8_d_ssd1306_96x16.c ../lcd/lcd/u8x8_d_ssd1306_96x40.c ../lcd/lcd/u8x8_d_ssd1309.c ../lcd/lcd/u8x8_d_ssd1312.c ../lcd/lcd/u8x8_d_ssd1315_128x64_noname.c ../lcd/lcd/u8x8_d_ssd1316.c ../lcd/lcd/u8x8_d_ssd1317.c ../lcd/lcd/u8x8_d_ssd1318.c ../lcd/lcd/u8x8_d_ssd1320.c ../lcd/lcd/u8x8_d_ssd1322.c ../lcd/lcd/u8x8_d_ssd1325.c ../lcd/lcd/u8x8_d_ssd1326.c ../lcd/lcd/u8x8_d_ssd1327.c ../lcd/lcd/u8x8_d_ssd1329.c ../lcd/lcd/u8x8_d_ssd1362.c ../lcd/lcd/u8x8_d_ssd1362z.c ../lcd/lcd/u8x8_d_ssd1363.c ../lcd/lcd/u8x8_d_ssd1606_172x72.c ../lcd/lcd/u8x8_d_ssd1607_200x200.c ../lcd/lcd/u8x8_d_st7302.c ../lcd/lcd/u8x8_d_st7305.c ../lcd/lcd/u8x8_d_st7511.c ../lcd/lcd/u8x8_d_st75160.c ../lcd/lcd/u8x8_d_st75161.c ../lcd/lcd/u8x8_d_st75256.c ../lcd/lcd/u8x8_d_st7528.c ../lcd/lcd/u8x8_d_st75320.c ../lcd/lcd/u8x8_d_st7539.c ../lcd/lcd/u8x8_d_st7565.c ../lcd/lcd/u8x8_d_st7567.c ../lcd/lcd/u8x8_d_st7571.c ../lcd/lcd/u8x8_d_st7586s_erc240160.c ../lcd/lcd/u8x8_d_st7586s_jlx320160.c ../lcd/lcd/u8x8_d_st7586s_jlx384160.c ../lcd/lcd/u8x8_d_st7586s_md240128.c ../lcd/lcd/u8x8_d_st7586s_s028hn118a.c ../lcd/lcd/u8x8_d_st7586s_ymc240160.c ../lcd/lcd/u8x8_d_st7588.c ../lcd/lcd/u8x8_d_st7920.c ../lcd/lcd/u8x8_d_stdio.c ../lcd/lcd/u8x8_d_t6963.c ../lcd/lcd/u8x8_d_uc1601.c ../lcd/lcd/u8x8_d_uc1604.c ../lcd/lcd/u8x8_d_uc1608.c ../lcd/lcd/u8x8_d_uc1609.c ../lcd/lcd/u8x8_d_uc1610.c ../lcd/lcd/u8x8_d_uc1611.c ../lcd/lcd/u8x8_d_uc1617.c ../lcd/lcd/u8x8_d_uc1628.c ../lcd/lcd/u8x8_d_uc1638.c ../lcd/lcd/u8x8_d_uc1698.c ../lcd/lcd/u8x8_d_uc1701_dogs102.c ../lcd/lcd/u8x8_d_uc1701_mini12864.c ../lcd/lcd/u8x8_debounce.c ../lcd/lcd/u8x8_display.c ../lcd/lcd/u8x8_fonts.c ../lcd/lcd/u8x8_gpio.c ../lcd/lcd/u8x8_input_value.c ../lcd/lcd/u8x8_message.c ../lcd/lcd/u8x8_selection_list.c ../lcd/lcd/u8x8_setup.c ../lcd/lcd/u8x8_string.c ../lcd/lcd/u8x8_u16toa.c ../lcd/lcd/u8x8_u8toa.c

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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/measurement.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/155e4f61caeefa46c41b780b07ee4e498dc9777d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/mui.o: ../lcd/lcd/mui.c  .generated_files/flags/default/f4d80a1b47350555e57ff65e3f1056ff89f44f4b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/mui.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/mui.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/mui.o.d" -MT "${OBJECTDIR}/_ext/1686211268/mui.o.d" -MT ${OBJECTDIR}/_ext/1686211268/mui.o  -o ${OBJECTDIR}/_ext/1686211268/mui.o ../lcd/lcd/mui.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/mui_u8g2.o: ../lcd/lcd/mui_u8g2.c  .generated_files/flags/default/767b8ea2a2587539e1802a5e6370950146bc92c8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/mui_u8g2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/mui_u8g2.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/mui_u8g2.o.d" -MT "${OBJECTDIR}/_ext/1686211268/mui_u8g2.o.d" -MT ${OBJECTDIR}/_ext/1686211268/mui_u8g2.o  -o ${OBJECTDIR}/_ext/1686211268/mui_u8g2.o ../lcd/lcd/mui_u8g2.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_arc.o: ../lcd/lcd/u8g2_arc.c  .generated_files/flags/default/8be7079eed4f4953214a6b6058f281a11048af18 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_arc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_arc.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_arc.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_arc.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_arc.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_arc.o ../lcd/lcd/u8g2_arc.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o: ../lcd/lcd/u8g2_bitmap.c  .generated_files/flags/default/bfd9b908f72507375b5dd1ad261395b6124c10b5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o ../lcd/lcd/u8g2_bitmap.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_box.o: ../lcd/lcd/u8g2_box.c  .generated_files/flags/default/75866d7611b9f5e5d7137647708cbfb513e08d05 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_box.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_box.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_box.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_box.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_box.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_box.o ../lcd/lcd/u8g2_box.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o: ../lcd/lcd/u8g2_buffer.c  .generated_files/flags/default/22db13429491fcb52aa7616b9ad5500173bd09a7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o ../lcd/lcd/u8g2_buffer.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_button.o: ../lcd/lcd/u8g2_button.c  .generated_files/flags/default/4dd87fe4d1206a84018ba1fd9e673757ab2d9423 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_button.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_button.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_button.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_button.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_button.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_button.o ../lcd/lcd/u8g2_button.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_circle.o: ../lcd/lcd/u8g2_circle.c  .generated_files/flags/default/b2d90320590ed93746a21d691ae3f686ee12ff58 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_circle.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_circle.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_circle.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_circle.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_circle.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_circle.o ../lcd/lcd/u8g2_circle.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o: ../lcd/lcd/u8g2_cleardisplay.c  .generated_files/flags/default/8ddc6ab0e7d346333ba028401c1d11e35f819af3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o ../lcd/lcd/u8g2_cleardisplay.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o: ../lcd/lcd/u8g2_d_memory.c  .generated_files/flags/default/913d0d628698546f0e4551c05ef6f38f950e0e7d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o ../lcd/lcd/u8g2_d_memory.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o: ../lcd/lcd/u8g2_d_setup.c  .generated_files/flags/default/3fed37d0b9d951cfe2b3ee098def044a45a8c335 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o ../lcd/lcd/u8g2_d_setup.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_font.o: ../lcd/lcd/u8g2_font.c  .generated_files/flags/default/55c4220363ff8902b8fd8f6108ad0cf79b6ad159 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_font.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_font.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_font.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_font.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_font.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_font.o ../lcd/lcd/u8g2_font.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o: ../lcd/lcd/u8g2_fonts.c  .generated_files/flags/default/314d76526e24dbb5afcf16c51742d0c3fe5ead1c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o ../lcd/lcd/u8g2_fonts.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o: ../lcd/lcd/u8g2_hvline.c  .generated_files/flags/default/1d04879bad01701d7f07489fee805530c9c5e4a3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o ../lcd/lcd/u8g2_hvline.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o: ../lcd/lcd/u8g2_input_value.c  .generated_files/flags/default/4e872dcf0bfd41fafc49615de75dfbd24f9df4db .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o ../lcd/lcd/u8g2_input_value.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o: ../lcd/lcd/u8g2_intersection.c  .generated_files/flags/default/23b906199506c6cab1097f78ece8e908080ec67 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o ../lcd/lcd/u8g2_intersection.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o: ../lcd/lcd/u8g2_kerning.c  .generated_files/flags/default/23e0526bb4721981c53c147801f443a60e9ac080 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o ../lcd/lcd/u8g2_kerning.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_line.o: ../lcd/lcd/u8g2_line.c  .generated_files/flags/default/d1170ada1049a681781d6c2be2f859ed6075afec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_line.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_line.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_line.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_line.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_line.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_line.o ../lcd/lcd/u8g2_line.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o: ../lcd/lcd/u8g2_ll_hvline.c  .generated_files/flags/default/e71f73371bb8e43db52da83f22f89398255fa990 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o ../lcd/lcd/u8g2_ll_hvline.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_message.o: ../lcd/lcd/u8g2_message.c  .generated_files/flags/default/cd1ee0e2273afbb317667fdbef89e9cfbe2b4cb7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_message.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_message.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_message.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_message.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_message.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_message.o ../lcd/lcd/u8g2_message.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o: ../lcd/lcd/u8g2_polygon.c  .generated_files/flags/default/4bfe94968d008570a6caff2d6549fa48bf76388a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o ../lcd/lcd/u8g2_polygon.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o: ../lcd/lcd/u8g2_selection_list.c  .generated_files/flags/default/585cbf3afbf2cf3526cb9122c73a4ca22ab7bd70 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o ../lcd/lcd/u8g2_selection_list.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_setup.o: ../lcd/lcd/u8g2_setup.c  .generated_files/flags/default/af53b987c080c057e32dc2864618ca12f4f98221 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_setup.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_setup.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_setup.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_setup.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_setup.o ../lcd/lcd/u8g2_setup.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8log.o: ../lcd/lcd/u8log.c  .generated_files/flags/default/721f56c23302a62823987dcb2f25e81f8c7fb4fd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8log.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8log.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8log.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8log.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8log.o  -o ${OBJECTDIR}/_ext/1686211268/u8log.o ../lcd/lcd/u8log.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o: ../lcd/lcd/u8log_u8g2.c  .generated_files/flags/default/e29a7b8337151a211bbb388a97964f3421da1ee6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o  -o ${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o ../lcd/lcd/u8log_u8g2.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o: ../lcd/lcd/u8log_u8x8.c  .generated_files/flags/default/ad974391f96f28d513463ddd39f06cfa78f9f790 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o  -o ${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o ../lcd/lcd/u8log_u8x8.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o: ../lcd/lcd/u8x8_8x8.c  .generated_files/flags/default/aaebd961a486bbeb593f46a5958003de22e65ca4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o ../lcd/lcd/u8x8_8x8.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_byte.o: ../lcd/lcd/u8x8_byte.c  .generated_files/flags/default/6e9e1bb3f2fd69abdbf5f17b4ce9095e18bf310f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_byte.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_byte.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_byte.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_byte.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_byte.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_byte.o ../lcd/lcd/u8x8_byte.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_cad.o: ../lcd/lcd/u8x8_cad.c  .generated_files/flags/default/b282c2292f92b6a9eb9c11f21cbab9a0a55e2f91 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_cad.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_cad.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_cad.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_cad.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_cad.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_cad.o ../lcd/lcd/u8x8_cad.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_capture.o: ../lcd/lcd/u8x8_capture.c  .generated_files/flags/default/8f86cd4e39a9844a74fbcff5ed6dca042f8003d2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_capture.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_capture.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_capture.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_capture.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_capture.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_capture.o ../lcd/lcd/u8x8_capture.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o: ../lcd/lcd/u8x8_d_a2printer.c  .generated_files/flags/default/6841419578f8d108b141e693cf0525a69f31d579 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o ../lcd/lcd/u8x8_d_a2printer.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o: ../lcd/lcd/u8x8_d_ch1120.c  .generated_files/flags/default/6891f975b0c20d0a6cb1736b59f5e4a27258d89e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o ../lcd/lcd/u8x8_d_ch1120.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o: ../lcd/lcd/u8x8_d_gp1247ai.c  .generated_files/flags/default/d2f20c24042d10495f74487c06afaf8daa84306 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o ../lcd/lcd/u8x8_d_gp1247ai.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o: ../lcd/lcd/u8x8_d_gp1287ai.c  .generated_files/flags/default/dd9bc9a06e55e727d1c01bc2f5e26c0d24bd731a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o ../lcd/lcd/u8x8_d_gp1287ai.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o: ../lcd/lcd/u8x8_d_gp1294ai.c  .generated_files/flags/default/51c473759794e8f9432b43cbbc54e900b83892a9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o ../lcd/lcd/u8x8_d_gp1294ai.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o: ../lcd/lcd/u8x8_d_gu800.c  .generated_files/flags/default/f844d3c0d3c83c7fd4414878fb517bc3a3510251 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o ../lcd/lcd/u8x8_d_gu800.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o: ../lcd/lcd/u8x8_d_hd44102.c  .generated_files/flags/default/e7849f5fefa96155cdee0419e51a9612deab3b8a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o ../lcd/lcd/u8x8_d_hd44102.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o: ../lcd/lcd/u8x8_d_il3820_296x128.c  .generated_files/flags/default/29e691c7230a9e4ce4f68c8cff1074f77506d27e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o ../lcd/lcd/u8x8_d_il3820_296x128.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o: ../lcd/lcd/u8x8_d_ist3020.c  .generated_files/flags/default/b446c85000c4b737a6b45dae7e68d52d4c4f7cd2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o ../lcd/lcd/u8x8_d_ist3020.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o: ../lcd/lcd/u8x8_d_ist3088.c  .generated_files/flags/default/e3ef772fd5bbbd0f6f566d09918ce435099904c3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o ../lcd/lcd/u8x8_d_ist3088.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o: ../lcd/lcd/u8x8_d_ist7920.c  .generated_files/flags/default/bf764a8a2e6eac4d2126b14773e2fdb1269036cd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o ../lcd/lcd/u8x8_d_ist7920.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o: ../lcd/lcd/u8x8_d_ks0108.c  .generated_files/flags/default/602a59a779d5295bdda302d0a96da351363555fe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o ../lcd/lcd/u8x8_d_ks0108.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o: ../lcd/lcd/u8x8_d_lc7981.c  .generated_files/flags/default/c5253e7ff4fb515d1f9574965ea74523b551a287 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o ../lcd/lcd/u8x8_d_lc7981.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o: ../lcd/lcd/u8x8_d_ld7032_60x32.c  .generated_files/flags/default/c2988be94e0c5eda5b79eff3e75755d3618d98de .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o ../lcd/lcd/u8x8_d_ld7032_60x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o: ../lcd/lcd/u8x8_d_ls013b7dh03.c  .generated_files/flags/default/4a9a26be4608ffe080862c983ee3721f1e4e7f88 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o ../lcd/lcd/u8x8_d_ls013b7dh03.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o: ../lcd/lcd/u8x8_d_max7219.c  .generated_files/flags/default/bcb61162ddf90fbb3964b77ef81c4bfaaeb7dd0b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o ../lcd/lcd/u8x8_d_max7219.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o: ../lcd/lcd/u8x8_d_pcd8544_84x48.c  .generated_files/flags/default/ef5225ba6928d54f301525608069029ab323237c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o ../lcd/lcd/u8x8_d_pcd8544_84x48.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o: ../lcd/lcd/u8x8_d_pcf8812.c  .generated_files/flags/default/121ebe971686b4af11d5e246360bb1827e3d2558 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o ../lcd/lcd/u8x8_d_pcf8812.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o: ../lcd/lcd/u8x8_d_pcf8814_hx1230.c  .generated_files/flags/default/fbae66ad34d8ae4aef4ab10b47e1641a0bf96c51 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o ../lcd/lcd/u8x8_d_pcf8814_hx1230.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o: ../lcd/lcd/u8x8_d_s1d15300.c  .generated_files/flags/default/c79b302bf19a7c0f07921ce6489e4ea00a58b476 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o ../lcd/lcd/u8x8_d_s1d15300.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o: ../lcd/lcd/u8x8_d_s1d15721.c  .generated_files/flags/default/d5a1add80e4739890020f2a1017378743d2ee86b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o ../lcd/lcd/u8x8_d_s1d15721.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o: ../lcd/lcd/u8x8_d_s1d15e06.c  .generated_files/flags/default/3e86674bc0f7c224f4a22f621c16828b855c91c5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o ../lcd/lcd/u8x8_d_s1d15e06.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o: ../lcd/lcd/u8x8_d_sbn1661.c  .generated_files/flags/default/552ab72a1d2bec5f631e02e5c002654a350c30ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o ../lcd/lcd/u8x8_d_sbn1661.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o: ../lcd/lcd/u8x8_d_sed1330.c  .generated_files/flags/default/3dbda512c1c27503e6a5cfdf2175ee7d27a9a6b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o ../lcd/lcd/u8x8_d_sed1330.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o: ../lcd/lcd/u8x8_d_sh1106_64x32.c  .generated_files/flags/default/c16aec23c5e19433c5ada110e9f1a155b0bb9d0c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o ../lcd/lcd/u8x8_d_sh1106_64x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o: ../lcd/lcd/u8x8_d_sh1106_72x40.c  .generated_files/flags/default/3f86e6a42b6cb9b22b430979acd7dad5434c4048 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o ../lcd/lcd/u8x8_d_sh1106_72x40.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o: ../lcd/lcd/u8x8_d_sh1107.c  .generated_files/flags/default/1920cd350aa664ea27f853a60c1693ae9247d97b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o ../lcd/lcd/u8x8_d_sh1107.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o: ../lcd/lcd/u8x8_d_sh1108.c  .generated_files/flags/default/e09ca5ff094db149653c7bdc89e7502cfaedf433 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o ../lcd/lcd/u8x8_d_sh1108.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o: ../lcd/lcd/u8x8_d_sh1122.c  .generated_files/flags/default/e552a12fab03a615574f678421b928eb0857ef4c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o ../lcd/lcd/u8x8_d_sh1122.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o: ../lcd/lcd/u8x8_d_ssd1305.c  .generated_files/flags/default/942341e4e072808de698da03563d1442c9bfff6a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o ../lcd/lcd/u8x8_d_ssd1305.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o: ../lcd/lcd/u8x8_d_ssd1306_128x32.c  .generated_files/flags/default/43e7c976bcd08c7ff96017ae0dfb0d40fbdf9c13 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o ../lcd/lcd/u8x8_d_ssd1306_128x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o: ../lcd/lcd/u8x8_d_ssd1306_128x64_noname.c  .generated_files/flags/default/97ec1d1410401585d6fc4148ccf1f6d579dc5b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o ../lcd/lcd/u8x8_d_ssd1306_128x64_noname.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o: ../lcd/lcd/u8x8_d_ssd1306_2040x16.c  .generated_files/flags/default/452246030464605397f750de86637b7e0c981edb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o ../lcd/lcd/u8x8_d_ssd1306_2040x16.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o: ../lcd/lcd/u8x8_d_ssd1306_48x64.c  .generated_files/flags/default/680734e48012191c6f8fe3ba8f2649602e79cc54 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o ../lcd/lcd/u8x8_d_ssd1306_48x64.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o: ../lcd/lcd/u8x8_d_ssd1306_64x32.c  .generated_files/flags/default/4501cabcb6780d2a0f6cf28fad8e76335367f55 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o ../lcd/lcd/u8x8_d_ssd1306_64x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o: ../lcd/lcd/u8x8_d_ssd1306_64x48.c  .generated_files/flags/default/b12949ffbe17c63ea659160c6179f9b9125c97be .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o ../lcd/lcd/u8x8_d_ssd1306_64x48.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o: ../lcd/lcd/u8x8_d_ssd1306_72x40.c  .generated_files/flags/default/dd0a44fc541b601c48ab9f1755b04d664f96c179 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o ../lcd/lcd/u8x8_d_ssd1306_72x40.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o: ../lcd/lcd/u8x8_d_ssd1306_96x16.c  .generated_files/flags/default/c74b5f39d16ff9c9b6fe323aee0b8f6cddb29af8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o ../lcd/lcd/u8x8_d_ssd1306_96x16.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o: ../lcd/lcd/u8x8_d_ssd1306_96x40.c  .generated_files/flags/default/8c1317abc999e561a4061b20465d34ae01ca1c77 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o ../lcd/lcd/u8x8_d_ssd1306_96x40.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o: ../lcd/lcd/u8x8_d_ssd1309.c  .generated_files/flags/default/3d2248074ee75fd640aa8ff89dc23a5a1b73ea55 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o ../lcd/lcd/u8x8_d_ssd1309.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o: ../lcd/lcd/u8x8_d_ssd1312.c  .generated_files/flags/default/a259c299e045e1d5e775c715536b0f95e697ab5c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o ../lcd/lcd/u8x8_d_ssd1312.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o: ../lcd/lcd/u8x8_d_ssd1315_128x64_noname.c  .generated_files/flags/default/dedffb3dc7aae1016489e15258a5a8c538c1a1d7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o ../lcd/lcd/u8x8_d_ssd1315_128x64_noname.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o: ../lcd/lcd/u8x8_d_ssd1316.c  .generated_files/flags/default/9e07c43b1abc4158d4808df1d28109e4a64f45b4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o ../lcd/lcd/u8x8_d_ssd1316.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o: ../lcd/lcd/u8x8_d_ssd1317.c  .generated_files/flags/default/a010f667084a30825452f0e7a30533e237dfa9f4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o ../lcd/lcd/u8x8_d_ssd1317.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o: ../lcd/lcd/u8x8_d_ssd1318.c  .generated_files/flags/default/a08a94301f7484b28974c184b2d6e178bb33f32f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o ../lcd/lcd/u8x8_d_ssd1318.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o: ../lcd/lcd/u8x8_d_ssd1320.c  .generated_files/flags/default/f306fcf9b71c9cac0bb10a3cadf58eba91f616f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o ../lcd/lcd/u8x8_d_ssd1320.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o: ../lcd/lcd/u8x8_d_ssd1322.c  .generated_files/flags/default/af7283c13bd8ed659ad959da8262f92aded80e76 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o ../lcd/lcd/u8x8_d_ssd1322.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o: ../lcd/lcd/u8x8_d_ssd1325.c  .generated_files/flags/default/5ff1127d096c2099a27a7b3764b694f4b7989faa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o ../lcd/lcd/u8x8_d_ssd1325.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o: ../lcd/lcd/u8x8_d_ssd1326.c  .generated_files/flags/default/4ebb481ab67135d7c67ffbe08923890295d9cc7c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o ../lcd/lcd/u8x8_d_ssd1326.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o: ../lcd/lcd/u8x8_d_ssd1327.c  .generated_files/flags/default/6b0f85040f4e3eae4534f9995f4348ebb03dc6ed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o ../lcd/lcd/u8x8_d_ssd1327.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o: ../lcd/lcd/u8x8_d_ssd1329.c  .generated_files/flags/default/a148e68ee5f9f87959ef46d05d170a467c1a4ca9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o ../lcd/lcd/u8x8_d_ssd1329.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o: ../lcd/lcd/u8x8_d_ssd1362.c  .generated_files/flags/default/ab7a49af42bf98c498736a76845cdac5be30a117 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o ../lcd/lcd/u8x8_d_ssd1362.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o: ../lcd/lcd/u8x8_d_ssd1362z.c  .generated_files/flags/default/122e148769f98736af3748a08f4c54326ed51944 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o ../lcd/lcd/u8x8_d_ssd1362z.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o: ../lcd/lcd/u8x8_d_ssd1363.c  .generated_files/flags/default/197d6ea3ba68c790f0ef488e9e76b646c08555a8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o ../lcd/lcd/u8x8_d_ssd1363.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o: ../lcd/lcd/u8x8_d_ssd1606_172x72.c  .generated_files/flags/default/b91db706a3a20e643a4acb516527e1fa047649ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o ../lcd/lcd/u8x8_d_ssd1606_172x72.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o: ../lcd/lcd/u8x8_d_ssd1607_200x200.c  .generated_files/flags/default/a0bed2de50d0c43788bd4580f91969d55dacbc4e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o ../lcd/lcd/u8x8_d_ssd1607_200x200.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o: ../lcd/lcd/u8x8_d_st7302.c  .generated_files/flags/default/35756811f3df3ce790f6813fa8548633ab0dc655 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o ../lcd/lcd/u8x8_d_st7302.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o: ../lcd/lcd/u8x8_d_st7305.c  .generated_files/flags/default/78ab27b1f4315850ad9ecb55008914168b11a854 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o ../lcd/lcd/u8x8_d_st7305.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o: ../lcd/lcd/u8x8_d_st7511.c  .generated_files/flags/default/ec2f7bf8f5443bee7ff9d2f09b18b0b44eeb7408 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o ../lcd/lcd/u8x8_d_st7511.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o: ../lcd/lcd/u8x8_d_st75160.c  .generated_files/flags/default/cbd9e2dc3fad868c24b87e7edc3f46e0f64edf24 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o ../lcd/lcd/u8x8_d_st75160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o: ../lcd/lcd/u8x8_d_st75161.c  .generated_files/flags/default/2efc72a5c409cce86c083685b687d05b07548dbf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o ../lcd/lcd/u8x8_d_st75161.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o: ../lcd/lcd/u8x8_d_st75256.c  .generated_files/flags/default/c3ba7cb388ec008a2bbdd7b2874d035dd495590a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o ../lcd/lcd/u8x8_d_st75256.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o: ../lcd/lcd/u8x8_d_st7528.c  .generated_files/flags/default/9ba4985d10f64b634cb305545e1529460f02a65 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o ../lcd/lcd/u8x8_d_st7528.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o: ../lcd/lcd/u8x8_d_st75320.c  .generated_files/flags/default/a1cb8be6a599da69a0f9b3f02f1a7bd0307f4568 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o ../lcd/lcd/u8x8_d_st75320.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o: ../lcd/lcd/u8x8_d_st7539.c  .generated_files/flags/default/1a5ee8d76fe6f77a741182f9800ed2e501ec7184 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o ../lcd/lcd/u8x8_d_st7539.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o: ../lcd/lcd/u8x8_d_st7565.c  .generated_files/flags/default/85309c40cc9007fc8a4cd40c5e7d1fdc88e15efc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o ../lcd/lcd/u8x8_d_st7565.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o: ../lcd/lcd/u8x8_d_st7567.c  .generated_files/flags/default/508644f4dc30cf0a57de00a1963cdc5a0b71caee .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o ../lcd/lcd/u8x8_d_st7567.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o: ../lcd/lcd/u8x8_d_st7571.c  .generated_files/flags/default/83fba61572efc06a622c8bd4d2e699f00e3e4647 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o ../lcd/lcd/u8x8_d_st7571.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o: ../lcd/lcd/u8x8_d_st7586s_erc240160.c  .generated_files/flags/default/f7302add13951999f5a73e28556e105ad97020f2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o ../lcd/lcd/u8x8_d_st7586s_erc240160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o: ../lcd/lcd/u8x8_d_st7586s_jlx320160.c  .generated_files/flags/default/4c3b29c6ccaf7b8ba415a3ba4f9aa4d76a068d4f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o ../lcd/lcd/u8x8_d_st7586s_jlx320160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o: ../lcd/lcd/u8x8_d_st7586s_jlx384160.c  .generated_files/flags/default/f995bc08c953825442c9d48b9e242322d11e5001 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o ../lcd/lcd/u8x8_d_st7586s_jlx384160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o: ../lcd/lcd/u8x8_d_st7586s_md240128.c  .generated_files/flags/default/c45cfa9a12e0ede1edcd9969c0757fd9f0ace28d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o ../lcd/lcd/u8x8_d_st7586s_md240128.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o: ../lcd/lcd/u8x8_d_st7586s_s028hn118a.c  .generated_files/flags/default/507825ce20c9e8b552e8130176795cbdba3b793c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o ../lcd/lcd/u8x8_d_st7586s_s028hn118a.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o: ../lcd/lcd/u8x8_d_st7586s_ymc240160.c  .generated_files/flags/default/ec297708dfb0987aa08cdc3697a5195bac057508 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o ../lcd/lcd/u8x8_d_st7586s_ymc240160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o: ../lcd/lcd/u8x8_d_st7588.c  .generated_files/flags/default/6c8e643ec2bd8abccf86efae14100c7bd31731b3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o ../lcd/lcd/u8x8_d_st7588.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o: ../lcd/lcd/u8x8_d_st7920.c  .generated_files/flags/default/66f5f47e9816e10ce4d526e6dda3fc9da2e82d65 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o ../lcd/lcd/u8x8_d_st7920.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o: ../lcd/lcd/u8x8_d_stdio.c  .generated_files/flags/default/d22e0762eabedcba7341aa683d4469275b3dc199 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o ../lcd/lcd/u8x8_d_stdio.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o: ../lcd/lcd/u8x8_d_t6963.c  .generated_files/flags/default/676fd0a4e696503dbe7b0f992d59532629b2d2bc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o ../lcd/lcd/u8x8_d_t6963.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o: ../lcd/lcd/u8x8_d_uc1601.c  .generated_files/flags/default/b4bd472ffaf1c31cca047abb53f334589ff94e1f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o ../lcd/lcd/u8x8_d_uc1601.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o: ../lcd/lcd/u8x8_d_uc1604.c  .generated_files/flags/default/6fced80c3417d1bde6b6d3f96278b7e3c4457018 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o ../lcd/lcd/u8x8_d_uc1604.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o: ../lcd/lcd/u8x8_d_uc1608.c  .generated_files/flags/default/b1b970d3d6c7e608e71b41ca9d67c44e19fae9cf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o ../lcd/lcd/u8x8_d_uc1608.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o: ../lcd/lcd/u8x8_d_uc1609.c  .generated_files/flags/default/7372626c466d1e6da240d1f81de3298e6a87aef1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o ../lcd/lcd/u8x8_d_uc1609.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o: ../lcd/lcd/u8x8_d_uc1610.c  .generated_files/flags/default/74a8dc82eb5cb34943b7956a6bf6175276d974bf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o ../lcd/lcd/u8x8_d_uc1610.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o: ../lcd/lcd/u8x8_d_uc1611.c  .generated_files/flags/default/6ec6bc03ae48d28af61bf80049299fb1dac3f6c7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o ../lcd/lcd/u8x8_d_uc1611.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o: ../lcd/lcd/u8x8_d_uc1617.c  .generated_files/flags/default/7e7caa2245c912500796d144a42e2d9b22b36a9a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o ../lcd/lcd/u8x8_d_uc1617.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o: ../lcd/lcd/u8x8_d_uc1628.c  .generated_files/flags/default/394539ca47025b33f3d403f42cc650c551df5ba3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o ../lcd/lcd/u8x8_d_uc1628.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o: ../lcd/lcd/u8x8_d_uc1638.c  .generated_files/flags/default/9a9226f8124e42ed0b371cf672da0dc568a270c6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o ../lcd/lcd/u8x8_d_uc1638.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o: ../lcd/lcd/u8x8_d_uc1698.c  .generated_files/flags/default/507c83442ce93b1d7c3cf40529073850794f6a00 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o ../lcd/lcd/u8x8_d_uc1698.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o: ../lcd/lcd/u8x8_d_uc1701_dogs102.c  .generated_files/flags/default/2a2567cab8f2f88fd476d702a2b9b740f7d5849a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o ../lcd/lcd/u8x8_d_uc1701_dogs102.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o: ../lcd/lcd/u8x8_d_uc1701_mini12864.c  .generated_files/flags/default/2d27032fa49f78aa4ab06c158bc9650a8950cc5a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o ../lcd/lcd/u8x8_d_uc1701_mini12864.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o: ../lcd/lcd/u8x8_debounce.c  .generated_files/flags/default/c37f7526ad97a7b3c567f1878e4bccef863e26c7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o ../lcd/lcd/u8x8_debounce.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_display.o: ../lcd/lcd/u8x8_display.c  .generated_files/flags/default/638a86142c68408ef86d74c65d10099729d53454 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_display.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_display.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_display.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_display.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_display.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_display.o ../lcd/lcd/u8x8_display.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o: ../lcd/lcd/u8x8_fonts.c  .generated_files/flags/default/6975e66b1ad5218fb6e7846b7876b92645fa431a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o ../lcd/lcd/u8x8_fonts.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o: ../lcd/lcd/u8x8_gpio.c  .generated_files/flags/default/f98f7a1013cb7cd1ecf6d1f6bea0ff058b89ba13 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o ../lcd/lcd/u8x8_gpio.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o: ../lcd/lcd/u8x8_input_value.c  .generated_files/flags/default/dc77486b08aa936df7fe508a21675eb7fe4fc22b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o ../lcd/lcd/u8x8_input_value.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_message.o: ../lcd/lcd/u8x8_message.c  .generated_files/flags/default/a0d34aed1dc0bdd91dcd54bea55c2fb5ca4e8a4a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_message.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_message.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_message.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_message.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_message.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_message.o ../lcd/lcd/u8x8_message.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o: ../lcd/lcd/u8x8_selection_list.c  .generated_files/flags/default/ec87f8b76edd89f185566ab4775df91ae2c7ce35 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o ../lcd/lcd/u8x8_selection_list.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_setup.o: ../lcd/lcd/u8x8_setup.c  .generated_files/flags/default/f2d63cb5e69223464e2bd40964709c6ef34aa82b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_setup.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_setup.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_setup.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_setup.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_setup.o ../lcd/lcd/u8x8_setup.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_string.o: ../lcd/lcd/u8x8_string.c  .generated_files/flags/default/368e8caef955e8e500ae8d77667384423f67290 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_string.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_string.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_string.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_string.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_string.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_string.o ../lcd/lcd/u8x8_string.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o: ../lcd/lcd/u8x8_u16toa.c  .generated_files/flags/default/6511797bfe0f282a6d72f008529cd04e3f220d3b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o ../lcd/lcd/u8x8_u16toa.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o: ../lcd/lcd/u8x8_u8toa.c  .generated_files/flags/default/f2ae73eb8a63ec31f0cae201542c4f47c20182f9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o ../lcd/lcd/u8x8_u8toa.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/3b733d83f4f3d6f249b9090e989da1669df1b65d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/mui.o: ../lcd/lcd/mui.c  .generated_files/flags/default/6e78b2e830ae1485529374d1b5278bac39a04b0d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/mui.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/mui.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/mui.o.d" -MT "${OBJECTDIR}/_ext/1686211268/mui.o.d" -MT ${OBJECTDIR}/_ext/1686211268/mui.o  -o ${OBJECTDIR}/_ext/1686211268/mui.o ../lcd/lcd/mui.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/mui_u8g2.o: ../lcd/lcd/mui_u8g2.c  .generated_files/flags/default/c2b190789464580ade2353bebabdc4ecec5e5a65 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/mui_u8g2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/mui_u8g2.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/mui_u8g2.o.d" -MT "${OBJECTDIR}/_ext/1686211268/mui_u8g2.o.d" -MT ${OBJECTDIR}/_ext/1686211268/mui_u8g2.o  -o ${OBJECTDIR}/_ext/1686211268/mui_u8g2.o ../lcd/lcd/mui_u8g2.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_arc.o: ../lcd/lcd/u8g2_arc.c  .generated_files/flags/default/f60a50aead220d1fc442c3d8ed374ec9df27f3c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_arc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_arc.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_arc.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_arc.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_arc.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_arc.o ../lcd/lcd/u8g2_arc.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o: ../lcd/lcd/u8g2_bitmap.c  .generated_files/flags/default/c251a12674b6a07b11c5dc217e500ad49e934e8e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_bitmap.o ../lcd/lcd/u8g2_bitmap.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_box.o: ../lcd/lcd/u8g2_box.c  .generated_files/flags/default/be3b5dd8c21c5b45e2477df1bf993ced94e752ac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_box.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_box.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_box.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_box.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_box.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_box.o ../lcd/lcd/u8g2_box.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o: ../lcd/lcd/u8g2_buffer.c  .generated_files/flags/default/d5de251ed9c37d4e66289b8d180f88238436b7d7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_buffer.o ../lcd/lcd/u8g2_buffer.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_button.o: ../lcd/lcd/u8g2_button.c  .generated_files/flags/default/60bf78d5f93c5a54bbb0f3862b6f4b1a987d9856 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_button.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_button.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_button.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_button.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_button.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_button.o ../lcd/lcd/u8g2_button.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_circle.o: ../lcd/lcd/u8g2_circle.c  .generated_files/flags/default/df1c394406b8516f56eb2f625479986060ed7282 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_circle.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_circle.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_circle.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_circle.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_circle.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_circle.o ../lcd/lcd/u8g2_circle.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o: ../lcd/lcd/u8g2_cleardisplay.c  .generated_files/flags/default/7b7fb6d56d63b81192854a50d64ea1416432662b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_cleardisplay.o ../lcd/lcd/u8g2_cleardisplay.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o: ../lcd/lcd/u8g2_d_memory.c  .generated_files/flags/default/7882763260fd2a772488c46de89e388367114559 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_d_memory.o ../lcd/lcd/u8g2_d_memory.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o: ../lcd/lcd/u8g2_d_setup.c  .generated_files/flags/default/61790edc36ea06e6e756f3aa09766cd67e0d9f09 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_d_setup.o ../lcd/lcd/u8g2_d_setup.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_font.o: ../lcd/lcd/u8g2_font.c  .generated_files/flags/default/7f64b75aa67ce21482f22489bc0bf941dad04450 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_font.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_font.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_font.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_font.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_font.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_font.o ../lcd/lcd/u8g2_font.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o: ../lcd/lcd/u8g2_fonts.c  .generated_files/flags/default/f3489bc96054800d2b7a78714ebf9b5842aeac59 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_fonts.o ../lcd/lcd/u8g2_fonts.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o: ../lcd/lcd/u8g2_hvline.c  .generated_files/flags/default/c7bc1bef9617a6eb756b9b5ea4b76ea6d2a7edab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_hvline.o ../lcd/lcd/u8g2_hvline.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o: ../lcd/lcd/u8g2_input_value.c  .generated_files/flags/default/bb371db1bc570214005aa6256b5bdc0fbb46d85e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_input_value.o ../lcd/lcd/u8g2_input_value.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o: ../lcd/lcd/u8g2_intersection.c  .generated_files/flags/default/eefa5616bda622991f72e1d1f38125c937546da4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_intersection.o ../lcd/lcd/u8g2_intersection.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o: ../lcd/lcd/u8g2_kerning.c  .generated_files/flags/default/de5885ba996095a2188c69acdf5359db1fd16961 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_kerning.o ../lcd/lcd/u8g2_kerning.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_line.o: ../lcd/lcd/u8g2_line.c  .generated_files/flags/default/f0d74c5970e791d46edb115c702cc2ec394ee5af .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_line.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_line.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_line.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_line.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_line.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_line.o ../lcd/lcd/u8g2_line.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o: ../lcd/lcd/u8g2_ll_hvline.c  .generated_files/flags/default/f232345bd0434f19e765073544240a2f2393e8b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_ll_hvline.o ../lcd/lcd/u8g2_ll_hvline.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_message.o: ../lcd/lcd/u8g2_message.c  .generated_files/flags/default/e35c13db01d83b33d8d360da087a3f11cee5031a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_message.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_message.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_message.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_message.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_message.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_message.o ../lcd/lcd/u8g2_message.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o: ../lcd/lcd/u8g2_polygon.c  .generated_files/flags/default/d5cff1b273a6a9fdc839ded7a7afe97bd373a460 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_polygon.o ../lcd/lcd/u8g2_polygon.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o: ../lcd/lcd/u8g2_selection_list.c  .generated_files/flags/default/1ed5bdd0b73a7270dd8180d7959023fd3c3c2135 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_selection_list.o ../lcd/lcd/u8g2_selection_list.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8g2_setup.o: ../lcd/lcd/u8g2_setup.c  .generated_files/flags/default/e2f02b3c0ecb989a7c1c958595d93913b674955a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8g2_setup.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8g2_setup.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8g2_setup.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8g2_setup.o  -o ${OBJECTDIR}/_ext/1686211268/u8g2_setup.o ../lcd/lcd/u8g2_setup.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8log.o: ../lcd/lcd/u8log.c  .generated_files/flags/default/36953aafb058771d86abe60f82ea02c4fc17a861 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8log.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8log.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8log.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8log.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8log.o  -o ${OBJECTDIR}/_ext/1686211268/u8log.o ../lcd/lcd/u8log.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o: ../lcd/lcd/u8log_u8g2.c  .generated_files/flags/default/7bcf6f6d63a6a318cb4464999c4289d15a95f2a7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o  -o ${OBJECTDIR}/_ext/1686211268/u8log_u8g2.o ../lcd/lcd/u8log_u8g2.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o: ../lcd/lcd/u8log_u8x8.c  .generated_files/flags/default/1ad9431b9841241a062fee537c35ce9665e998f1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o  -o ${OBJECTDIR}/_ext/1686211268/u8log_u8x8.o ../lcd/lcd/u8log_u8x8.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o: ../lcd/lcd/u8x8_8x8.c  .generated_files/flags/default/da9b1f3daca713d747dfbbf832ac9a502c537b16 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_8x8.o ../lcd/lcd/u8x8_8x8.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_byte.o: ../lcd/lcd/u8x8_byte.c  .generated_files/flags/default/2298934904feb55999d0abe6b61ded08fd6a345d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_byte.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_byte.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_byte.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_byte.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_byte.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_byte.o ../lcd/lcd/u8x8_byte.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_cad.o: ../lcd/lcd/u8x8_cad.c  .generated_files/flags/default/ba5fd957669d27f9c13b02b5910031933d19fd52 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_cad.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_cad.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_cad.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_cad.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_cad.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_cad.o ../lcd/lcd/u8x8_cad.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_capture.o: ../lcd/lcd/u8x8_capture.c  .generated_files/flags/default/1af10538e32ebd0fe67fb4d1f0e58ada0cf59673 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_capture.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_capture.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_capture.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_capture.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_capture.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_capture.o ../lcd/lcd/u8x8_capture.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o: ../lcd/lcd/u8x8_d_a2printer.c  .generated_files/flags/default/60c45763dd524f8317cdda84210ec8a88c61c33c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_a2printer.o ../lcd/lcd/u8x8_d_a2printer.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o: ../lcd/lcd/u8x8_d_ch1120.c  .generated_files/flags/default/f5b7825ea6c4ecb7c7bb9011072d2df0d5eb7159 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ch1120.o ../lcd/lcd/u8x8_d_ch1120.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o: ../lcd/lcd/u8x8_d_gp1247ai.c  .generated_files/flags/default/7d22e317010e9f081776cc5286a1a1516af89423 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1247ai.o ../lcd/lcd/u8x8_d_gp1247ai.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o: ../lcd/lcd/u8x8_d_gp1287ai.c  .generated_files/flags/default/f0c94ca177efd47b76e26b16edb60ad1fd88b150 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1287ai.o ../lcd/lcd/u8x8_d_gp1287ai.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o: ../lcd/lcd/u8x8_d_gp1294ai.c  .generated_files/flags/default/23eb24e39144c9d6f8e3e2b75944301c35e48a3b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gp1294ai.o ../lcd/lcd/u8x8_d_gp1294ai.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o: ../lcd/lcd/u8x8_d_gu800.c  .generated_files/flags/default/6ff796a06e1244c1c0e2fb5e7b1c2d72d02cf999 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_gu800.o ../lcd/lcd/u8x8_d_gu800.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o: ../lcd/lcd/u8x8_d_hd44102.c  .generated_files/flags/default/7d15d81eeb28b39ef886ad91891ba4aecddd4c0c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_hd44102.o ../lcd/lcd/u8x8_d_hd44102.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o: ../lcd/lcd/u8x8_d_il3820_296x128.c  .generated_files/flags/default/eb05e2c28e4c9aad5b9c685a67cc468d089f94bc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_il3820_296x128.o ../lcd/lcd/u8x8_d_il3820_296x128.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o: ../lcd/lcd/u8x8_d_ist3020.c  .generated_files/flags/default/2189899923206f4a856ff03300ea841d29ed0fb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3020.o ../lcd/lcd/u8x8_d_ist3020.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o: ../lcd/lcd/u8x8_d_ist3088.c  .generated_files/flags/default/fa27830a3722e6b4c7cfd9c358e1cd8deb180dcf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist3088.o ../lcd/lcd/u8x8_d_ist3088.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o: ../lcd/lcd/u8x8_d_ist7920.c  .generated_files/flags/default/608d69639e44b59030259eb5c3b17074ad47e5eb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ist7920.o ../lcd/lcd/u8x8_d_ist7920.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o: ../lcd/lcd/u8x8_d_ks0108.c  .generated_files/flags/default/4eeeb53888244ea2cb437ecfecb987ad30bcc1d6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ks0108.o ../lcd/lcd/u8x8_d_ks0108.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o: ../lcd/lcd/u8x8_d_lc7981.c  .generated_files/flags/default/b540c670927b5b1bf302cab819bbfcfcd989e991 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_lc7981.o ../lcd/lcd/u8x8_d_lc7981.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o: ../lcd/lcd/u8x8_d_ld7032_60x32.c  .generated_files/flags/default/787a7f5a3511d70cf211fa42ac2ac2fbab1cb940 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ld7032_60x32.o ../lcd/lcd/u8x8_d_ld7032_60x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o: ../lcd/lcd/u8x8_d_ls013b7dh03.c  .generated_files/flags/default/9265d7c2d44f429f9f0d775e130920f4d05c1ba3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ls013b7dh03.o ../lcd/lcd/u8x8_d_ls013b7dh03.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o: ../lcd/lcd/u8x8_d_max7219.c  .generated_files/flags/default/d8a5b89779b288847bf310a6f46b90f133a5dacd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_max7219.o ../lcd/lcd/u8x8_d_max7219.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o: ../lcd/lcd/u8x8_d_pcd8544_84x48.c  .generated_files/flags/default/7d8c5e28cf1b0802681b38d6a052e5add15d7ee5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcd8544_84x48.o ../lcd/lcd/u8x8_d_pcd8544_84x48.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o: ../lcd/lcd/u8x8_d_pcf8812.c  .generated_files/flags/default/88224e7d2452ff055db9683a7dd335eee5ddb139 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8812.o ../lcd/lcd/u8x8_d_pcf8812.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o: ../lcd/lcd/u8x8_d_pcf8814_hx1230.c  .generated_files/flags/default/86b4f01cdc32443a251fe4d7e566f1f3bfeea0bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_pcf8814_hx1230.o ../lcd/lcd/u8x8_d_pcf8814_hx1230.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o: ../lcd/lcd/u8x8_d_s1d15300.c  .generated_files/flags/default/276342ded5dee25dd193a9c1a7d04b9552fb3520 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15300.o ../lcd/lcd/u8x8_d_s1d15300.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o: ../lcd/lcd/u8x8_d_s1d15721.c  .generated_files/flags/default/4d7648f6a660a09c0016a7dd61b7ee04343150a3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15721.o ../lcd/lcd/u8x8_d_s1d15721.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o: ../lcd/lcd/u8x8_d_s1d15e06.c  .generated_files/flags/default/35123f71a959a3f0bc4124e859b1cea76c256d0d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_s1d15e06.o ../lcd/lcd/u8x8_d_s1d15e06.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o: ../lcd/lcd/u8x8_d_sbn1661.c  .generated_files/flags/default/4250ba63b6bbd193312327f6f0e3cfc99a8705bb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sbn1661.o ../lcd/lcd/u8x8_d_sbn1661.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o: ../lcd/lcd/u8x8_d_sed1330.c  .generated_files/flags/default/aa95d6f270c5b89544597fb27fdf68e5327f6c71 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sed1330.o ../lcd/lcd/u8x8_d_sed1330.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o: ../lcd/lcd/u8x8_d_sh1106_64x32.c  .generated_files/flags/default/1784b7ea63047f2cca6b227a071b3fd449de34a0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_64x32.o ../lcd/lcd/u8x8_d_sh1106_64x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o: ../lcd/lcd/u8x8_d_sh1106_72x40.c  .generated_files/flags/default/6dbb4c6aa26a6dd422f6abeb2dd17ab404129fa4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1106_72x40.o ../lcd/lcd/u8x8_d_sh1106_72x40.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o: ../lcd/lcd/u8x8_d_sh1107.c  .generated_files/flags/default/31e89890579b3f8dc859f4954adcb25bbbcc5d04 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1107.o ../lcd/lcd/u8x8_d_sh1107.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o: ../lcd/lcd/u8x8_d_sh1108.c  .generated_files/flags/default/81c0a07ea1daafe6fbe0ac7cc4ac00439c969532 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1108.o ../lcd/lcd/u8x8_d_sh1108.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o: ../lcd/lcd/u8x8_d_sh1122.c  .generated_files/flags/default/726d6ece72fe5e2b6e81bc089cb49b38df9a62b1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_sh1122.o ../lcd/lcd/u8x8_d_sh1122.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o: ../lcd/lcd/u8x8_d_ssd1305.c  .generated_files/flags/default/af483c811c08050100ee04cd8f3e62df79f25c6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1305.o ../lcd/lcd/u8x8_d_ssd1305.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o: ../lcd/lcd/u8x8_d_ssd1306_128x32.c  .generated_files/flags/default/9a9e014f497bc1032a1330eb74aed3c6e0fffe08 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x32.o ../lcd/lcd/u8x8_d_ssd1306_128x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o: ../lcd/lcd/u8x8_d_ssd1306_128x64_noname.c  .generated_files/flags/default/8edf40c261fc17aacaac065cfaf5da30249da22a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_128x64_noname.o ../lcd/lcd/u8x8_d_ssd1306_128x64_noname.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o: ../lcd/lcd/u8x8_d_ssd1306_2040x16.c  .generated_files/flags/default/bccccf0698c3414a12e7914110f39b6ad43f32f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_2040x16.o ../lcd/lcd/u8x8_d_ssd1306_2040x16.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o: ../lcd/lcd/u8x8_d_ssd1306_48x64.c  .generated_files/flags/default/7d7445f97e61475d4d48c307d07987bc180de7e2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_48x64.o ../lcd/lcd/u8x8_d_ssd1306_48x64.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o: ../lcd/lcd/u8x8_d_ssd1306_64x32.c  .generated_files/flags/default/529e7c55ca07f3a6ade16929f663b764111a2687 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x32.o ../lcd/lcd/u8x8_d_ssd1306_64x32.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o: ../lcd/lcd/u8x8_d_ssd1306_64x48.c  .generated_files/flags/default/f6ab6dea49d9abe067727abe9e92a94b081a5795 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_64x48.o ../lcd/lcd/u8x8_d_ssd1306_64x48.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o: ../lcd/lcd/u8x8_d_ssd1306_72x40.c  .generated_files/flags/default/e8ab7a3ca6f877decee469e87e2b0a11a2ee0c46 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_72x40.o ../lcd/lcd/u8x8_d_ssd1306_72x40.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o: ../lcd/lcd/u8x8_d_ssd1306_96x16.c  .generated_files/flags/default/5a72ca631684ae1b2278d8c48eca6a4b3a706926 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x16.o ../lcd/lcd/u8x8_d_ssd1306_96x16.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o: ../lcd/lcd/u8x8_d_ssd1306_96x40.c  .generated_files/flags/default/4c04e20269e81e6371dac422baf9ed6de776a8af .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1306_96x40.o ../lcd/lcd/u8x8_d_ssd1306_96x40.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o: ../lcd/lcd/u8x8_d_ssd1309.c  .generated_files/flags/default/fe573d4bbe104e31543ec354875a52f251eb83bf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1309.o ../lcd/lcd/u8x8_d_ssd1309.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o: ../lcd/lcd/u8x8_d_ssd1312.c  .generated_files/flags/default/f32858628db246d9d299ec0cbd6f36190207eefe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1312.o ../lcd/lcd/u8x8_d_ssd1312.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o: ../lcd/lcd/u8x8_d_ssd1315_128x64_noname.c  .generated_files/flags/default/afe8349452edfa4943aa123a772139ff3e5c7900 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1315_128x64_noname.o ../lcd/lcd/u8x8_d_ssd1315_128x64_noname.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o: ../lcd/lcd/u8x8_d_ssd1316.c  .generated_files/flags/default/6b2b71205620cf1f04e0ca773f9a887074826a0a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1316.o ../lcd/lcd/u8x8_d_ssd1316.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o: ../lcd/lcd/u8x8_d_ssd1317.c  .generated_files/flags/default/9254a521c9eed9e50d7d27edeb81d409c81888f8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1317.o ../lcd/lcd/u8x8_d_ssd1317.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o: ../lcd/lcd/u8x8_d_ssd1318.c  .generated_files/flags/default/1576e7e4b31b0358fba79a79697eaed8d406f0d7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1318.o ../lcd/lcd/u8x8_d_ssd1318.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o: ../lcd/lcd/u8x8_d_ssd1320.c  .generated_files/flags/default/71def24c29bb5be107f82657425de4a4527f2be4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1320.o ../lcd/lcd/u8x8_d_ssd1320.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o: ../lcd/lcd/u8x8_d_ssd1322.c  .generated_files/flags/default/684eea6a18cc3ecbd84b89e8b80a416d2d2bffc2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1322.o ../lcd/lcd/u8x8_d_ssd1322.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o: ../lcd/lcd/u8x8_d_ssd1325.c  .generated_files/flags/default/971dcc56b3639333f7bcb97befe5ec865ca4b96f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1325.o ../lcd/lcd/u8x8_d_ssd1325.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o: ../lcd/lcd/u8x8_d_ssd1326.c  .generated_files/flags/default/99037c96ab8de63d916f10608c8253028dc27838 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1326.o ../lcd/lcd/u8x8_d_ssd1326.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o: ../lcd/lcd/u8x8_d_ssd1327.c  .generated_files/flags/default/d5ede598568334a7834bcfc31ccf7ee1a35c089a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1327.o ../lcd/lcd/u8x8_d_ssd1327.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o: ../lcd/lcd/u8x8_d_ssd1329.c  .generated_files/flags/default/5e57cb8c4fa79a37d9f1c44c7cc5ae72a3758fa6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1329.o ../lcd/lcd/u8x8_d_ssd1329.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o: ../lcd/lcd/u8x8_d_ssd1362.c  .generated_files/flags/default/43afb1f1e54ed08d3fc7fd5f7178512fc0fa0afd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362.o ../lcd/lcd/u8x8_d_ssd1362.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o: ../lcd/lcd/u8x8_d_ssd1362z.c  .generated_files/flags/default/8e73c55c720e007d4f171e0a2c054e4e87185533 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1362z.o ../lcd/lcd/u8x8_d_ssd1362z.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o: ../lcd/lcd/u8x8_d_ssd1363.c  .generated_files/flags/default/c7a84a4b9adb48f903fd8bea583808b0c91926e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1363.o ../lcd/lcd/u8x8_d_ssd1363.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o: ../lcd/lcd/u8x8_d_ssd1606_172x72.c  .generated_files/flags/default/fb93ae99087e36220b1c86beae6665ee17b368c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1606_172x72.o ../lcd/lcd/u8x8_d_ssd1606_172x72.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o: ../lcd/lcd/u8x8_d_ssd1607_200x200.c  .generated_files/flags/default/a1e04fd4d067ccf273c27c9d36945d88fe2d1663 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_ssd1607_200x200.o ../lcd/lcd/u8x8_d_ssd1607_200x200.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o: ../lcd/lcd/u8x8_d_st7302.c  .generated_files/flags/default/42fc039d36548ba1033d670ab4e6953c5b0feca3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7302.o ../lcd/lcd/u8x8_d_st7302.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o: ../lcd/lcd/u8x8_d_st7305.c  .generated_files/flags/default/ad78b3f7fb58e1fbce7217da76a93d20742437ae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7305.o ../lcd/lcd/u8x8_d_st7305.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o: ../lcd/lcd/u8x8_d_st7511.c  .generated_files/flags/default/d6fcbe0e25b200d9acb5e70e8f47c7a3fd4d3757 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7511.o ../lcd/lcd/u8x8_d_st7511.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o: ../lcd/lcd/u8x8_d_st75160.c  .generated_files/flags/default/ebd85252574163bd8b70c58a1eda806ec790d071 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75160.o ../lcd/lcd/u8x8_d_st75160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o: ../lcd/lcd/u8x8_d_st75161.c  .generated_files/flags/default/4aa47cde436738dd9498943751ee16a87cc52615 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75161.o ../lcd/lcd/u8x8_d_st75161.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o: ../lcd/lcd/u8x8_d_st75256.c  .generated_files/flags/default/7459b4745f043a700db6b978fa4c6a2f2cf36852 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75256.o ../lcd/lcd/u8x8_d_st75256.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o: ../lcd/lcd/u8x8_d_st7528.c  .generated_files/flags/default/35d3300c9dab47b1074e926b38784c6334e93c9c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7528.o ../lcd/lcd/u8x8_d_st7528.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o: ../lcd/lcd/u8x8_d_st75320.c  .generated_files/flags/default/b7322418fef44a6c0f63cce8ca8d1c649d38d0fa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st75320.o ../lcd/lcd/u8x8_d_st75320.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o: ../lcd/lcd/u8x8_d_st7539.c  .generated_files/flags/default/f83082822be408c03777ca10376f05f409a22d03 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7539.o ../lcd/lcd/u8x8_d_st7539.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o: ../lcd/lcd/u8x8_d_st7565.c  .generated_files/flags/default/1157a632407caa64852ee091074899c64bbe01c3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7565.o ../lcd/lcd/u8x8_d_st7565.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o: ../lcd/lcd/u8x8_d_st7567.c  .generated_files/flags/default/898d821789c7ad7d3c78ee3bcca3aa386f00fb6b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7567.o ../lcd/lcd/u8x8_d_st7567.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o: ../lcd/lcd/u8x8_d_st7571.c  .generated_files/flags/default/784dde7cb482fa6f693fa35bb53ebde74f683411 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7571.o ../lcd/lcd/u8x8_d_st7571.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o: ../lcd/lcd/u8x8_d_st7586s_erc240160.c  .generated_files/flags/default/3df18914b57a757071f44f7ca47129cc04a1c12 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_erc240160.o ../lcd/lcd/u8x8_d_st7586s_erc240160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o: ../lcd/lcd/u8x8_d_st7586s_jlx320160.c  .generated_files/flags/default/880ca367b6231db7e94f545653ecf2ec9f512986 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx320160.o ../lcd/lcd/u8x8_d_st7586s_jlx320160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o: ../lcd/lcd/u8x8_d_st7586s_jlx384160.c  .generated_files/flags/default/6262d41e67177e46cb683b4a896fa1d144bfb53f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_jlx384160.o ../lcd/lcd/u8x8_d_st7586s_jlx384160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o: ../lcd/lcd/u8x8_d_st7586s_md240128.c  .generated_files/flags/default/414ecf005497142325bcdd5d9fd403bd79f5b255 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_md240128.o ../lcd/lcd/u8x8_d_st7586s_md240128.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o: ../lcd/lcd/u8x8_d_st7586s_s028hn118a.c  .generated_files/flags/default/aa84d501b3be52534341f638b6f6983db6c60eed .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_s028hn118a.o ../lcd/lcd/u8x8_d_st7586s_s028hn118a.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o: ../lcd/lcd/u8x8_d_st7586s_ymc240160.c  .generated_files/flags/default/6a78893755ec6277c93e809e64f14534fea19ab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7586s_ymc240160.o ../lcd/lcd/u8x8_d_st7586s_ymc240160.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o: ../lcd/lcd/u8x8_d_st7588.c  .generated_files/flags/default/d4b94b18958b2f1df127e6b67c1b0a14f3bb732c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7588.o ../lcd/lcd/u8x8_d_st7588.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o: ../lcd/lcd/u8x8_d_st7920.c  .generated_files/flags/default/373d0adf27a45841d747536aa1e30ada8d6423f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_st7920.o ../lcd/lcd/u8x8_d_st7920.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o: ../lcd/lcd/u8x8_d_stdio.c  .generated_files/flags/default/dc7e761bfd4f8ec0d56a3af11d677121807c5dee .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_stdio.o ../lcd/lcd/u8x8_d_stdio.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o: ../lcd/lcd/u8x8_d_t6963.c  .generated_files/flags/default/1899436fc2b3cb330c3997d16be864bb1adf137d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_t6963.o ../lcd/lcd/u8x8_d_t6963.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o: ../lcd/lcd/u8x8_d_uc1601.c  .generated_files/flags/default/1c14df02862aca5e43a3b508436a0881b1494e5f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1601.o ../lcd/lcd/u8x8_d_uc1601.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o: ../lcd/lcd/u8x8_d_uc1604.c  .generated_files/flags/default/565b6c50bc49468c6bcf7860ec081a165b55c590 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1604.o ../lcd/lcd/u8x8_d_uc1604.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o: ../lcd/lcd/u8x8_d_uc1608.c  .generated_files/flags/default/6d137776f0690495bdfb7cc30f26954ccbc96eb7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1608.o ../lcd/lcd/u8x8_d_uc1608.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o: ../lcd/lcd/u8x8_d_uc1609.c  .generated_files/flags/default/2896845de5132b8b4a28bc673e5df7a893d49c51 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1609.o ../lcd/lcd/u8x8_d_uc1609.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o: ../lcd/lcd/u8x8_d_uc1610.c  .generated_files/flags/default/e343953c6072f2f6ce7039964d15c9f4e32ec15f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1610.o ../lcd/lcd/u8x8_d_uc1610.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o: ../lcd/lcd/u8x8_d_uc1611.c  .generated_files/flags/default/22493144515e7816d07dbba4e3e39893a88d76ee .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1611.o ../lcd/lcd/u8x8_d_uc1611.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o: ../lcd/lcd/u8x8_d_uc1617.c  .generated_files/flags/default/1902f739e030bffd1daf2be46c1e32ebfffc88e6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1617.o ../lcd/lcd/u8x8_d_uc1617.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o: ../lcd/lcd/u8x8_d_uc1628.c  .generated_files/flags/default/8cce2b844822341c6abbc1536a219431a5b51ce .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1628.o ../lcd/lcd/u8x8_d_uc1628.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o: ../lcd/lcd/u8x8_d_uc1638.c  .generated_files/flags/default/47a3f1df8079364f1de98eba756ff7b3141740bd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1638.o ../lcd/lcd/u8x8_d_uc1638.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o: ../lcd/lcd/u8x8_d_uc1698.c  .generated_files/flags/default/432ec75625b52da4c0521261b1cd25b9c656dec1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1698.o ../lcd/lcd/u8x8_d_uc1698.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o: ../lcd/lcd/u8x8_d_uc1701_dogs102.c  .generated_files/flags/default/e394d37d181f825bbe857ebbdffdc694f71443a7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_dogs102.o ../lcd/lcd/u8x8_d_uc1701_dogs102.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o: ../lcd/lcd/u8x8_d_uc1701_mini12864.c  .generated_files/flags/default/2a820a683fbce96ff40ef388c3e77fc7e90bf34c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_d_uc1701_mini12864.o ../lcd/lcd/u8x8_d_uc1701_mini12864.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o: ../lcd/lcd/u8x8_debounce.c  .generated_files/flags/default/20b18a350635b2c7834e52bd22c29e7355bc41db .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_debounce.o ../lcd/lcd/u8x8_debounce.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_display.o: ../lcd/lcd/u8x8_display.c  .generated_files/flags/default/fd600cc5571b2f0060f50ab269fe43f5a1675fa7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_display.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_display.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_display.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_display.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_display.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_display.o ../lcd/lcd/u8x8_display.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o: ../lcd/lcd/u8x8_fonts.c  .generated_files/flags/default/feac0f6c3f977892ed89af6170b4b136fce7e773 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_fonts.o ../lcd/lcd/u8x8_fonts.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o: ../lcd/lcd/u8x8_gpio.c  .generated_files/flags/default/fa3d81e9a3a1a25603830f3ae4b17b3f25271fe .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_gpio.o ../lcd/lcd/u8x8_gpio.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o: ../lcd/lcd/u8x8_input_value.c  .generated_files/flags/default/4d3623799dd0778e2390b5da52fd27a3210157d4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_input_value.o ../lcd/lcd/u8x8_input_value.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_message.o: ../lcd/lcd/u8x8_message.c  .generated_files/flags/default/5f541779c3c9235f79e9f731c158e819ff4207fa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_message.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_message.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_message.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_message.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_message.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_message.o ../lcd/lcd/u8x8_message.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o: ../lcd/lcd/u8x8_selection_list.c  .generated_files/flags/default/d0b515331d1f7a81ee837d337723b89e6ae70a78 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_selection_list.o ../lcd/lcd/u8x8_selection_list.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_setup.o: ../lcd/lcd/u8x8_setup.c  .generated_files/flags/default/cd5cb8236205e50d22a4b8f94086d54638cf296a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_setup.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_setup.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_setup.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_setup.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_setup.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_setup.o ../lcd/lcd/u8x8_setup.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_string.o: ../lcd/lcd/u8x8_string.c  .generated_files/flags/default/51890067b695a3b83b229fd5057d6914b94c5604 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_string.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_string.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_string.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_string.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_string.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_string.o ../lcd/lcd/u8x8_string.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o: ../lcd/lcd/u8x8_u16toa.c  .generated_files/flags/default/ac0687f9f2b2e79f5ff047c8b6ffda696579e4bf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_u16toa.o ../lcd/lcd/u8x8_u16toa.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o: ../lcd/lcd/u8x8_u8toa.c  .generated_files/flags/default/c0360fdb0389fd7a57e2bffbf436b8cb4e7ce73 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1686211268" 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o.d 
	@${RM} ${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -I"../lcd/lcd" -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o.d" -MT "${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o.d" -MT ${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o  -o ${OBJECTDIR}/_ext/1686211268/u8x8_u8toa.o ../lcd/lcd/u8x8_u8toa.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/measurement.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__MPLAB_DEBUGGER_SNAP=1 -gdwarf-2 -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="${DISTDIR}/measurement.X.${IMAGE_TYPE}.map"    -o ${DISTDIR}/measurement.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SNAP=1 -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	
	
	
	
	
	
else
${DISTDIR}/measurement.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="${DISTDIR}/measurement.X.${IMAGE_TYPE}.map"    -o ${DISTDIR}/measurement.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION) -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}/avr-objcopy -O ihex "${DISTDIR}/measurement.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/measurement.X.${IMAGE_TYPE}.hex"
	
	
	
	
	
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
