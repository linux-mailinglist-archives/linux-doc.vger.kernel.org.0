Return-Path: <linux-doc+bounces-8958-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EB5851464
	for <lists+linux-doc@lfdr.de>; Mon, 12 Feb 2024 14:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 158E0281C73
	for <lists+linux-doc@lfdr.de>; Mon, 12 Feb 2024 13:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6C43A1C9;
	Mon, 12 Feb 2024 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnWjb3/T"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6243B194;
	Mon, 12 Feb 2024 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707743614; cv=none; b=mNgM8qsGjRqJO3U8NrNHPLpTpiVKGxHh2jfvEpQyAmNc3PfpM6qeeBwk3DVclRxVMYpetHvAWhXZR3BY5h966qXGjcB9uk6URxcm2oIoXpPzr0nGYh/tl9mC+g6D9zDAVTbdY63tAslhpnMw8ni71QbJx9RvoxU33LHJTkpGrwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707743614; c=relaxed/simple;
	bh=FmMsFeXhutf6tMibK52IysTNfOw//ufgAXxQlMPss38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvYFQIHmtcdRSNMGpi0PZ1WO6OXi0d07QP3BNPRZsGZ19doolOx5gLFOkPqDH+Ird291l+WdkFyB7X7fEF2msYAEyRHNqOAwmtu9px4nnbkUfM7aAXXX4M+jp1KXeiX+DHPdctGiMfFF+ePx5wq042Vo3MDI7gvu2BeWsQKpBPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnWjb3/T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E52C433F1;
	Mon, 12 Feb 2024 13:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707743614;
	bh=FmMsFeXhutf6tMibK52IysTNfOw//ufgAXxQlMPss38=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HnWjb3/TpoD5LsTLuSpJEczOHDyGGzoRzrosplO5/gP+842/Wupq9xSmxNvb1X+Bk
	 KxfKZaxXyPEuXUr/OW87NXXBXtNH9M8R+Fd407emglF3hDAi2qeFrA+CbabjGt88AB
	 NLBSrsrrnhSnJcW2heCyYQrI9apD3TV/sHAgp19Dh59lSGCuHtR+YLSDZ6TD2u/Vkh
	 BF1ImkqsXBCwXMIIu2fOixiupsXFeY137HMl93YRpQgIPYX0lY7fipNBsI2cpqDAl7
	 jDvqCjQLpj36mgSmAVNHrZ5uJiQOlXmm9UwZKxoI/ljZes9lDGH+/u11gOhc5vuGtJ
	 +vWRroeZ4argg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 12 Feb 2024 14:12:45 +0100
Subject: [PATCH v6 02/36] drm/tests: helpers: Add atomic helpers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-kms-hdmi-connector-state-v6-2-f4bcdc979e6f@kernel.org>
References: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
In-Reply-To: <20240212-kms-hdmi-connector-state-v6-0-f4bcdc979e6f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086; i=mripard@kernel.org;
 h=from:subject:message-id; bh=FmMsFeXhutf6tMibK52IysTNfOw//ufgAXxQlMPss38=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmnJOM9l5jtVJtx9t9V/6R5VxWmRbNefFPn/TB67pOGF
 1nzV7X4dZSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAivdWMDH85cgOzrlTdUZI+
 rqLhNmWh7bdbm+79VTFm2FrGyrehUpvhv2syS8bcveE/KjhfGlYoGrrMkPgl/rN1b4HxnnkSb9Z
 xcAEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The mock device we were creating was missing any of the driver-wide
helpers. That was fine before since we weren't testing the atomic state
path, but we're going to start, so let's use the default
implementations.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index ca4f8e4c5d5d..4fb11b938bc1 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_kunit_helpers.h>
 #include <drm/drm_managed.h>
@@ -14,6 +15,8 @@
 #define KUNIT_DEVICE_NAME	"drm-kunit-mock-device"
 
 static const struct drm_mode_config_funcs drm_mode_config_funcs = {
+	.atomic_check	= drm_atomic_helper_check,
+	.atomic_commit	= drm_atomic_helper_commit,
 };
 
 /**

-- 
2.43.0


