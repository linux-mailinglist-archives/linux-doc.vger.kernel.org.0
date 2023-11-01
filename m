Return-Path: <linux-doc+bounces-1547-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0FB7DD9AA
	for <lists+linux-doc@lfdr.de>; Wed,  1 Nov 2023 01:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB46E1C20C05
	for <lists+linux-doc@lfdr.de>; Wed,  1 Nov 2023 00:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8D5A2A;
	Wed,  1 Nov 2023 00:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhVOvMPU"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87777F
	for <linux-doc@vger.kernel.org>; Wed,  1 Nov 2023 00:26:28 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1868F9;
	Tue, 31 Oct 2023 17:26:27 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-358074036f8so23357045ab.2;
        Tue, 31 Oct 2023 17:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698798386; x=1699403186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
        b=jhVOvMPUC985tv5EGDVKBxNngM5juB1+HdirJsRWFk24IFsoLoTWXWmX4PpENJPbGZ
         LaDQfqIGwGONdVC5B8Vr0pOZPFqGwohcSvdYL+B84IFmnw4eIWhhNun9pqjKxj2twFJV
         XehhITWGFKCYQujZbagdoaklz5bX9tFaEo+Ystb3cFf6UpBUgabD95l8Vs2S5AxG9eFz
         8cN0APQX0mfjqdOT9nUb2HAYLMDhif7iO1ZOk4A4nhTNKDBqgJYvvco3+1s8G1FzuEUd
         Dma3JOn7/heNl6cx/xxaJ/NIKU5uFlPNQS/WkFKxyF/van+mI8yAPGtaDqLoBAN+gZXC
         w9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698798386; x=1699403186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
        b=AOsDDfqHAgirKv2YFk/9MbrdizU9tLKzIA2G2qibxUFXgn8Q8zRGh+5/saQDvS5hGL
         zwqkcLSDsZCbbWG3RevboHCyPIYBom83kQHkt/EJbb0p2I7M10rBxgGUvsVdtT1MYyhf
         aQphFDy9Y24Lpn8gjGwlJHNTiWEe5Lz8LDYxT381ipShGhtxcm9dBg5muhF/sk0rK68L
         iD71B8Xuyq2AiXKe0QG0wOkUx3gYbGxTMaDMX+rHWMAxZJCUJA1B84W0CAg0pNoYOp6y
         FCd6MOKrrrzjlAdDl1IsTxLwD3SXKISmEvpaQu2AcrSJGYBerUVyIXGpQb38oaPA84BD
         TI0Q==
X-Gm-Message-State: AOJu0YzqNy/K6HG9j/NsnSxKHF768jraMHomernGHD0rqjmB1ehiVsBi
	s6mqi4mbr/3Nl6OMuezEJcV9DVWOL+f76A==
X-Google-Smtp-Source: AGHT+IGW/P6Lyy1k1xploc5OiJyydd9ZuaB2/mgYqrBD+pI+YXg4B1s3psMImKHRBlH7Jvw3Omhuow==
X-Received: by 2002:a05:6e02:3888:b0:359:4199:1fe2 with SMTP id cn8-20020a056e02388800b0035941991fe2mr965074ilb.8.1698798386644;
        Tue, 31 Oct 2023 17:26:26 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 17:26:26 -0700 (PDT)
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
Subject: [PATCH v7d 07/23] dyndbg: drop NUM_TYPE_ARRAY
Date: Tue, 31 Oct 2023 18:25:53 -0600
Message-ID: <20231101002609.3533731-8-jim.cromie@gmail.com>
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

ARRAY_SIZE works here, since array decl is complete.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b53217e4b711..8116d0a0d33a 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -106,11 +106,9 @@ struct ddebug_class_map {
 		.mod_name = KBUILD_MODNAME,				\
 		.base = _base,						\
 		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.length = ARRAY_SIZE(_var##_classnames),		\
 		.class_names = _var##_classnames,			\
 	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
 
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
-- 
2.41.0


