Return-Path: <linux-doc+bounces-269-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 422207C90E6
	for <lists+linux-doc@lfdr.de>; Sat, 14 Oct 2023 00:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 737D11C210F9
	for <lists+linux-doc@lfdr.de>; Fri, 13 Oct 2023 22:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D5B2C841;
	Fri, 13 Oct 2023 22:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmQvJdKG"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CBF2C84C
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 22:49:35 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0E0170B;
	Fri, 13 Oct 2023 15:49:02 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-35748b32d73so10075775ab.0;
        Fri, 13 Oct 2023 15:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697237340; x=1697842140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SAgGhvFgEq3ojom6jJPWJ2MyF/faZd9tWGs5HOFcQQ=;
        b=AmQvJdKGuNXclTjSWNnKynmRvhIblouvkvgHJgo3yMLYTIxIIOFLS9PyO8I0YuPgMY
         C96DaIlk497q6l5Gpcb6LFBVhlKIb3TYzGfCiHrKOkaRLiTyFDurttMQFsCAyv3DgB42
         j35TEWNUryFb/dKpWjomyH65ak/xPQoC/HusrzqtGnHSQxXDkR7Smc6+jFRGpJbgP25u
         s1lfwaIcluE9lbuhMGecwht+Y7OojL6j62tUxPq4UCgV2ckrLvB43zIxaf3DJh3vFgkU
         z6N/uVdI2veYc5KLQyeULUyK3tej7OnBk8Pt7yFA/kZr6TJdv/g0m7+nZ7C55unZV0tX
         Cltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697237340; x=1697842140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SAgGhvFgEq3ojom6jJPWJ2MyF/faZd9tWGs5HOFcQQ=;
        b=lcp3kLpBm+9sBivuu8l3zHld83FwyNJr60IuD/PKE0Iz+KSPAcHxZD5OMCo8GqWJWG
         2utkQstZ2dOJGaoO1ohgJcMDUoIwKBUl7tyVI5YGZgJJtAAPxpkKhFf90Xlsslguieer
         1BD/ZRCGF0W+53U5dBexiUtq568YY3LRGBdMcd/NiQsznz7+zqz9D8T5+Q+TElSfqyK2
         LeWS8Moh9XTZb4LNgwdW9HFmZBxnlBBXF41YxUx7kTNT7WzwoeMlW6ekX2YKjax8SaXu
         pcdqK2zKd3iyykk3Qkchx5XJGClfMJBykMAxZIKkmlbDiOOEDRodNLHR37UAA3mTQb1T
         kAMQ==
X-Gm-Message-State: AOJu0YxP7Sn/5BHcqkQNC409NDITJPcGtd/CMdrwBRWSbMNARLZ0UD7e
	th3uOF6a1z6T10STpR+8cLUs6dzhkn8W1A==
X-Google-Smtp-Source: AGHT+IGabCzGZckH890sOFHM0bOgw3lVPHOXqyusXaXzxwFPYH0hLfKtQHAFmLNjwmQTHTLQKcZ52Q==
X-Received: by 2002:a05:6e02:164f:b0:351:57d5:51bb with SMTP id v15-20020a056e02164f00b0035157d551bbmr39248796ilu.16.1697237340380;
        Fri, 13 Oct 2023 15:49:00 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 15:48:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: lb@semihalf.com,
	linux@rasmusvillemoes.dk,
	joe@perches.com,
	mcgrof@kernel.org,
	daniel.vetter@ffwll.ch,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	linux-doc@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7b 25/25] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Fri, 13 Oct 2023 16:48:17 -0600
Message-ID: <20231013224818.3456409-26-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Lots of burn-in testing needed before signing, upstreaming.

NOTE: I set default Y to maximize testing by default.
Is there a better way to do this ?

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3caa020391c7..708f5e8cb205 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -55,8 +55,7 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
+	default y
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.41.0


