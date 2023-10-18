Return-Path: <linux-doc+bounces-527-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A6B7CE39E
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 19:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 356911C20FA4
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 17:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2023D3AC;
	Wed, 18 Oct 2023 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0ILzNL0"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4448A3D38B
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:06:38 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E08D4C;
	Wed, 18 Oct 2023 10:06:36 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7a2cc9ee64cso270762339f.1;
        Wed, 18 Oct 2023 10:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697648796; x=1698253596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LQP5MFDhA+xfUDGLuGe24GCmwsysAw7CRqOtSg8az8=;
        b=k0ILzNL0PQ2nV3ISOczDk4y3MQIitSlNWKZOlAXaPId7+x9xC396igl39pjDkl11eL
         yPErIAJdNHwWiIlup63/cYNvm0bXXow+koa2PbIjEu+6SnbCMvky/ClF9s1CfF4UGu3J
         wR4+AQ9PyYJfSyT0Y4G1CLCEsDPoUNHCDAcMn/68KqVMSdgy5b7ZgYYCXo+jKMXbHk/g
         +PQSBeGHohyoll6juK7aZjamhpHitwmJQOo1Gri2NFDQxOED9/RHzibqsWKdhZcRrZDy
         Pt3iPRSMBIWRH2I3IqWNYjP1+VpuNSgSCU4lBIVMjcYhnP36rn4uTOt8a+rgGL14Rb34
         59+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697648796; x=1698253596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LQP5MFDhA+xfUDGLuGe24GCmwsysAw7CRqOtSg8az8=;
        b=ePfVQnJLfXy8qH7tmy1i/uU1h4WlPoIQHZZIdw+CUwTSqRMlgFAVZ3xOkoj5AUAFog
         cWoeCM2XDEPJAFwa1waqAinuxdCAqGV/DkO1kiKOepRsJ48rThQQqC3/aaVV8Ku0v1x7
         B5FDefFR5SM5pTpVOPHdYO/8Ka8TxQew1Ic2VOyMwuWBMc5Ns03jV0qI1HuSWA1f0dSf
         2ztliQ7rBAzh8IHdUo2Y0y5NRJzBOFDMXQFQXQpt/xqKJCZxNhf7jowuuzpJfd1FILXA
         AJ3i/KcgE3ccKa7nieQsyg9v1l1aNnOP34conYNbRExTij4cvBKodF3zHsc1LIj/YE1Y
         72gQ==
X-Gm-Message-State: AOJu0YzJV8p2H9GXIvyW1BJbqCoLBI7M1nOUKTMEKzJ/3lh9kSNniLYv
	AMDdTXjnce9NT+TWoZrB9vDl60mObf2KxQ==
X-Google-Smtp-Source: AGHT+IEc4mOF8fsJ6PP9Q0I6owI0pWzjQPyiy/8zqDoyKE5tRBFWh3/xkkNAKOARyTu4me/pvUabfg==
X-Received: by 2002:a05:6602:2e0f:b0:792:70c2:9db1 with SMTP id o15-20020a0566022e0f00b0079270c29db1mr5926401iow.1.1697648795893;
        Wed, 18 Oct 2023 10:06:35 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 10:06:35 -0700 (PDT)
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
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7c 22/24] drm: use correct ccflags-y spelling
Date: Wed, 18 Oct 2023 11:06:02 -0600
Message-ID: <20231018170604.569042-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018170604.569042-1-jim.cromie@gmail.com>
References: <20231018170604.569042-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which broke builds with:

CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_DYNAMIC_DEBUG=n

Also add subdir-ccflags so that all drivers pick up the addition.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 215e78e79125..22b1984cc982 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 drm-y := \
 	drm_aperture.o \
-- 
2.41.0


