Return-Path: <linux-doc+bounces-6591-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8BF829F7E
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jan 2024 18:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 566D2B23E5F
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jan 2024 17:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010124CDF4;
	Wed, 10 Jan 2024 17:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="n67RvaI6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6300E4CB4E;
	Wed, 10 Jan 2024 17:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4T9FXr6ZsYz9xGd;
	Wed, 10 Jan 2024 17:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1704908653; bh=rTk1KRQfBuElUNFtlTDf/yfk4wDvRlY+/DuxvH5lO0w=;
	h=From:Subject:Date:To:Cc:From;
	b=n67RvaI6rVM9YKagI6ysawPXr7ASFVSJNtwi3EefNPPr03T8kF6eKC9sQjJYiSEUS
	 yo2lmE2RmaF6qdfvTLezra6dnk3k+FasU+LI4fBPHn6i7wk5WtqrJXMcnRDAffNulv
	 85XQrWXNspfLQpsYrsxFBB3YqpEQ+hQegNdChUAw=
X-Riseup-User-ID: DDE24846D5B7353908825AAF958A18C2BC5A8C6BC92B957431BEE6699EADD5FD
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4T9FXm2tSvzJmtT;
	Wed, 10 Jan 2024 17:44:08 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 0/7] Add YUV formats to VKMS
Date: Wed, 10 Jan 2024 14:44:00 -0300
Message-Id: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGHXnmUC/0XMSw6CMBSF4a2QO7amT0RH7sMwMO2t3BgLaaGRk
 O7dwsThf3LybZAwEia4NRtEzJRoDDXkqQE7PMMLGbnaILlUQsqW5fcnsXXJrPWXzly9ks53UO9
 TRE/fg3r0tQdK8xjXQ85iX3dEc8HNH8mCcaa01dYpbQzye6SEy3QOOENfSvkBSVX/D6EAAAA=
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Arthur Grillo <arthurgrillo@riseup.net>

This patchset aims to add support for additional buffer YUV formats.
More specifically, it adds support to:

Semi-planar formats:

- NV12
- NV16
- NV24
- NV21
- NV61
- NV42

Planar formats:

- YUV440
- YUV422
- YUV444
- YVU440
- YVU422
- YVU444

These formats have more than one plane, and most have chroma
subsampling. These properties don't have support on VKMS, so I had to
work on this before.

To ensure that the conversions from YUV to RGB are working, I wrote a
KUnit test. As the work from Harry on creating KUnit tests on VKMS[1] is
not yet merged, I took the setup part (Kconfig entry and .kunitfile)
from it.

Furthermore, I couldn't find any sources with the conversion matrices,
so I had to work out the values myself based on the ITU papers[2][3][4].
So, I'm not 100% sure if the values are accurate. I'd appreciate some
input if anyone has more knowledge in this area.

Also, I used two IGT tests to check if the formats were having a correct
conversion (all with the --extended flag):

- kms_plane@pixel_format
- kms_plane@pixel_format_source_clamping.

The nonsubsampled formats don't have support on IGT, so I sent a patch
fixing this[5].

Currently, this patchset does not add those formats to the writeback, as
it would require a rewrite of how the conversions are done (similar to
what was done on a previous patch[6]). So, I would like to review this
patchset before I start the work on this other part.

[1]: https://lore.kernel.org/all/20231108163647.106853-5-harry.wentland@amd.com/
[2]: https://www.itu.int/rec/R-REC-BT.601-7-201103-I/en
[3]: https://www.itu.int/rec/R-REC-BT.709-6-201506-I/en
[4]: https://www.itu.int/rec/R-REC-BT.2020-2-201510-I/en
[5]: https://lists.freedesktop.org/archives/igt-dev/2024-January/066937.html
[6]: https://lore.kernel.org/dri-devel/20230414135151.75975-2-mcanal@igalia.com/

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
Changes in v2:
- Use EXPORT_SYMBOL_IF_KUNIT instead of including the .c test
  file (Maxime)
- Link to v1: https://lore.kernel.org/r/20240105-vkms-yuv-v1-0-34c4cd3455e0@riseup.net

---
Arthur Grillo (7):
      drm/vkms: Use drm_frame directly
      drm/vkms: Add support for multy-planar framebuffers
      drm/vkms: Add range and encoding properties to pixel_read function
      drm/vkms: Add chroma subsampling
      drm/vkms: Add YUV support
      drm/vkms: Drop YUV formats TODO
      drm/vkms: Create KUnit tests for YUV conversions

 Documentation/gpu/vkms.rst                    |   3 +-
 drivers/gpu/drm/vkms/Kconfig                  |  15 ++
 drivers/gpu/drm/vkms/Makefile                 |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 156 ++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
 drivers/gpu/drm/vkms/vkms_formats.c           | 247 ++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_formats.h           |   9 +
 drivers/gpu/drm/vkms/vkms_plane.c             |  26 ++-
 drivers/gpu/drm/vkms/vkms_writeback.c         |   5 -
 11 files changed, 426 insertions(+), 49 deletions(-)
---
base-commit: eeb8e8d9f124f279e80ae679f4ba6e822ce4f95f
change-id: 20231226-vkms-yuv-6f7859f32df8

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>


