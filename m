Return-Path: <linux-doc+bounces-91025-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S2M7GJ1DImrOUQEAu9opvQ
	(envelope-from <linux-doc+bounces-91025-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 05:33:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8891B644E1E
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 05:33:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=soleen.com header.s=google header.b=FxvLg3S9;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91025-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-91025-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=soleen.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B03230136E4
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 03:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515FF3655E3;
	Fri,  5 Jun 2026 03:33:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD801FECBA
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 03:33:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780630418; cv=none; b=nNpuYKrykOGDFxITtGPtnUrjMeavtBno4tqqM6ErPXAI3matPqBisfQuw5OiZVTPFJzqUSa+3rBLdrlI/szrHX22/m3qn3En5h0IPBW2efTwe8XXTVI4/NKpIP0w27FhnNR9QkspaLx+yZ1SNn9ivZFQHxZeKOBKs/gKqxTrik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780630418; c=relaxed/simple;
	bh=DtZ9V8MH8JsGyHu6CF1ttsD49Zp4ajpPdH0dtGBNsU4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCsbYq/NKEORltQhy9BWKOxAqRQNjmevWoG0D5Xftm/EpawYZ9s/g+pCyQrp9ZntwfhmTnGofX3QYKrdMPbdwhbfQPY9Wc+dOebwnwbpwjdlor6SAEH5vhtDW2KRdLNJSVnODkAHa7vVJrMcdUHoqLPPF9vKVmD3zOEgJ7nOOs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=FxvLg3S9; arc=none smtp.client-ip=209.85.222.176
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-915336b83adso175773285a.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 20:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780630416; x=1781235216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9VRMQ5Ef8ulqUN7FHiGBWdV1K/iIYqxWaAhgeSwRK0=;
        b=FxvLg3S9vw3x4H+gYi6tndasKxlu+a/73bv82RhwcMtzPyTrvG6tJgjLDQTRs0k+1L
         rnKnxSUupV4jDW2OalnjkH+evs0mBBOdYE2OvkeriJMvJlA7CD+sW8t4A/FLmHQT1Fvq
         DCgCr/dmmu9YkqRbLo4KCB/dvPxw9vAWt9RtqQshMqXpr99ux+XZ0oVPia+fkGXzS4Ef
         qAEWO9+lcCBs6zAOdUyYW9IBbrCJWQz6nBhIHwOu8RlSjK/l6EtnkjzNHAZZ693wL7qH
         +owZzr0A7a800rgIRLNhdDFY4wluap92g8dp7h6iXDazGzguAtQT1KqEnkizCD8NkedQ
         NhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630416; x=1781235216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J9VRMQ5Ef8ulqUN7FHiGBWdV1K/iIYqxWaAhgeSwRK0=;
        b=ZQWSBLzBucGNwuqMEdgm4hJe7BsIhhjVmpKOWKRJk3mxQZDpDAzUqHr/+bVcZmlZNF
         zdvrijxWcYTZ3vStjYNOgLv83Csi+mJ9cMlrqjn59H+ACgPZ6iVZF60z4oy82Xf9ccRx
         F2P78/7V+/18I0pnG5rwXMTw4G5dACfgzg6pXC4ipfzIViMJ2yneeytVksHhjWRj1RUH
         NBvJlhc5oZbb1U9JtY/D8vDK7/XXgR6Rz4R4annnmCIsuuLOF1zKDkUQjpO3C70pFCKD
         xQw+Gyp3Eqf1+5zReUTC+xsnvcXvLZyvDOjueRFqeQU42dYsiSWEVrMKkvZdpnGXIrT/
         VzKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+79n5PX55kcmT6Yra32Vjoww6VZ5n4+HrlFwHGmQHskVfaw94MFh3LdibRCguqfII0UveqABu2Ikc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjk7HLHHDH8vcmhwR3MyeHlBz4Co97GhU/JHevCnmFn8IpS0ZI
	5Ec3OrESwEj+ca/aqu2O1p7iAZQ16OARMSqpkesot2zUAQ9CBSp452Ys/1ZeLPccEJg=
X-Gm-Gg: Acq92OFq822hglxDvEMf4gJvbuT2nwu55c/TtUhcx07FAjJ00wPYOYAeZmfDapZA+kJ
	/mujnAoM/0W43/NvUjrq8gIVKieddME3fjhj1wVdkx+dTsN/k17LJ9k5Jx8ndSisC1nOSksN6W9
	s9V/EGYnJ8Vxl1Igq4u0D52rlq1hzfncjIMyWEpQxB42LN22MgSNk1yEAgwukk6jnjNWZhItcTj
	o+ZY/0Nw6UwD3QcuhcMxi7Bl6tx40/VtsyvcNxqHgZjV1TupFDxyMveViOCf+rojX/BLfWr+yi9
	Rk6Btlrc3n8R886c0ff9wBjFP/lPLgbuCrcxN5cxGKqkuOQAw79JrLElnsT0QCdPGHfikfIl5pF
	N3NiY8F+uryOYqmGfMX7aY6ruKk2qUI+aOvJ2Z5Hoou8dZdhDppLJJYLS1P5IciWlTfQH9XHYXe
	+72MKcsrnrDCMYkx4GGPXzmue4Zd6xq32pNwCfvkF0FeWnbiHXJj9ypfMmhtQrrg==
X-Received: by 2002:a05:620a:3910:b0:915:7f9f:8d97 with SMTP id af79cd13be357-915a9daef8bmr376847085a.53.1780630415906;
        Thu, 04 Jun 2026 20:33:35 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37c645sm743050785a.30.2026.06.04.20.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:33:35 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	jasonmiu@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	ran.xiaokai@zte.com.cn,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [RFC v1 5/9] kho: move kho_block.h to kho/block.h
Date: Fri,  5 Jun 2026 03:32:31 +0000
Message-ID: <20260605033235.717351-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605033235.717351-1-pasha.tatashin@soleen.com>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[soleen.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[soleen.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-91025-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kselftest@vger.kernel.org,m:rppt@kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:jasonmiu@google.com,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:ran.xiaokai@zte.com.cn,m:pasha.tatashin@soleen.com,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:graf@amazon.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[soleen.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,soleen.com:mid,soleen.com:dkim,soleen.com:from_mime,soleen.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8891B644E1E

Move kho_block.h to kho/block.h, organizing it within the existing
kho directory structure as more KHO data structures are introduced.

This is a pure code movement patch; no logic or functional changes are
introduced.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/kho/index.rst       | 2 +-
 MAINTAINERS                                | 1 -
 include/linux/{kho_block.h => kho/block.h} | 2 +-
 kernel/liveupdate/kho_block.c              | 2 +-
 kernel/liveupdate/luo_internal.h           | 2 +-
 kernel/liveupdate/luo_session.c            | 2 +-
 6 files changed, 5 insertions(+), 6 deletions(-)
 rename include/linux/{kho_block.h => kho/block.h} (100%)

diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-api/kho/index.rst
index a10b10700fb9..4a5477221fe4 100644
--- a/Documentation/core-api/kho/index.rst
+++ b/Documentation/core-api/kho/index.rst
@@ -95,7 +95,7 @@ KHO Serialization Blocks API
 .. kernel-doc:: kernel/liveupdate/kho_block.c
   :doc: KHO Serialization Blocks
 
-.. kernel-doc:: include/linux/kho_block.h
+.. kernel-doc:: include/linux/kho/block.h
 
 .. kernel-doc:: kernel/liveupdate/kho_block.c
   :internal:
diff --git a/MAINTAINERS b/MAINTAINERS
index 920ba7622afa..9ec290e38b44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14208,7 +14208,6 @@ F:	Documentation/admin-guide/mm/kho.rst
 F:	Documentation/core-api/kho/*
 F:	include/linux/kexec_handover.h
 F:	include/linux/kho/
-F:	include/linux/kho_block.h
 F:	kernel/liveupdate/kexec_handover*
 F:	lib/test_kho.c
 F:	tools/testing/selftests/kho/
diff --git a/include/linux/kho_block.h b/include/linux/kho/block.h
similarity index 100%
rename from include/linux/kho_block.h
rename to include/linux/kho/block.h
index 93a7cc2be5f5..2b9d5a080a6a 100644
--- a/include/linux/kho_block.h
+++ b/include/linux/kho/block.h
@@ -7,9 +7,9 @@
 #ifndef _LINUX_KHO_BLOCK_H
 #define _LINUX_KHO_BLOCK_H
 
+#include <linux/kho/abi/block.h>
 #include <linux/list.h>
 #include <linux/types.h>
-#include <linux/kho/abi/block.h>
 
 /**
  * struct kho_block - Internal representation of a serialization block.
diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index 0d2a342ef422..6cedcd36bfd2 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -23,7 +23,7 @@
 #include <linux/io.h>
 #include <linux/kexec_handover.h>
 #include <linux/kho/abi/block.h>
-#include <linux/kho_block.h>
+#include <linux/kho/block.h>
 #include <linux/slab.h>
 
 /*
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 64879ffe7378..349f6d141873 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -8,9 +8,9 @@
 #ifndef _LINUX_LUO_INTERNAL_H
 #define _LINUX_LUO_INTERNAL_H
 
+#include <linux/kho/block.h>
 #include <linux/liveupdate.h>
 #include <linux/uaccess.h>
-#include <linux/kho_block.h>
 
 struct luo_ucmd {
 	void __user *ubuffer;
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index b79b2a488974..01c0ccf09919 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -90,8 +90,8 @@
 #include <linux/fs.h>
 #include <linux/io.h>
 #include <linux/kexec_handover.h>
-#include <linux/kho_block.h>
 #include <linux/kho/abi/luo.h>
+#include <linux/kho/block.h>
 #include <linux/list.h>
 #include <linux/liveupdate.h>
 #include <linux/mutex.h>
-- 
2.53.0


