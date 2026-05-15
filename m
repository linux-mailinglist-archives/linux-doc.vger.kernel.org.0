Return-Path: <linux-doc+bounces-87734-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBUNHv+QB2pU9AIAu9opvQ
	(envelope-from <linux-doc+bounces-87734-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 23:32:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 905215582C9
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 23:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6B2130616A3
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 21:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2FB4048A4;
	Fri, 15 May 2026 21:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9OputCr"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B674404890
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 21:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879731; cv=none; b=plX7q7FEQ9c+1ET+myo6TI2BbMOjQZCyrLneWp7ech9Nx8SJ71rHQZn4azKclRdhBidAZQVaLUa56/RRfPXuzmP/dj4/ejVj5VEQedM599LgCP4wcpissljuWaLgmTKRwB5GyRK59bLWDaL2IwEXacrNR1SM0sGdY14y2DQqfyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879731; c=relaxed/simple;
	bh=kbvK6cuaNQpZn6Q9g72Q+TOpf/2ROUnAJihI0oZoubo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXxa+lL76pvLTsaTrYRbqID4PSBUfaxVoVEj/+GjlTWDm6w2lRtz+jESTT6WI/6QB7+ZbLV/9Xz0r/4AUpqlcOk0hUlTT72ZbSdbgYJ38BqoDdSVDNx6sWF27hdMqkEUc+qz21kLmT2y4DE3WhwRanw6ux6IlxrYRwrwt95nGls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9OputCr; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c156c4a9efso374983eec.1
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778879729; x=1779484529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6v1a1pQ4RntgauZdGQ/AgmAZlKsDK24ag7JDuVxfuOw=;
        b=o9OputCrmArK0qB9XWlHF/QKy9zlHBWFInzZrLIt4PpmYMpSYUW/atSgYmLlgUM3f3
         XQigHp+a4Zv2AXXBarW6f+KVLGlpORIk3Lz9XpkEPVhgevaX3pNxUgtWBbvcp0bd2SOT
         bXAHdAnn35Nia+1dkLc0jWevh3S7Wpl0bpu8juF223uNnqlu6TjcLkJ29SE3/imlzEsJ
         qrQ0p/s8SbX3PesAM/CSUB23lxUVz/gXlmeAStw17Jra8vDv4spFo+sgBeCI+aTcdrG5
         4KPpFb8pNCMi68b71RFVGuY1sy7Y+uTy06kpVfSsgaeC6RLXeGW1CiQT8dg76RfN0yjZ
         jzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778879729; x=1779484529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6v1a1pQ4RntgauZdGQ/AgmAZlKsDK24ag7JDuVxfuOw=;
        b=BmpU+WEnBRlHWIASNvBM1Bq9BvforVVWpL5XIYXkl4RPGiy29jtiKA463aypx26xn5
         gkrUA2qlOleJ+1u6sMeIFCvBvzwSm/+stLPNarASfPLPz+LAi58q2+RzwQXJiY2GFUeW
         cyG8fRe1ZB3PEZ4bxg3Bq/fbOlBUFhXkqqIQM4T7DV9m61tifN/BXimiIL+zB1sHI6Ls
         o6QPYeGwjRH3etXEzr80SYsxDTaoUZBhxmuEYLEzBiEfyMDgjCCW5j9ICBHkF0tC1c4a
         tn81KpJ8ed43QCtutTAqrQ24YKXO+SgPN3/Vr8K2ezCTa/4SWNIm307s4OR2VVb8XSkS
         7jtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+r1S/Q81vV1yJtG6iTFwOHHw8pfMKt6ZsiHxq5GRT3U9fHLcCHVWLrLcBj8DJerIOMpN/8z4z8Has=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfebyd8EG94QXL3l57HtPU39o0YwhsuC6zPObKWAP+WNMo2QJk
	0CdTuNQcv1NjH5tSHNkNgRJzGefm7Jb9q9lk7B5zJJIKfQkJlfNB4EFv
X-Gm-Gg: Acq92OEsn9OX4ElgFG0QVaDoJWzpPwfn6dkEvlLtHiHGoaXxYBRv9zKH9pP8gZsQd46
	s2JvMum3KWhqDPVrRaycd5ltSpe5PlSYYTKK0xmCydX5DW55Q/TR8Ml6VJnHzO+VK/UUoOIFnGy
	Rrrti+ggeDJToNKNQzair8lrTzqeeT9VF5cCmSduPUxLkbPFlSXEQHS3y2VSoDxwIPXaWiOo308
	fu0akFwHYFswzU3uNPdY+6DZCjCchi3q8ZSGKXq93tZlbK/Y5k3Y4Uq3w9hrrE/ghlsGOju/Mno
	w0E6jcVGHkO06uC6MiwR3+Ee6q8srnby23tOeuBfaSau9PKo4+393Pi709tdNkUDd5O2rbDm7fJ
	Y94bDMgCyjLICoWxlevcj0oeRWRsLg8kvLyb9ZkQr3pvn0uyApPu4/cVtA8SrBOIcyHapQSvrGI
	dX4db3zpr9QCOHaaKxzxPVfG+Q/M9DZRs=
X-Received: by 2002:a05:7300:818b:b0:2be:7885:31df with SMTP id 5a478bee46e88-30398618b3fmr3091136eec.17.1778879729276;
        Fri, 15 May 2026 14:15:29 -0700 (PDT)
Received: from mimas.lan ([2603:8000:df01:38f7:a6bb:6dff:fecf:e71a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2ea6dsm8268038eec.4.2026.05.15.14.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 14:15:29 -0700 (PDT)
From: Ross Philipson <ross.philipson@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-integrity@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-efi@vger.kernel.org,
	iommu@lists.linux.dev
Cc: ross.philipson@gmail.com,
	dpsmith@apertussolutions.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	ardb@kernel.org,
	mjg59@srcf.ucam.org,
	James.Bottomley@hansenpartnership.com,
	peterhuewe@gmx.de,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	luto@amacapital.net,
	nivedita@alum.mit.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	corbet@lwn.net,
	ebiederm@xmission.com,
	dwmw2@infradead.org,
	baolu.lu@linux.intel.com,
	kanth.ghatraju@oracle.com,
	daniel.kiper@oracle.com,
	andrew.cooper3@citrix.com,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v16 27/38] x86: Add early SHA-256 support for Secure Launch early measurements
Date: Fri, 15 May 2026 14:13:59 -0700
Message-ID: <20260515211410.31440-28-ross.philipson@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260515211410.31440-1-ross.philipson@gmail.com>
References: <20260515211410.31440-1-ross.philipson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 905215582C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87734-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,apertussolutions.com,linutronix.de,redhat.com,alien8.de,zytor.com,linux.intel.com,kernel.org,srcf.ucam.org,hansenpartnership.com,gmx.de,ziepe.ca,amacapital.net,alum.mit.edu,gondor.apana.org.au,davemloft.net,lwn.net,xmission.com,infradead.org,oracle.com,citrix.com,googlegroups.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	FROM_NEQ_ENVFROM(0.00)[rossphilipson@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,apertussolutions.com:email]
X-Rspamd-Action: no action

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

The SHA-256 algorithm is necessary to measure configuration information
into the TPM as early as possible before using the values. This
implementation uses the established approach of #including the SHA-256
library directly in the early boot code.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Ross Philipson <ross.philipson@gmail.com>
---
 arch/x86/boot/startup/Makefile     | 1 +
 arch/x86/boot/startup/lib-sha256.c | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 arch/x86/boot/startup/lib-sha256.c

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index e283ee4c1f45..071a90f23ae0 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_X86_64)		+= gdt_idt.o map_kernel.o
 obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= sme.o sev-startup.o
 
 slaunch-objs			+= lib-sha1.o
+slaunch-objs			+= lib-sha256.o
 obj-$(CONFIG_SECURE_LAUNCH)	+= $(slaunch-objs)
 
 pi-objs				:= $(patsubst %.o,$(obj)/%.o,$(obj-y))
diff --git a/arch/x86/boot/startup/lib-sha256.c b/arch/x86/boot/startup/lib-sha256.c
new file mode 100644
index 000000000000..f60df97f9244
--- /dev/null
+++ b/arch/x86/boot/startup/lib-sha256.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Apertus Solutions, LLC
+ */
+
+#include "../../../../lib/crypto/sha256.c"
-- 
2.47.3


