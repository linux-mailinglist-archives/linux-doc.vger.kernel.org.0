Return-Path: <linux-doc+bounces-178-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD007C7457
	for <lists+linux-doc@lfdr.de>; Thu, 12 Oct 2023 19:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55C8A282DBA
	for <lists+linux-doc@lfdr.de>; Thu, 12 Oct 2023 17:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE58D36B05;
	Thu, 12 Oct 2023 17:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3FEL1PX"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDD43418F
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 17:22:23 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FFCD66;
	Thu, 12 Oct 2023 10:22:13 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7a27254cd12so47340739f.3;
        Thu, 12 Oct 2023 10:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697131332; x=1697736132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LQP5MFDhA+xfUDGLuGe24GCmwsysAw7CRqOtSg8az8=;
        b=E3FEL1PXdfBpRTWJs8NbCKLhAGkfIawT1GabFI/gNWhPM7XXDuLtGfnMWFYQI5A1nE
         ApUkVaHk3VO6nnpfEHyuBGt+hqqloyIoiS9lK/d6kKDPI1p2ED8HrFLTX5sUYw4z07ck
         0IsVwFoIdg661sVAx3JiuGG7b5kxf/JXSz2F5J5hu9kin8tuAvuvdwrU9yzVaY6Yh9ec
         IoOBBqsPTI7kyQBWXXoPNWm/as+LIUFJB7W4ku8rlYJ1bTnLMiIbPQw7EnxS+d+S29sy
         LyvNxm9Tyf8+VnJC2kBCe04xp9dhqm61+/c6mVlBCumyO+VGbvZ1JTTC3TMGyM9BwuY1
         AUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697131332; x=1697736132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LQP5MFDhA+xfUDGLuGe24GCmwsysAw7CRqOtSg8az8=;
        b=Tz3zNuaUYe+3i6lz/BqpxuP7Lbb3eRtnwwQEDIH+mcUeEA8jbTTejArqOVQq2KgYzm
         nyYZ2cfV48LcDcIhucMp9Sc4kAR1A0JuwmmfipUPpy3cGpaWHDhoJcwQZlIWm/iVk/jE
         yUXWV+HKKtnZHR2Bhf6WMuNqQZR3rFXwBVU948LP5WSqlZbQTZ9FSF8pN+IYSEbmbNu+
         y/Je736zv0jvGWV2sKCPL9A7Tjfr9+wKDwFALFMxfYd8aIoVBnlWIDL6xlW+b/mnH/sp
         lZtH+jSLAMUNJ0+rWyK7SYCd0jIgNB8XAdpvPnxjgbM2+MmejIAKx+LBRyIr/2Lt5OyQ
         nGLw==
X-Gm-Message-State: AOJu0YxesLPN3+npATCdwRBx4zvRoz6qMy9xhRTRGTJ16YhJjr/hN5o3
	gqn68gUPWt1tFH58Irke+G5hugA96zO4uA==
X-Google-Smtp-Source: AGHT+IHzdz6j/vLvb13hWGyitF0NYfQ+58DfX66YHxmuF+rTNL+ptBqWkmhR8dXqdb+0bFLGeWyapA==
X-Received: by 2002:a5e:aa0c:0:b0:794:e96f:b87d with SMTP id s12-20020a5eaa0c000000b00794e96fb87dmr27630637ioe.0.1697131332304;
        Thu, 12 Oct 2023 10:22:12 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 10:22:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: daniel.vetter@ffwll.ch,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	linux-doc@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7 23/25] drm: use correct ccflags-y spelling
Date: Thu, 12 Oct 2023 11:21:34 -0600
Message-ID: <20231012172137.3286566-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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


