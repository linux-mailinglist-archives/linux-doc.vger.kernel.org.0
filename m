Return-Path: <linux-doc+bounces-252-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0901E7C9083
	for <lists+linux-doc@lfdr.de>; Sat, 14 Oct 2023 00:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFB79282FC9
	for <lists+linux-doc@lfdr.de>; Fri, 13 Oct 2023 22:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE2A2C850;
	Fri, 13 Oct 2023 22:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Szk1MqHw"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FBE2C848
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 22:48:39 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5FEB7;
	Fri, 13 Oct 2023 15:48:38 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-352a22e1471so10472845ab.0;
        Fri, 13 Oct 2023 15:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697237318; x=1697842118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
        b=Szk1MqHwB6IvfWGECTmStfmQp20yByi8liZ4kZPrBBYtdB0vOhbo1PfmvIUOnsKXyJ
         pf7eSQCN/6YAznJ0lOxhFInpJWygcXUm9aQXOBMokMQ2egh/xuMTmUB8bqECISpWoXOB
         L40TwiWqcXLh+u8o6HXHmfKOCMGZ+Jznorxjc+qJ0VInfKrg5z1tb9YiJtDiYiJ1yEWK
         AMKJr1Kl7lqoehkr1ouNiqfRGof9D0p6bMuf8WuN9D11XfpweFQP0+Yq8rnrsHjNcwvp
         +fYnVsbM0XGWf+Hor5d9D31ON/leVKtk6TTdzQ5T1KJZDm6cGiQL3iBQhbaFu9AC0F+S
         ImsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697237318; x=1697842118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEjUcd2gIGh+rcuXSmEeq7H3LSdL8L2dg7mL1DHpCLA=;
        b=tzFGKGAXv0WwDmGd2W28h1HDEH3l0XLf32dBLzDz+62QDw9PLcQMa4AnItFqODeJdB
         tHrbSPHCsIDTyRxieUbOYIfykpqWuzC0IH80SePrDzGYje4niPGjLXwdSxYNLUic0Fzi
         MPzn9N4BBj28iRzOvaS35gPOoc2MU+htyEoJC7/vE2VD5VwamKLtAbthpHjR0SAfpf+T
         jSgPtsZsTMefo21lpHT2H2qRwHz6Vk+815T4vrULkU0jqhiAyIDTMg5tRFTIwi5J0UhD
         Ds3V4GbsuW9tCTmV3hXH9PvSCRdtzbTvPphVUZ0VvKTnN0y0vSEGBLlqeFOdlRALYJtU
         pYXw==
X-Gm-Message-State: AOJu0YyuHRgnpb/jufxCMx2vc4DSRzr5hQlkrWbpFP6LZ/Fzw/bh4XtU
	0m5/d/vIkPL2YCrVchxyHat/NdtHP+bMEA==
X-Google-Smtp-Source: AGHT+IHo7yrBXRamtlyqRFU7QLO+/vsLx8/xPVHCeJyGOb8qAVk77cmrpeWyWFO6E5JV0+KuMjiYZA==
X-Received: by 2002:a05:6e02:20e6:b0:350:b7a9:514b with SMTP id q6-20020a056e0220e600b00350b7a9514bmr35371309ilv.8.1697237317961;
        Fri, 13 Oct 2023 15:48:37 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 15:48:37 -0700 (PDT)
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
Subject: [PATCH v7b 07/25] dyndbg: drop NUM_TYPE_ARRAY
Date: Fri, 13 Oct 2023 16:47:59 -0600
Message-ID: <20231013224818.3456409-8-jim.cromie@gmail.com>
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


