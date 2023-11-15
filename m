Return-Path: <linux-doc+bounces-1543-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0AD7DD9A9
	for <lists+linux-doc@lfdr.de>; Wed,  1 Nov 2023 01:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07702B20FC9
	for <lists+linux-doc@lfdr.de>; Wed,  1 Nov 2023 00:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63E064B;
	Wed,  1 Nov 2023 00:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZCvNCar"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569837F
	for <linux-doc@vger.kernel.org>; Wed,  1 Nov 2023 00:26:23 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486DAB7;
	Tue, 31 Oct 2023 17:26:22 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3574297c79eso22148425ab.1;
        Tue, 31 Oct 2023 17:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698798381; x=1699403181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C+2NMg1JH09l8lpRwB0Ubzh+mfktnl5vVkwETAlRt8=;
        b=JZCvNCar4aKLVwdFmc3uJRpgbU26yhXNa5scPdkl5mK+qlvY8YqSpknAjZ6YGxdM60
         Uf6gsuJ8D9VpXsTZpLScMFkeU+siCdIKEImNeEhY+jPMNFRGcER5Gn3/E43D2al9HV9i
         J4JDTHmCZxJJmwknwy5oGubhUC3UyeykzfvyGLqO+u/nRmx8+UfPsmlLEwE5KRNa4HpV
         +6mKM2KoCcmjSldo8AXv+E7+NrPXIGu2zfj8LgHzZ8fLYFC0S/RcvCqtXw+zEL/G7fNG
         5TJ7anxShGuvh/rGn5/QcG3RJT/2WjlRTnsI0I6uyAVIovSkMSSqUM74PW5H9kALDNOz
         rGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698798381; x=1699403181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C+2NMg1JH09l8lpRwB0Ubzh+mfktnl5vVkwETAlRt8=;
        b=A0hOfdYUJbkKM5T8TVnd91dry09mypu/V7VLB7HOMh5aqxzS1U/1YrCSy75NVvpO8x
         sCLDEreeRWEdIuxLSXHyu0nTtm1GozNojPymklYBf689uUIhEcy4eYFvWs1ED4GxArO6
         oxSSZgqeOggtlXpTnhcMaiaMrtorYo6Q3LuPo6qiNd/L3kZQciVcyPGhANSoCDfpa8p/
         SLI7bKxesd1MwvUHkE7kXZ8mveoNjJ1KQ8mp7Ont5dvsxNkCJuNyZ4z4sCIK+1zX7rGq
         4IMFP7vt+qsaj/AyAP64xG0Z4G7mrkva7mkcNGV7SovOY8YZyJwYFH/Yy53QXWOo6QM0
         nGhA==
X-Gm-Message-State: AOJu0YzZVu8eoneKcgrzB9s24gifeMSLoU2VCRT8aRdeI/xa5ox0ZFWa
	EWzwhPVyd04nj7CLFaGj7c+Qr/z8iot32g==
X-Google-Smtp-Source: AGHT+IHkBAKd0v4sabAiwOZ6Frg7FF4WYiVc4qinzWmOuYCNDVvs+YpA63Dkxm+3LAL7oJXh0CcdwQ==
X-Received: by 2002:a92:c244:0:b0:357:f730:cc4c with SMTP id k4-20020a92c244000000b00357f730cc4cmr17966574ilo.6.1698798381342;
        Tue, 31 Oct 2023 17:26:21 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 17:26:21 -0700 (PDT)
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
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v7d 03/23] dyndbg: make ddebug_class_param union members same size
Date: Tue, 31 Oct 2023 18:25:49 -0600
Message-ID: <20231101002609.3533731-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101002609.3533731-1-jim.cromie@gmail.com>
References: <20231101002609.3533731-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct ddebug_class_param keeps a ref to the state-storage of the
param, make both flavors use the same unsigned long under-type.
ISTM this is simpler and safer.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4fcbf4d4fd0a..5231aaf361c4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -124,7 +124,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index ceb3067a5c83..b984ce338921 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -796,7 +796,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.41.0


