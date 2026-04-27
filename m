Return-Path: <linux-doc+bounces-84682-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA0IJhUM72kq4wAAu9opvQ
	(envelope-from <linux-doc+bounces-84682-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 09:11:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B73146E23A
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 09:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46D253066A09
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 07:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B597283FC8;
	Mon, 27 Apr 2026 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xj+0wbrn"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC67E241695
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273404; cv=none; b=nNVGyXrKf9hJRYCN7NfSSBUQUJGWJ8uVHlEHDX/hvTxj8eqt241rR3X8GPlR5T4brNUyU6woY33/twsI1QqduDFlDO5jf2no44MumYuw07f/cGh1SXXRBHSoTKRKhm4j4ZoqZTxGb62siESWxw21eEda47cAq0TrwPEmJz/354w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273404; c=relaxed/simple;
	bh=j51Q+8mt4C7VLTrw6ArNSmzDrpkGTUdoDwgnpPfZf10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFwZ8Yc3NNZupafg4dq59jVXEHlUo9XX9BFQM0/KyI0eLLjPQGLa3RdI3vVS5zns7AyRpvNkA55h2F+4ax7lc+eXuBFA+h9Jxz7W/oCT4f98Qj8kVlkLCJMCt4rIBnoir2GgZJGiZI4JkEhK/PBUmfACWKQTwJI5QLMR7vdZ1EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xj+0wbrn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0671AC19425;
	Mon, 27 Apr 2026 07:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777273403;
	bh=j51Q+8mt4C7VLTrw6ArNSmzDrpkGTUdoDwgnpPfZf10=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xj+0wbrnoLj+OKinrC05V1Y1/UMoYUN6WWwcivuWZoLvcThOzZZlxrtu2QoQKsFjV
	 IWzGdy+amVBVu7PBDUmC39nmnz3RNJE/haAVeZWYD+pr56idooP1XWvHqS10C+VIX9
	 7zIy9j3WGHdcrzedMeFS2/9GP/wclCd5wkQkm6umbWS+TBFivyut86Fy6/y7ptFs37
	 utn3s6mMxFF7YjabR7D/hw7+JigLpFCV8yRpCLAAaUgczn8m5oF2akV+yuo6FTMzsc
	 +17hWTQrcUV1YqWj5A5YSpYGXL6044Lkvdtd4syMURkrPGxfHKGRmWc9cvwLuDE83A
	 IrhlEFpwuSNmQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 27 Apr 2026 09:02:58 +0200
Subject: [PATCH v4 2/2] Documentation: drm: Remove drm_atomic_state rename
 entry
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-drm-drm-atomic-update-v4-2-c0e713bfdf25@kernel.org>
References: <20260427-drm-drm-atomic-update-v4-0-c0e713bfdf25@kernel.org>
In-Reply-To: <20260427-drm-drm-atomic-update-v4-0-c0e713bfdf25@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781; i=mripard@kernel.org;
 h=from:subject:message-id; bh=j51Q+8mt4C7VLTrw6ArNSmzDrpkGTUdoDwgnpPfZf10=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnvuQyeuZ5Vmi34InBy1Ur9nomdfw3OL7hv5m744WTIh
 qdvotaEdkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJeB5lrGY99LeA76nnx7nG
 PZr8CztmdoWav/U9XbixJPcS07zF052X7L/7WTFSh3lV2AnlmxWGTxgbDqossYsL/Xpyvddelov
 LnBvzQwJcxRPTpt6adMqm3bNxqVix8cu5GoKph8Wb5hdmC80BAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Queue-Id: 1B73146E23A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,suse.de,lwn.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84682-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,bootlin.com:email]

We just did that item so we can remove it.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/todo.rst | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 2ceb00e08c59..cdddf8db35f5 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -150,33 +150,10 @@ still look at that flag.
 
 Contact: Simona Vetter, respective driver maintainers
 
 Level: Advanced
 
-Rename drm_atomic_commit
------------------------
-
-The KMS framework uses two slightly different definitions for the ``state``
-concept. For a given object (plane, CRTC, encoder, etc., so
-``drm_$OBJECT_state``), the state is the entire state of that object. However,
-at the device level, ``drm_atomic_commit`` refers to a state update for a
-limited number of objects.
-
-The state isn't the entire device state, but only the full state of some
-objects in that device. This is confusing to newcomers, and
-``drm_atomic_commit`` should be renamed to something clearer like
-``drm_atomic_commit``.
-
-In addition to renaming the structure itself, it would also imply renaming some
-related functions (``drm_atomic_commit_alloc``, ``drm_atomic_commit_get``,
-``drm_atomic_commit_put``, ``drm_atomic_commit_init``,
-``__drm_atomic_commit_free``, etc.).
-
-Contact: Maxime Ripard <mripard@kernel.org>
-
-Level: Advanced
-
 Fallout from atomic KMS
 -----------------------
 
 ``drm_atomic_helper.c`` provides a batch of functions which implement legacy
 IOCTLs on top of the new atomic driver interface. Which is really nice for

-- 
2.53.0


