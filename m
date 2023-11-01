Return-Path: <linux-doc+bounces-1550-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB747DD9B6
	for <lists+linux-doc@lfdr.de>; Wed,  1 Nov 2023 01:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50181B21013
	for <lists+linux-doc@lfdr.de>; Wed,  1 Nov 2023 00:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61177F;
	Wed,  1 Nov 2023 00:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USfTSJWz"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3780FA2A
	for <linux-doc@vger.kernel.org>; Wed,  1 Nov 2023 00:26:33 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A16DF4;
	Tue, 31 Oct 2023 17:26:32 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7a66a7fc2d4so230517539f.0;
        Tue, 31 Oct 2023 17:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698798391; x=1699403191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4Nv87Lg2zXFTsrsMPJe4o1KQfKM5CR/Su7zfjGsbi8=;
        b=USfTSJWzLC597jvJwsc2pVm85jjVuLONMvw3EEp8jSw0ZIHRZrM4/nd7FoLDxbtY+Z
         nPOk/J4JrVkOPtgw3hlDgl/dYZ18g+GCPfMK/9ojUOsoFwo7hBi/DBF7XxkJIM4NdCLf
         PR+mMpIP6zWj4bS9wOANUwDXTfVz5kqVvmqdEwOcCeSoMSIv03tmW7QAdqrD/J5fWoiH
         ETFHS1dDNkzlPm8e0xG2z0ZnsuwLZfGl3Hne+tgv3BrSkXDcMxzDLGQGnkfncMDn5VyY
         lmyNzn8Ju2nzuI9Xk2voaJ5Hhhqi2ZZIhcl8HzB9fqh5ROJ7pYACOi5WVpBuDOntSCUu
         Z6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698798391; x=1699403191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4Nv87Lg2zXFTsrsMPJe4o1KQfKM5CR/Su7zfjGsbi8=;
        b=vJlXFQB1Jlx9ZYjycPRk7a25TZ7CWJ4kNFCd+EtdFP9E0YidV6WzDbpOUbftbtNXu/
         F5xexL7+QTggkqAka4U3I/0pCNMh4HA2DxYg6CAUmEKdRNgcnDI9GojFFNhmuELaQQNB
         99uRRUFJDSRXIYJB1JaJDCB/2uH3b5vviTGTc0fsuqkNAJNABpLeTVZ+Hkm/mBRAyqCT
         w6EwXAH+xWEDk4h1YQgg+ML8PXul77L5fNR7bGP6ykPADiHCPPlpRv3YcwTG9xyhOree
         00T40uGM1FSELFMx8gn1V69luNCDimo4UEeo6fFTGqYPEVdASEHXTa+BWMvRjn9uYLnH
         vusg==
X-Gm-Message-State: AOJu0YzyMXXT+n7MCThEnz/QtWP9DcH83NVN6EdafMSIe5dZDzKze2az
	yVcxKo5i1qo+5g9xebwNzmVakf2hdmbaYA==
X-Google-Smtp-Source: AGHT+IHLrA+Al7TWI7oCthu/wTueYwlD3e3gy4zvovlLPu9I2SiuW1SsLgmgD7dqBCKdf5Mkn/fFyg==
X-Received: by 2002:a05:6e02:1d8b:b0:352:a73a:16f9 with SMTP id h11-20020a056e021d8b00b00352a73a16f9mr17731093ila.18.1698798391088;
        Tue, 31 Oct 2023 17:26:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 17:26:30 -0700 (PDT)
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
Subject: [PATCH v7d 10/23] dyndbg: tighten ddebug_class_name() 1st arg type
Date: Tue, 31 Oct 2023 18:25:56 -0600
Message-ID: <20231101002609.3533731-11-jim.cromie@gmail.com>
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

Change function's 1st arg-type, and deref in the caller.
The fn doesn't need any other fields in the struct.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b07aab422604..8158943b350d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1117,12 +1117,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 #define class_in_range(class_id, map)					\
 	(class_id >= map->base && class_id < map->base + map->length)
 
-static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
+static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map = iter->table->classes;
-	int i, nc = iter->table->num_classes;
+	struct ddebug_class_map *map = dt->classes;
+	int i;
 
-	for (i = 0; i < nc; i++, map++)
+	for (i = 0; i < dt->num_classes; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1156,7 +1156,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	seq_puts(m, "\"");
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter, dp);
+		class = ddebug_class_name(iter->table, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-- 
2.41.0


