Return-Path: <linux-doc+bounces-520-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532C47CE394
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 19:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7E48B211F9
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 17:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33AB3D396;
	Wed, 18 Oct 2023 17:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpDuyZeU"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51DD3D39C
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:06:31 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D64519F;
	Wed, 18 Oct 2023 10:06:29 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-79f9acc857cso255513639f.2;
        Wed, 18 Oct 2023 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697648788; x=1698253588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhGNt9jDF2novTMxsYI339VgloJh+A+1hp+EfHNU0QQ=;
        b=VpDuyZeUQrCAsGfmjhs2baikhbv5OK1YZNGZHZW1vd8W+z77sw+sk9SD0JlcaMeGda
         +6b9wb8FfhK3dg2ryV/lA5nyYTusFDYovICIGG1a6iHHYle/p3zP89ecJhPGloQMBppq
         iah3rum3S8t338efMMuj0/yE8h+IkOfBR8OuuKuq55R3jH4sKfdYGL3Prk01Vzwuowcn
         a8k7BaxFtN13lCyBwcR636uCpSnzOk3xyR7uEqIggrcPrxr8NsaYvvPeq6K9azvfL5o9
         HCQwvzKuoZDh0z5AlO5CpI66JYDGA9+e/nK2zoqG+jT2TeZqtympOqvH1gYx/T2jyfLN
         mX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697648788; x=1698253588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhGNt9jDF2novTMxsYI339VgloJh+A+1hp+EfHNU0QQ=;
        b=uDxqIjuW9p+S63RHl9K0rlOjAVpP+8bQcoetyGquh8KDN1XcXb8zcIsI7Vwpto3oUY
         1j1APW5qXs97xp4yWfijjQ913R3Nodl4KyeL03dNOTZbZZ32+ftgfzhJ+V24zOhSlsS9
         +vYHmJmVwqADqFbdQvl3wWRp/r5EvaKgOw1rAcGKb7FcbxbpL02g/7ucWUp+o17kqj66
         Exac5kerx81Q4n2eqmx41JczFT64bvPMNfWfolgA7geYvbpQBmMPhvODCfrm+YWq12lk
         nRaDbxwpThosMTqeBnUI06kWyMLL0uhI/hkD+5JWYVT+zx7jWv8f6x8WlrEC5g3u57qG
         UUoA==
X-Gm-Message-State: AOJu0Yyz6aQJo7axWn/gTaILHz29lqx90fDfMSTjb9O9Djc3AbCkxdy6
	3xUo2pzRolk/h8rk+tOW/8whh503Nv6Xaw==
X-Google-Smtp-Source: AGHT+IEe23ksjOtW/hRiyd89AhJwATbXsUncr2eDH6q2bzfzl7/IMxOi7NXlUHBa8NjCSVKnI86JZQ==
X-Received: by 2002:a05:6602:1508:b0:792:792e:6619 with SMTP id g8-20020a056602150800b00792792e6619mr7775630iow.2.1697648787949;
        Wed, 18 Oct 2023 10:06:27 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 10:06:27 -0700 (PDT)
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
Subject: [PATCH v7c 15/24] dyndbg: refactor ddebug_classparam_clamp_input
Date: Wed, 18 Oct 2023 11:05:55 -0600
Message-ID: <20231018170604.569042-16-jim.cromie@gmail.com>
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
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Extract input validation code, from param_set_dyndbg_module_classes()
(the sys-node >handler) to new: ddebug_classparam_clamp_input(kp),
call it from former.  It takes kernel-param arg, so it can complain
about "foo: bad input".

Reuse ddparam_clamp_input(kp) in ddebug_sync_classbits(),
to validate inputs from parent's params, just like our own.
To support that reuse, alter ddebug_sync_classbits() and caller to
pass kp instead of kp->arg.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 70 ++++++++++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 23 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c9517d403e06..a6ee142668bf 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -653,6 +653,30 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 
 #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
 
+static void ddebug_class_param_clamp_input(unsigned long *inrep, const struct kernel_param *kp)
+{
+	const struct ddebug_class_param *dcp = kp->arg;
+	const struct ddebug_class_map *map = dcp->map;
+
+	switch (map->map_type) {
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+		/* expect bits. mask and warn if too many */
+		if (*inrep & ~CLASSMAP_BITMASK(map->length)) {
+			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
+				KP_NAME(kp), *inrep, CLASSMAP_BITMASK(map->length));
+			*inrep &= CLASSMAP_BITMASK(map->length);
+		}
+		break;
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		/* input is bitpos, of highest verbosity to be enabled */
+		if (*inrep > map->length) {
+			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
+				KP_NAME(kp), *inrep, map->length);
+			*inrep = map->length;
+		}
+		break;
+	}
+}
 static int param_set_dyndbg_module_classes(const char *instr,
 					   const struct kernel_param *kp,
 					   const char *modnm)
@@ -671,26 +695,15 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		pr_err("expecting numeric input, not: %s > %s\n", instr, KP_NAME(kp));
 		return -EINVAL;
 	}
+	ddebug_class_param_clamp_input(&inrep, kp);
 
 	switch (map->map_type) {
 	case DD_CLASS_TYPE_DISJOINT_BITS:
-		/* expect bits. mask and warn if too many */
-		if (inrep & ~CLASSMAP_BITMASK(map->length)) {
-			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
-				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
-			inrep &= CLASSMAP_BITMASK(map->length);
-		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP_NAME(kp));
 		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, modnm);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		/* input is bitpos, of highest verbosity to be enabled */
-		if (inrep > map->length) {
-			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
-				KP_NAME(kp), inrep, map->length);
-			inrep = map->length;
-		}
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
@@ -1157,16 +1170,27 @@ static const char * const ddebug_classmap_typenames[] = {
 		  ddebug_classmap_typenames[_cm->map_type]);		\
 	})
 
-static void ddebug_sync_classbits(const struct ddebug_class_param *dcp, const char *modname)
+static void ddebug_sync_classbits(const struct kernel_param *kp, const char *modname)
 {
-	/* clamp initial bitvec, mask off hi-bits */
-	if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
-		*dcp->bits &= CLASSMAP_BITMASK(dcp->map->length);
-		v2pr_info("preset classbits: %lx\n", *dcp->bits);
+	struct ddebug_class_param *dcp = kp->arg;
+	unsigned long new_bits;
+
+	ddebug_class_param_clamp_input(dcp->bits, kp);
+
+	switch (dcp->map->map_type) {
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+		v2pr_info("  %s: classbits: 0x%lx\n", KP_NAME(kp), *dcp->bits);
+		ddebug_apply_class_bitmap(dcp, dcp->bits, 0UL, modname);
+		break;
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		new_bits = CLASSMAP_BITMASK(*dcp->lvl);
+		v2pr_info("  %s: lvl:%ld bits:0x%lx\n", KP_NAME(kp), *dcp->lvl, new_bits);
+		ddebug_apply_class_bitmap(dcp, &new_bits, 0UL, modname);
+		break;
+	default:
+		pr_err("bad map type %d\n", dcp->map->map_type);
+		return;
 	}
-	/* force class'd prdbgs (in USEr module) to match (DEFINEr module) class-param */
-	ddebug_apply_class_bitmap(dcp, dcp->bits, ~0, modname);
-	ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);
 }
 
 static void ddebug_match_apply_kparam(const struct kernel_param *kp,
@@ -1181,9 +1205,9 @@ static void ddebug_match_apply_kparam(const struct kernel_param *kp,
 	dcp = (struct ddebug_class_param *)kp->arg;
 
 	if (map == dcp->map) {
-		v2pr_info("found kp:%s =0x%lx", kp->name, *dcp->bits);
-		vpr_cm_info(map, "mapped to:");
-		ddebug_sync_classbits(dcp, modnm);
+		v2pr_info(" found kp:%s =0x%lx", kp->name, *dcp->bits);
+		vpr_cm_info(map, "  mapped to:");
+		ddebug_sync_classbits(kp, modnm);
 	}
 }
 
-- 
2.41.0


