Return-Path: <linux-doc+bounces-17710-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A51A98FC09C
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jun 2024 02:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 202DC1F22314
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jun 2024 00:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C537345F;
	Wed,  5 Jun 2024 00:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OXTvFuYk"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B0D6E613
	for <linux-doc@vger.kernel.org>; Wed,  5 Jun 2024 00:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717547107; cv=none; b=oLgDgD9lKodUMaFM72VYcRrLawM7hspn+cKFOJPO6N4XS1GdIQYhiusBME3na02doYR/MkFberldppKFMcBx1BTjwiPC+HBVnZ7HJdY14IczNnNhcQNwzVdwhamNypbQ+cDoNosMKdWVTs7cegYI7Yw5ST3pZhoRFnONdf5ILko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717547107; c=relaxed/simple;
	bh=UvReAyJuyfxw0/X0unkA1v/ZdN1GANsk3RihvlLT4xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTe37/ZZbT/rGxMpUmOr4zsMZRrJokHvZQqNMUM6LhQae0xipR4TmINo9cm8PeNFxCssw2qBcVSsUvaFAVl1ViImhmL4tZe+CYYrwv+yXE+symnmjugOBh3wUf31mF4x/IP6Z7ywuDT1ZWJ4lvSqtXabcc7lbF/Cmv04qWKHGOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OXTvFuYk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f6342c5fa8so36927075ad.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2024 17:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717547105; x=1718151905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlZTq3P9ASgfMnpyKeb65Qgki+yiSpyIBUooUCR0W14=;
        b=OXTvFuYkuaEqXzsocKQVdjrwFloFQiCrfZ/paAVhYM7ixn9bGsUvnYE7EKjpJkLgzp
         qM9LG6gYmuXxTMxc2lBAN3Rc8qriRjiadMuAdXPj307/Ut8y6+tu7dzfcdmWDgFi+uqE
         myuhl+7cDEeB2psVgLml8+AvBWXHIdUPJ3NxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717547105; x=1718151905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlZTq3P9ASgfMnpyKeb65Qgki+yiSpyIBUooUCR0W14=;
        b=lYJf+KCi/ZZoFW2KU1QdClvrSvqttYCkJHcPDZoW7FeVPH5cVg+BQidn1i9RW2Khpa
         B7YB1fS11X1Lt8HUM4GpngD7l1ICKKB/vszU85TlZCKfL5SqPYIXqxnYSXeGp638JgTU
         Kf651SNCPLtbZG37kZbeMo+8XYFejBSkHjypKk+hcRVYeRKxc3mXNTQC7IEzROz1fFgA
         bg3iaAMJafudacdPmQ9qSo2g2rJGl3y+MrqtzJXeV47qw/Hngq1paycjuTmPzFpNzLNC
         3exW5HYrDO7gQzOnrW4CRIXvQwUbPNsmZ52M63P9TODatrVMtZDOzd1EaRXgzZSYR+BA
         5TlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP+NmT8kXz5jvOnF7WhXl76dTBc4XyNudbcSOGSanLsc2VEj0wNE07VPpn/839ynP79XUjXpF+HYo9alXsn/OouWBRfnZO83EH
X-Gm-Message-State: AOJu0YxRCxRVCXr0WzmdccTU/Bs38+7+Oi/qxLggK262HxibegENI6HA
	hZQRtI1CPgJ0milLCD+j+kW1rnjwGpychYQCJxh5elTqvayt/SCw2cXYzZiqtA==
X-Google-Smtp-Source: AGHT+IHCl9HTHlC9W7JWoyZsGp761gmkTX3Uui28lis3mNrYBsiyHkfuCERpgY42hnsZKMYFoOJAWQ==
X-Received: by 2002:a17:902:ecc3:b0:1f4:8e97:de25 with SMTP id d9443c01a7336-1f6a5a6aba7mr12326755ad.44.1717547104998;
        Tue, 04 Jun 2024 17:25:04 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:3609:ff79:4625:8a71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 17:25:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yuran Pereira <yuran.pereira@hotmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/24] drm/panel: Update TODO list item for cleaning up prepared/enabled tracking
Date: Tue,  4 Jun 2024 17:23:09 -0700
Message-ID: <20240604172305.v3.23.I104cdece7324b0c365e552a17f9883414ffaea01@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that most panels have been updated not to track/double-check their
prepared/enabled state update the TODO with next steps.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 Documentation/gpu/todo.rst | 47 +++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 2734b8a34541..2ea6ffc9b22b 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -469,30 +469,35 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
 Level: Starter
 
-Clean up checks for already prepared/enabled in panels
-------------------------------------------------------
-
-In a whole pile of panel drivers, we have code to make the
-prepare/unprepare/enable/disable callbacks behave as no-ops if they've already
-been called. To get some idea of the duplicated code, try::
-
-  git grep 'if.*>prepared' -- drivers/gpu/drm/panel
-  git grep 'if.*>enabled' -- drivers/gpu/drm/panel
-
-In the patch ("drm/panel: Check for already prepared/enabled in drm_panel")
-we've moved this check to the core. Now we can most definitely remove the
-check from the individual panels and save a pile of code.
-
-In adition to removing the check from the individual panels, it is believed
-that even the core shouldn't need this check and that should be considered
-an error if other code ever relies on this check. The check in the core
-currently prints a warning whenever something is relying on this check with
-dev_warn(). After a little while, we likely want to promote this to a
-WARN(1) to help encourage folks not to rely on this behavior.
+Remove disable/unprepare in remove/shutdown in panel-simple and panel-edp
+-------------------------------------------------------------------------
+
+As of commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled in
+drm_panel"), we have a check in the drm_panel core to make sure nobody
+double-calls prepare/enable/disable/unprepare. Eventually that should probably
+be turned into a WARN_ON() or somehow made louder, but right now we actually
+expect it to trigger and so we don't want it to be too loud.
+
+Specifically, that warning will trigger for panel-edp and panel-simple at
+shutdown time because those panels hardcode a call to drm_panel_disable()
+and drm_panel_unprepare() at shutdown and remove time that they call regardless
+of panel state. On systems with a properly coded DRM modeset driver that
+calls drm_atomic_helper_shutdown() this is pretty much guaranteed to cause
+the warning to fire.
+
+Unfortunately we can't safely remove the calls in panel-edp and panel-simple
+until we're sure that all DRM modeset drivers that are used with those panels
+properly call drm_atomic_helper_shutdown(). This TODO item is to validate
+that all DRM modeset drivers used with panel-edp and panel-simple properly
+call drm_atomic_helper_shutdown() and then remove the calls to
+disable/unprepare from those panels. Alternatively, this TODO item could be
+removed by convincing stakeholders that those calls are fine and downgrading
+the error message in drm_panel_disable() / drm_panel_unprepare() to a
+debug-level message.
 
 Contact: Douglas Anderson <dianders@chromium.org>
 
-Level: Starter/Intermediate
+Level: Intermediate
 
 Transition away from using mipi_dsi_*_write_seq()
 -------------------------------------------------
-- 
2.45.1.288.g0e0cd299f1-goog


