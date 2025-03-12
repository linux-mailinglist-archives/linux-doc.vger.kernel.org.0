Return-Path: <linux-doc+bounces-40621-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADB4A5DE37
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 14:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CAF53B31B0
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 13:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF57324C664;
	Wed, 12 Mar 2025 13:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4iY7BvY"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B586724BD00;
	Wed, 12 Mar 2025 13:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741786768; cv=none; b=lNCUsoGsps9L1POvSKM59G4xcj92VETH0ryf/K6x2t3HMEZ5htbog8QPEJpjWgy4xOwdfruJPEzrZxMrR88MpcUWaMM7ErsHwaFZC+3uM/7noLf9A92Re/eFkcDSdo5gNoxqvqIUMe2NdfL1b1zWJissxb9W20szpsFGgpZ7mxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741786768; c=relaxed/simple;
	bh=sZ3e4BpGXfmrcZB9nIeL901BLD7b8fOHw5W772r0HY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UcGkMasXl2CVtJiaCzRsAU14UqEmp4KqDioAmQLrPzrwFNRdkNp8AXkBBVwOPny80d+U6qWVBSYHWQsThSGoPzDr9xXxAjcGUGJx9nPXPWhU/Ai4r77ChZlquMZVSV3ZDchN0x+hfz+mxkO5SL145C2o/TYSOXtPINxdInYKyvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4iY7BvY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44815C4CEEE;
	Wed, 12 Mar 2025 13:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741786768;
	bh=sZ3e4BpGXfmrcZB9nIeL901BLD7b8fOHw5W772r0HY4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o4iY7BvYOdroePIgi0KHkgpQbxULx8F+YItn0ssuafHeo+Svr3YJVNOOQn7VN1CK+
	 VTyhd90J884RrMyr2ST0wqtzWYK1iwvWmQ1d++BPYgF2+FcTJ2UbOH7SFzNTmSXV4X
	 RB12zM72/L16BOAjo3K3TrHyPZuNQ1M4aBQ3EJ9A3OuasrUkCdNztcH0rhqowraykb
	 qtyrddsD1QpsBcgOoRApPLz+5EJxrNaoubDfEcIgiH55sbwzYWug7EGqZgJd2tI1sH
	 bADTfTsFurtTtj0UlMpdsxiTLOxbDrXVWCsRzUeJbWqoRFliVqhlIRPuKcfS+fULkN
	 tDCz82z02NifQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 12 Mar 2025 14:39:17 +0100
Subject: [PATCH v2 2/2] drm/display: hdmi: Mention Infoframes testing with
 edid-decode
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-drm-hdmi-state-docs-v2-2-6352a5d68d5b@kernel.org>
References: <20250312-drm-hdmi-state-docs-v2-0-6352a5d68d5b@kernel.org>
In-Reply-To: <20250312-drm-hdmi-state-docs-v2-0-6352a5d68d5b@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12098; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sZ3e4BpGXfmrcZB9nIeL901BLD7b8fOHw5W772r0HY4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOkX+9rrqti+T5oaeqUwY1eN2LbdkayqDppPYzz89dccu
 TLnltKjjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzkVygjw3Ifxqmlu/beP/jt
 wlXRF2ackaetIm0vREz5se+hjud0RU5Ghss38/03vGismRmlulbre/rFTXUe31i3fri86ard6T+
 z1nIAAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

edid-decode gained recently support to check that infoframes are
compliant and match the EDID the monitor exposes.

Since the HDMI helpers provide those infoframes in debugfs, it makes it
easy to check from userspace that the drivers (and helpers) behave
properly.

Let's document it.

Cc: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 271 ++++++++++++++++++++++++
 1 file changed, 271 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 24bfc82bf9b02bf3201d97432e3c239ccc8714b4..4df3d25529071e8e822f1fe00fb22c90860ec97b 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -16,10 +16,281 @@
  * in the form of KMS helpers.
  *
  * It contains TMDS character rate computation, automatic selection of
  * output formats, infoframes generation, etc.
  *
+ * Infoframes Compliance
+ * ~~~~~~~~~~~~~~~~~~~~~
+ *
+ * Drivers using the helpers will expose the various infoframes
+ * generated according to the HDMI specification in debugfs.
+ *
+ * Compliance can then be tested using ``edid-decode`` from the ``v4l-utils`` project
+ * (https://git.linuxtv.org/v4l-utils.git/). A sample run would look like:
+ *
+ * .. code-block:: bash
+ *
+ *	# edid-decode \
+ *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/audio \
+ *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/avi \
+ *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/hdmi \
+ *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/hdr_drm \
+ *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/spd \
+ *		/sys/class/drm/card1-HDMI-A-1/edid \
+ *		-c
+ *
+ *	edid-decode (hex):
+ *
+ *	00 ff ff ff ff ff ff 00 1e 6d f4 5b 1e ef 06 00
+ *	07 20 01 03 80 2f 34 78 ea 24 05 af 4f 42 ab 25
+ *	0f 50 54 21 08 00 d1 c0 61 40 45 40 01 01 01 01
+ *	01 01 01 01 01 01 98 d0 00 40 a1 40 d4 b0 30 20
+ *	3a 00 d1 0b 12 00 00 1a 00 00 00 fd 00 3b 3d 1e
+ *	b2 31 00 0a 20 20 20 20 20 20 00 00 00 fc 00 4c
+ *	47 20 53 44 51 48 44 0a 20 20 20 20 00 00 00 ff
+ *	00 32 30 37 4e 54 52 4c 44 43 34 33 30 0a 01 46
+ *
+ *	02 03 42 72 23 09 07 07 4d 01 03 04 90 12 13 1f
+ *	22 5d 5e 5f 60 61 83 01 00 00 6d 03 0c 00 10 00
+ *	b8 3c 20 00 60 01 02 03 67 d8 5d c4 01 78 80 03
+ *	e3 0f 00 18 e2 00 6a e3 05 c0 00 e6 06 05 01 52
+ *	52 51 11 5d 00 a0 a0 40 29 b0 30 20 3a 00 d1 0b
+ *	12 00 00 1a 00 00 00 00 00 00 00 00 00 00 00 00
+ *	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ *	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 c3
+ *
+ *	----------------
+ *
+ *	Block 0, Base EDID:
+ *	  EDID Structure Version & Revision: 1.3
+ *	  Vendor & Product Identification:
+ *	    Manufacturer: GSM
+ *	    Model: 23540
+ *	    Serial Number: 454430 (0x0006ef1e)
+ *	    Made in: week 7 of 2022
+ *	  Basic Display Parameters & Features:
+ *	    Digital display
+ *	    Maximum image size: 47 cm x 52 cm
+ *	    Gamma: 2.20
+ *	    DPMS levels: Standby Suspend Off
+ *	    RGB color display
+ *	    First detailed timing is the preferred timing
+ *	  Color Characteristics:
+ *	    Red  : 0.6835, 0.3105
+ *	    Green: 0.2587, 0.6679
+ *	    Blue : 0.1445, 0.0585
+ *	    White: 0.3134, 0.3291
+ *	  Established Timings I & II:
+ *	    DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
+ *	    DMT 0x09:   800x600    60.316541 Hz   4:3     37.879 kHz     40.000000 MHz
+ *	    DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz
+ *	  Standard Timings:
+ *	    DMT 0x52:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
+ *	    DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz
+ *	    DMT 0x09:   800x600    60.316541 Hz   4:3     37.879 kHz     40.000000 MHz
+ *	  Detailed Timing Descriptors:
+ *	    DTD 1:  2560x2880   59.966580 Hz   8:9    185.417 kHz    534.000000 MHz (465 mm x 523 mm)
+ *	                 Hfront   48 Hsync  32 Hback  240 Hpol P
+ *	                 Vfront    3 Vsync  10 Vback  199 Vpol N
+ *	    Display Range Limits:
+ *	      Monitor ranges (GTF): 59-61 Hz V, 30-178 kHz H, max dotclock 490 MHz
+ *	    Display Product Name: 'LG SDQHD'
+ *	    Display Product Serial Number: '207NTRLDC430'
+ *	  Extension blocks: 1
+ *	Checksum: 0x46
+ *
+ *	----------------
+ *
+ *	Block 1, CTA-861 Extension Block:
+ *	  Revision: 3
+ *	  Basic audio support
+ *	  Supports YCbCr 4:4:4
+ *	  Supports YCbCr 4:2:2
+ *	  Native detailed modes: 2
+ *	  Audio Data Block:
+ *	    Linear PCM:
+ *	      Max channels: 2
+ *	      Supported sample rates (kHz): 48 44.1 32
+ *	      Supported sample sizes (bits): 24 20 16
+ *	  Video Data Block:
+ *	    VIC   1:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
+ *	    VIC   3:   720x480    59.940060 Hz  16:9     31.469 kHz     27.000000 MHz
+ *	    VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
+ *	    VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (native)
+ *	    VIC  18:   720x576    50.000000 Hz  16:9     31.250 kHz     27.000000 MHz
+ *	    VIC  19:  1280x720    50.000000 Hz  16:9     37.500 kHz     74.250000 MHz
+ *	    VIC  31:  1920x1080   50.000000 Hz  16:9     56.250 kHz    148.500000 MHz
+ *	    VIC  34:  1920x1080   30.000000 Hz  16:9     33.750 kHz     74.250000 MHz
+ *	    VIC  93:  3840x2160   24.000000 Hz  16:9     54.000 kHz    297.000000 MHz
+ *	    VIC  94:  3840x2160   25.000000 Hz  16:9     56.250 kHz    297.000000 MHz
+ *	    VIC  95:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
+ *	    VIC  96:  3840x2160   50.000000 Hz  16:9    112.500 kHz    594.000000 MHz
+ *	    VIC  97:  3840x2160   60.000000 Hz  16:9    135.000 kHz    594.000000 MHz
+ *	  Speaker Allocation Data Block:
+ *	    FL/FR - Front Left/Right
+ *	  Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
+ *	    Source physical address: 1.0.0.0
+ *	    Supports_AI
+ *	    DC_36bit
+ *	    DC_30bit
+ *	    DC_Y444
+ *	    Maximum TMDS clock: 300 MHz
+ *	    Extended HDMI video details:
+ *	      HDMI VICs:
+ *	        HDMI VIC 1:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
+ *	        HDMI VIC 2:  3840x2160   25.000000 Hz  16:9     56.250 kHz    297.000000 MHz
+ *	        HDMI VIC 3:  3840x2160   24.000000 Hz  16:9     54.000 kHz    297.000000 MHz
+ *	  Vendor-Specific Data Block (HDMI Forum), OUI C4-5D-D8:
+ *	    Version: 1
+ *	    Maximum TMDS Character Rate: 600 MHz
+ *	    SCDC Present
+ *	    Supports 12-bits/component Deep Color 4:2:0 Pixel Encoding
+ *	    Supports 10-bits/component Deep Color 4:2:0 Pixel Encoding
+ *	  YCbCr 4:2:0 Capability Map Data Block:
+ *	    VIC  96:  3840x2160   50.000000 Hz  16:9    112.500 kHz    594.000000 MHz
+ *	    VIC  97:  3840x2160   60.000000 Hz  16:9    135.000 kHz    594.000000 MHz
+ *	  Video Capability Data Block:
+ *	    YCbCr quantization: No Data
+ *	    RGB quantization: Selectable (via AVI Q)
+ *	    PT scan behavior: Always Underscanned
+ *	    IT scan behavior: Always Underscanned
+ *	    CE scan behavior: Always Underscanned
+ *	  Colorimetry Data Block:
+ *	    BT2020YCC
+ *	    BT2020RGB
+ *	  HDR Static Metadata Data Block:
+ *	    Electro optical transfer functions:
+ *	      Traditional gamma - SDR luminance range
+ *	      SMPTE ST2084
+ *	    Supported static metadata descriptors:
+ *	      Static metadata type 1
+ *	    Desired content max luminance: 82 (295.365 cd/m^2)
+ *	    Desired content max frame-average luminance: 82 (295.365 cd/m^2)
+ *	    Desired content min luminance: 81 (0.298 cd/m^2)
+ *	  Detailed Timing Descriptors:
+ *	    DTD 2:  2560x2880   29.986961 Hz   8:9     87.592 kHz    238.250000 MHz (465 mm x 523 mm)
+ *	                 Hfront   48 Hsync  32 Hback   80 Hpol P
+ *	                 Vfront    3 Vsync  10 Vback   28 Vpol N
+ *	Checksum: 0xc3  Unused space in Extension Block: 43 bytes
+ *
+ *	----------------
+ *
+ *	edid-decode 1.29.0-5346
+ *	edid-decode SHA: c363e9aa6d70 2025-03-11 11:41:18
+ *
+ *	Warnings:
+ *
+ *	Block 1, CTA-861 Extension Block:
+ *	  IT Video Formats are overscanned by default, but normally this should be underscanned.
+ *	  Video Data Block: VIC 1 and the first DTD are not identical. Is this intended?
+ *	  Video Data Block: All VICs are in ascending order, and the first (preferred) VIC <= 4, is that intended?
+ *	  Video Capability Data Block: Set Selectable YCbCr Quantization to avoid interop issues.
+ *	  Video Capability Data Block: S_PT is equal to S_IT and S_CE, so should be set to 0 instead.
+ *	  Colorimetry Data Block: Set the sRGB colorimetry bit to avoid interop issues.
+ *	  Display Product Serial Number is set, so the Serial Number in the Base EDID should be 0.
+ *	EDID:
+ *	  Base EDID: Some timings are out of range of the Monitor Ranges:
+ *	    Vertical Freq: 24.000 - 60.317 Hz (Monitor: 59.000 - 61.000 Hz)
+ *	    Horizontal Freq: 31.250 - 185.416 kHz (Monitor: 30.000 - 178.000 kHz)
+ *	    Maximum Clock: 594.000 MHz (Monitor: 490.000 MHz)
+ *
+ *	Failures:
+ *
+ *	Block 1, CTA-861 Extension Block:
+ *	  Video Capability Data Block: IT video formats are always underscanned, but bit 7 of Byte 3 of the CTA-861 Extension header is set to overscanned.
+ *	EDID:
+ *	  CTA-861: Native progressive timings are a mix of several resolutions.
+ *
+ *	EDID conformity: FAIL
+ *
+ *	================
+ *
+ *	InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-1/infoframes/audio' was empty.
+ *
+ *	================
+ *
+ *	edid-decode InfoFrame (hex):
+ *
+ *	82 02 0d 31 12 28 04 00 00 00 00 00 00 00 00 00
+ *	00
+ *
+ *	----------------
+ *
+ *	HDMI InfoFrame Checksum: 0x31
+ *
+ *	AVI InfoFrame
+ *	  Version: 2
+ *	  Length: 13
+ *	  Y: Color Component Sample Format: RGB
+ *	  A: Active Format Information Present: Yes
+ *	  B: Bar Data Present: Bar Data not present
+ *	  S: Scan Information: Composed for an underscanned display
+ *	  C: Colorimetry: No Data
+ *	  M: Picture Aspect Ratio: 16:9
+ *	  R: Active Portion Aspect Ratio: 8
+ *	  ITC: IT Content: No Data
+ *	  EC: Extended Colorimetry: xvYCC601
+ *	  Q: RGB Quantization Range: Limited Range
+ *	  SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
+ *	  YQ: YCC Quantization Range: Limited Range
+ *	  CN: IT Content Type: Graphics
+ *	  PR: Pixel Data Repetition Count: 0
+ *	  Line Number of End of Top Bar: 0
+ *	  Line Number of Start of Bottom Bar: 0
+ *	  Pixel Number of End of Left Bar: 0
+ *	  Pixel Number of Start of Right Bar: 0
+ *
+ *	----------------
+ *
+ *	AVI InfoFrame conformity: PASS
+ *
+ *	================
+ *
+ *	edid-decode InfoFrame (hex):
+ *
+ *	81 01 05 49 03 0c 00 20 01
+ *
+ *	----------------
+ *
+ *	HDMI InfoFrame Checksum: 0x49
+ *
+ *	Vendor-Specific InfoFrame (HDMI), OUI 00-0C-03
+ *	  Version: 1
+ *	  Length: 5
+ *	  HDMI Video Format: HDMI_VIC is present
+ *	  HDMI VIC 1:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
+ *
+ *	----------------
+ *
+ *	Vendor-Specific InfoFrame (HDMI), OUI 00-0C-03 conformity: PASS
+ *
+ *	================
+ *
+ *	InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-1/infoframes/hdr_drm' was empty.
+ *
+ *	================
+ *
+ *	edid-decode InfoFrame (hex):
+ *
+ *	83 01 19 93 42 72 6f 61 64 63 6f 6d 56 69 64 65
+ *	6f 63 6f 72 65 00 00 00 00 00 00 00 09
+ *
+ *	----------------
+ *
+ *	HDMI InfoFrame Checksum: 0x93
+ *
+ *	Source Product Description InfoFrame
+ *	  Version: 1
+ *	  Length: 25
+ *	  Vendor Name: 'Broadcom'
+ *	  Product Description: 'Videocore'
+ *	  Source Information: PC general
+ *
+ *	----------------
+ *
+ *	Source Product Description InfoFrame conformity: PASS
+ *
  * Testing
  * ~~~~~~~
  *
  * The helpers have unit testing and can be tested using kunit with:
  *

-- 
2.48.1


