Return-Path: <linux-doc+bounces-84193-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJq2KZv86Gl5SgIAu9opvQ
	(envelope-from <linux-doc+bounces-84193-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 18:51:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D045448EE4
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 18:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 490D73022F6E
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 16:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731F6381B00;
	Wed, 22 Apr 2026 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QDhhzZR8"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3738BF67
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 16:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876550; cv=none; b=gTupM4ZFdPCCqVB8SsmgjEzN3/7hbgfLOZpjqWYJCt8xvEV2lPNeh+tzqT5543/RyF3I0ZQq3uwxo6vUlsJVxhoa/ty7J/CcTt3aszn94Rg+DotX1dPYEw6GW3uC7JFxsoSy61mNN/su+BOkQQtUyQpx4DmQC+fnP3G6mJjBLDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876550; c=relaxed/simple;
	bh=T7fGbMxDqwWl/YlJbx6PYupbGjEruCinEDQCQvdpRxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iNNPw0v/hz/BlJ9VC2X2C0ujYZgaeLV47zVlD9BGwovQrGb2ayT150ZQcqIr3kAepIJDNxFxIGANlalXqExwDXl4G3R/MRijldG2DsLYC/aJoVjiZfY18eT+9TtENJdeZ0OfWmqaZkIXlkDukB0d91qIr2LHLrptd1MbNvdR0jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QDhhzZR8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8FE3CC5AA8C;
	Wed, 22 Apr 2026 16:49:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD2F15FA8F;
	Wed, 22 Apr 2026 16:49:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D4F910460C0F;
	Wed, 22 Apr 2026 18:49:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776876546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AwmYa1vngn+nSmQNXGb3qaN5w3tDhbVRzcmSdCp8gCU=;
	b=QDhhzZR8JJ20/5xnZWVgACSeTlk+eSlVualSxdsiwQw0HxLyHakSJOXWi9QyCE9mPG1XVK
	9yqWFPDX2ctnzLISfSSGuGTo8VzjysqJ0D0fET6GWQzRi2WpStZ7YaLMtwlnaxMxXoa6g/
	7bp+3/VfYMtJb+kqzaVH0x28dQ8PP/J5qUNItt6ZKxo4Spi4URGA/1nmbj6s/hAy/EWkj4
	bKyyKvVEzQzp989EnEy5/e77vMCPOB5GK6geC39UjDV+i9HDxECjl1evxbj+GtBrjdZFlr
	qRjNokVWFxJHGB7BlB60ht7/LsCJy1mZc72GT/SLTovQUfv6XEHsvu8CxWHqLg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 22 Apr 2026 18:48:03 +0200
Subject: [PATCH v4 06/37] drm/drm_atomic_state_helper: Properly load
 default value for rotation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-vkms-all-config-v4-6-dbb52e9aadc3@bootlin.com>
References: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
In-Reply-To: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.16-dev
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84193-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,google.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[system76.com,redhat.com,gmail.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 0D045448EE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, the default rotation is always DRM_MODE_ROTATE_0 for all planes.
Some planes may have a rotation property, and the property may specify a
different default value and supported values.

This is not an issue for "fixed" configurations, but with the introduction
of VKMS configuration, some plane may only support 90° and 180°
rotations, so the reset state of the plane was wrong (forced to 0°).

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 76746ad4a1bb..d2b325d6fc4b 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -32,6 +32,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_mode_object.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
@@ -251,6 +252,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 
 	plane_state->plane = plane;
 	plane_state->rotation = DRM_MODE_ROTATE_0;
+	if (plane->rotation_property &&
+	    !drm_object_property_get_default_value(&plane->base,
+						   plane->rotation_property,
+						   &val))
+		plane_state->rotation = val;
 
 	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
 	plane_state->pixel_blend_mode = DRM_MODE_BLEND_PREMULTI;

-- 
2.54.0


