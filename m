Return-Path: <linux-doc+bounces-60017-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2978B53DEB
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 23:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0439B5C17D7
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 21:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EDF342CA3;
	Thu, 11 Sep 2025 21:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIGeLNh0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73FF31D364
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 21:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757626757; cv=none; b=NIru4HlLaNsLVJ12rreTDbvE0wCXwKGQi3n+h1HqDA5C/Ar+3mP75lptqZAUVlWwij7hvOllTYn2GXFtjBb5A8GveE10lW1yM8LoosV/QsxihMUWt1xOESU5yPM6fXqwoCDW+v9YykB3ds/3iK4YQydTZ0DHpsPyJLVHLItA4Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757626757; c=relaxed/simple;
	bh=S+68avOFBqf5C4De21lDrUWxtxOfEE7gYDlFBK10YCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CO+gTyljYyh52EaoLE0K9sbbW6eDtfS30wYiXY8/au0KsoZXWV9RfGJjkIH9/YuAD37s4hbWnNg1Yq48pZIGRAeOjHGrCX4BK12J+XR8XSx7shU3lXEXtYlePNSNq9Zw6S3fTqzTGgX2tRRlx0HtO3XT2NMVok30UzXMTKaKXpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIGeLNh0; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-88432e60eebso33439939f.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 14:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757626752; x=1758231552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdcOGQQjGLjfYBL4dlDZ/eh+HVP7cV2y3UoDXTNblhU=;
        b=QIGeLNh0cGazRMU/fmEBSn/kx4WHYr7g4hexYgC2XVofD6Vm/p64Hng3GgHCUWSQLk
         6xw5n557uDt0mMusjhnzVVKTGfk/lo/myXnvo16XA2upliuYGkIUCw7SFVnLjaKIgit1
         vDtHAJCka4QZKbc0QsYhcLaXXE8dsdh693XUyKSVoPOz4640S1D+RT84WbrF0YpGHNEY
         F1NLoR4xdIJh7G29S8gB7w+clHW6TndXTKy/9bByp956EQwpkzbDmAPwBk7JPeC9Z+3d
         LWxYOMWoj/z2K5a4bTGcSyJ8qZOJqNG36mf4k0HSheXh6Qa8dLlse1W4PtuVizPqQr2j
         UkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757626752; x=1758231552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdcOGQQjGLjfYBL4dlDZ/eh+HVP7cV2y3UoDXTNblhU=;
        b=Fx5kYoMzkAoFqjSs7s9qETNVgL7huwnagWljFSr6bZQGjfz3rvCnvhjdfELQaq6Mth
         irA1ciHkAMjqABvHc4GcJRw44k54xOgnmyXMBUtBJnDBk93RvHNPjoW6HUfDQFC7z7wQ
         hCR8EmHs8t6tgev9/EFYokEF0hIgL18b+w/M4cCIZVB5J2gMImEJm39l0I80gYIGZ3RZ
         gGxZQnHdvWqgqeldste4MjuiJwJ8ikY76BBw9EaqOwXT5o3g2K2lsH+P3STWhWxmG7HZ
         HoKeHddPQZAP2R9V+jJWl7BsG711+g7IwYbIhGfW+2FosoT05Z7QpwTtSadj8ACDxiqw
         SKDg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ93r//lkzA/NK6v533FKi19Ctp4nzc713fl3BupMdIsOhNKduuRf1p+iMgFkd/4XEjF4o8W+wY2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe6jOp0hzOjsXwJ0ZO8XPX1q/YFzLArSUMt0jDOQkFmKAqwjuz
	m4sNB0kdZAZyzioH159FIX+VEik7JBeEM3DygwGcWjFUIN2qjeTB1oX1
X-Gm-Gg: ASbGncuQ9gKf9IJChncJ6sAJ6FaS9YRSAIhw06fSMq08NsXLcnTYo4HvkvpSQ2/zwr2
	PFOOr5cuW0PCyyNi5+Lpo7v9q/5HUkykwIVMMbJ8ixiqob+f2Dn1FBeV8hzTVjISye3ifX/NKor
	TL4mFLuJV8vl1JArZnYD6UmlRUxQ58a07la/sBh+R4JFsjRwkC4omRnIdJY/hBZiC2HTkbTH2mN
	Y5oGiIAWebhudk8UQEyeX9lHuOAVvtmRWEE5qkHDF18cdQFkb1h3x9OxnV7hhCVIdPwbHI7eMH/
	VHJQanhcjRI/R7rk6vSVZpKUEgOCam/WNe8hNaHAWVAmo4sWjfmv+IEW+P2LLxoEE8qz784K32L
	XCtoOqWWzjhF99XNRxs5ce3vMnq3JOwLtRFVA7d1tuUvaE1BYxSfImC72AiG0yTDafYfWZdsJPs
	9PHlU=
X-Google-Smtp-Source: AGHT+IE06gtrpYljJMiiR4CKSM4Ys3BekwEi5E5g3S1vGdVIcAKiYXH3OX1uGDSOiRPmwfUS3LsaDQ==
X-Received: by 2002:a05:6602:15c8:b0:887:596e:fadb with SMTP id ca18e2360f4ac-8903423ca80mr121691439f.13.1757626751577;
        Thu, 11 Sep 2025 14:39:11 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net (c-73-14-87-86.hsd1.co.comcast.net. [73.14.87.86])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-88f2d0bfdcfsm104024139f.3.2025.09.11.14.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 14:39:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 24/30] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
Date: Thu, 11 Sep 2025 15:38:17 -0600
Message-ID: <20250911213823.374806-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911213823.374806-1-jim.cromie@gmail.com>
References: <20250911213823.374806-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move the DYNAMIC_DEBUG_CLASSMAP_PARAM macro from test-dynamic-debug.c into
the header, and refine it, by distinguishing the 2 use cases:

1.DYNAMIC_DEBUG_CLASSMAP_PARAM_REF
    for DRM, to pass in extern __drm_debug by name.
    dyndbg keeps bits in it, so drm can still use it as before

2.DYNAMIC_DEBUG_CLASSMAP_PARAM
    new user (test_dynamic_debug) doesn't need to share state,
    decls a static long unsigned int to store the bitvec.

__DYNAMIC_DEBUG_CLASSMAP_PARAM
   bottom layer - allocate,init a ddebug-class-param, module-param-cb.

Modify ddebug_sync_classbits() argtype deref inside the fn, to give
access to all kp members.

Also add stub macros, clean up and improve comments in test-code, and
add MODULE_DESCRIPTIONs.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
-v10 add stub macros
-v9
 - fixup drm-print.h  add PARAM_REF forwarding macros
   with DYNAMIC_DEBUG_CLASSMAP_PARAM_REF in the API, add DRM_ variant
---
 include/linux/dynamic_debug.h   | 40 ++++++++++++++++++++++
 lib/dynamic_debug.c             | 60 ++++++++++++++++++++++-----------
 lib/test_dynamic_debug.c        | 47 ++++++++++----------------
 lib/test_dynamic_debug_submod.c |  9 ++++-
 4 files changed, 106 insertions(+), 50 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index b96f069290bd..4ceb69f0e493 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -251,6 +251,44 @@ struct _ddebug_class_param {
 		.base = _base						\
 	}
 
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_PARAM - control a ddebug-classmap from a sys-param
+ * @_name:  sysfs node name
+ * @_var:   name of the classmap var defining the controlled classes/bits
+ * @_flags: flags to be toggled, typically just 'p'
+ *
+ * Creates a sysfs-param to control the classes defined by the
+ * exported classmap, with bits 0..N-1 mapped to the classes named.
+ * This version keeps class-state in a private long int.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)		\
+	static unsigned long _name##_bvec;				\
+	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _name##_bvec, _var, _flags)
+
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_PARAM_REF - wrap a classmap with a controlling sys-param
+ * @_name:  sysfs node name
+ * @_bits:  name of the module's unsigned long bit-vector, ex: __drm_debug
+ * @_var:   name of the (exported) classmap var defining the classes/bits
+ * @_flags: flags to be toggled, typically just 'p'
+ *
+ * Creates a sysfs-param to control the classes defined by the
+ * exported clasmap, with bits 0..N-1 mapped to the classes named.
+ * This version keeps class-state in user @_bits.  This lets drm check
+ * __drm_debug elsewhere too.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)	\
+	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
+
+#define __DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)	\
+	static struct _ddebug_class_param _name##_##_flags = {		\
+		.bits = &(_bits),					\
+		.flags = #_flags,					\
+		.map = &(_var),						\
+	};								\
+	module_param_cb(_name, &param_ops_dyndbg_classes,		\
+			&_name##_##_flags, 0600)
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -423,6 +461,8 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)
 #define DYNAMIC_DEBUG_CLASSMAP_USE(_var)
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _var, _flags)
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
 #define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b6a5219d71af..440fe2f483a3 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -666,6 +666,30 @@ static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
 
 #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
 
+static void ddebug_class_param_clamp_input(unsigned long *inrep, const struct kernel_param *kp)
+{
+	const struct _ddebug_class_param *dcp = kp->arg;
+	const struct _ddebug_class_map *map = dcp->map;
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
 					   const char *mod_name)
@@ -684,26 +708,15 @@ static int param_set_dyndbg_module_classes(const char *instr,
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
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
 		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
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
@@ -1171,15 +1184,24 @@ static const struct proc_ops proc_fops = {
 static void ddebug_sync_classbits(const struct kernel_param *kp, const char *modname)
 {
 	const struct _ddebug_class_param *dcp = kp->arg;
+	unsigned long new_bits;
 
-	/* clamp initial bitvec, mask off hi-bits */
-	if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
-		*dcp->bits &= CLASSMAP_BITMASK(dcp->map->length);
-		v2pr_info("preset classbits: %lx\n", *dcp->bits);
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
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index fa81177e8089..83c4d571a8c9 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Kernel module for testing dynamic_debug
+ * Kernel module to test/demonstrate dynamic_debug features,
+ * particularly classmaps and their support for subsystems like DRM.
  *
  * Authors:
  *      Jim Cromie	<jim.cromie@gmail.com>
@@ -57,24 +58,6 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
 
 #define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << (base))
 
-/* sysfs param wrapper, proto-API */
-#define DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, _init)		\
-	static unsigned long bits_##_model = _init;			\
-	static struct _ddebug_class_param _flags##_##_model = {		\
-		.bits = &bits_##_model,					\
-		.flags = #_flags,					\
-		.map = &map_##_model,					\
-	};								\
-	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,	\
-			&_flags##_##_model, 0600)
-#ifdef DEBUG
-#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)		\
-	DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, ~0)
-#else
-#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)		\
-	DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, 0)
-#endif
-
 /*
  * Demonstrate/test DISJOINT & LEVEL typed classmaps with a sys-param.
  *
@@ -105,12 +88,15 @@ enum cat_disjoint_bits {
 /* numeric verbosity, V2 > V1 related.  V0 is > D2_DRMRES */
 enum cat_level_num { V0 = 16, V1, V2, V3, V4, V5, V6, V7 };
 
-/* recapitulate DRM's multi-classmap setup */
+/*
+ * use/demonstrate multi-module-group classmaps, as for DRM
+ */
 #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
 /*
- * In single user, or parent / coordinator (drm.ko) modules, define
- * classmaps on the client enums above, and then declares the PARAMS
- * ref'g the classmaps.  Each is exported.
+ * For module-groups of 1+, define classmaps with names (stringified
+ * enum-symbols) copied from above. 1-to-1 mapping is recommended.
+ * The classmap is exported, so that other modules in the group can
+ * link to it and control their prdbgs.
  */
 DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
 			      D2_CORE,
@@ -129,11 +115,13 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 			      V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
 
 /*
- * now add the sysfs-params
+ * for use-cases that want it, provide a sysfs-param to set the
+ * classes in the classmap.  It is at this interface where the
+ * "v3>v2" property is applied to DD_CLASS_TYPE_LEVEL_NUM inputs.
  */
 
-DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
-DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
+DYNAMIC_DEBUG_CLASSMAP_PARAM(p_disjoint_bits,	map_disjoint_bits, p);
+DYNAMIC_DEBUG_CLASSMAP_PARAM(p_level_num,	map_level_num, p);
 
 #ifdef FORCE_CLASSID_CONFLICT
 /*
@@ -144,12 +132,10 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE")
 #endif
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
-
 /*
- * in submod/drm-drivers, use the classmaps defined in top/parent
- * module above.
+ * the +1 members of a multi-module group refer to the classmap
+ * DEFINEd (and exported) above.
  */
-
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
@@ -224,6 +210,7 @@ static void __exit test_dynamic_debug_exit(void)
 module_init(test_dynamic_debug_init);
 module_exit(test_dynamic_debug_exit);
 
+MODULE_DESCRIPTION("test/demonstrate dynamic-debug features");
 MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
 MODULE_DESCRIPTION("Kernel module for testing dynamic_debug");
 MODULE_LICENSE("GPL");
diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_submod.c
index 672aabf40160..3adf3925fb86 100644
--- a/lib/test_dynamic_debug_submod.c
+++ b/lib/test_dynamic_debug_submod.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Kernel module for testing dynamic_debug
+ * Kernel module to test/demonstrate dynamic_debug features,
+ * particularly classmaps and their support for subsystems, like DRM,
+ * which defines its drm_debug classmap in drm module, and uses it in
+ * helpers & drivers.
  *
  * Authors:
  *      Jim Cromie	<jim.cromie@gmail.com>
@@ -12,3 +15,7 @@
  */
 #define TEST_DYNAMIC_DEBUG_SUBMOD
 #include "test_dynamic_debug.c"
+
+MODULE_DESCRIPTION("test/demonstrate dynamic-debug subsystem support");
+MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.51.0


