Return-Path: <linux-doc+bounces-96784-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8fCIFnpTVmq73QAAu9opvQ
	(envelope-from <linux-doc+bounces-96784-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:19:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E3756594
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:19:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=Saua0PpR;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96784-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96784-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D488E3042C5F
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 15:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D254C6F05;
	Tue, 14 Jul 2026 15:15:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347874963AA
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:15:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042126; cv=none; b=LFCFrHq0lG7HcWlreQT+qz3rY6HOw4jMnnNdxn7PzsopR07clH615/dlJY1EYJHBgdO7nUq0Pdd0OHXetTqv4Y3EpeVmg/p14iyb2BkbBbUK9VoIzKrK8jQZmQBkTKK/pS03laFrR/c31u72vCSANP/PwE9H7qy8xuvgrYoBuqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042126; c=relaxed/simple;
	bh=ikkIKALeVfseIqEqO/ki0c8rJ+D/mTjIlQS+Bh7TNH8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fVxBP7BNp4DWq3VcDnGobTnY9rwFc3ZlWeINn+zuivIotH7B0mhHL0rlUvJ4r3KnuWSyHK8G7hDxFTQPGV8eJC3S2BlnrFHpfYw/4X9Cat9xenaouxgMY1uEsTvo5LfD1hzF9w0rMieGbtYR/KdTErq1zkQt/NF3F42pO/y34Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Saua0PpR; arc=none smtp.client-ip=209.85.210.201
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8484b57b98bso8661110b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784042123; x=1784646923; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6euMhf7mogWwsfwAzliK6IQ37N0mgMRUyNxCkXOGnkg=;
        b=Saua0PpR+1WYgK5nic0uAf4ibCeyitepgMldrbhBt/QtD2vnwVJkePQf9zltqpv/4N
         kLOGC3oPS0zYBJqHKeW5hKdQfgyEo7g1wu9SXR0erxCzK7kq2ovXNbUZtmThYc0geFAN
         FvlEuxvfyHnfGP3MIzLPkDOEGB1X8c/XskYncNGB55TH2d2tzviTY1+6gtcapTPWKDwZ
         jEIk+gedgykX+vPlR/ymnkKhi/xv8eCzNrr4ApDkxAt0HYthyyE2AmVOiLuB7Q4oRNeM
         7/SLGMQPm2dRUXb2ECiwosQSoXC4S3mBUNC//pJrk0M9gkj/D84hmJMFQ7Yi10/xCsDx
         OldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042123; x=1784646923;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6euMhf7mogWwsfwAzliK6IQ37N0mgMRUyNxCkXOGnkg=;
        b=YdvCrtm8QPUH8jdXqZapw5bjBR3VoOgPZHOnEQwu01o9ylrKjk+XfkD755KwPasdzm
         F0fgQdPgQROEIm8DZr2jepEq5gVQ/q0poDF5W35+vvIf0e7UijDUHCyi1fjhpmRW77w1
         rAKZfyEYn6cA/8Jm2fM5sxosNPZOv2zTvjzC3FtRmLcfX+cUToQFiNyNcKAedIAr5OA+
         GuO27XJYLgNkXu3OJvtAe7oGEl7WyNq3EReObigGB9GSlmHEsNpyQ2T0Lbqz5ojLqitM
         +euTu07d7gK9Iv2Y2D9W9mkZ12somRzD7dm6ZZn6gCJVngOBRk90/hUMLlqe6FOXZFgE
         qsaA==
X-Forwarded-Encrypted: i=1; AHgh+RrrMFHsjegHI8XJjt7FfL/MA6C0AUSWEp/euHggV1ygzA6TsveTUj0xOk5V+DlCVCD6jXgnWcVEDzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxznjhkmL488jABFyBN4mu+fAeOAuUnt5vjdSTLiECb+rrTAOGO
	qiiSB59ynKNpdMyhcaC+g81lEt90f+JGZJ/V1ViegHDcv1hEBqLo19vEeF1TjZ2AjHdTXEGaNry
	apKNyTOlR2g==
X-Received: from pful22.prod.google.com ([2002:a05:6a00:1416:b0:847:7fb7:7370])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e87:b0:848:6dd5:f69
 with SMTP id d2e1a72fcca58-84a516062dfmr4085012b3a.42.1784042123043; Tue, 14
 Jul 2026 08:15:23 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:14:58 -0700
In-Reply-To: <20260714151505.3466855-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260714151505.3466855-1-vipinsh@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260714151505.3466855-14-vipinsh@google.com>
Subject: [PATCH v5 13/20] vfio: selftests: Build liveupdate library in VFIO selftests
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rientjes@google.com, rodrigo.vivi@intel.com, 
	rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vipinsh@google.com, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, 
	yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96784-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[vipinsh@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:ajayachandra@nvidia.com,m:alex@shazbot.org,m:amastro@fb.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:bhelgaas@google.com,m:chrisl@kernel.org,m:christian.koenig@amd.com,m:corbet@lwn.net,m:dmatlack@google.com,m:graf@amazon.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:jgg@ziepe.ca,m:jrhilke@google.com,m:julianr@linux.ibm.com,m:kees@kernel.org,m:kevin.tian@intel.com,m:leon@kernel.org,m:leonro@nvidia.com,m:lukas@wunner.de,m:mattev@meta.com,m:michal.winiarski@intel.com,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:praan@google.com,m:pratyush@kernel.org,m:rananta@google.com,m:rientjes@google.com,m:rodrigo.vivi@intel.com,m:rppt@kernel.org,m:saeedm@nvidia.com,m:schnelle@linux.ibm.com,m:skhan@linuxfoundation.org,m:skhawaja@google.com,m:vipinsh@google.com,m:vivek.kasireddy@intel.com,m:witu@nv
 idia.com,m:yanjun.zhu@linux.dev,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vipinsh@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C14E3756594

Import and build liveupdate selftest library in VFIO selftests.

It allows using liveupdate ioctls in VFIO selftests

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/vfio/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index e6e8cb52ab03..4c8a30f950c4 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -21,6 +21,7 @@ TEST_FILES += scripts/setup.sh
 
 include ../lib.mk
 include lib/libvfio.mk
+include ../liveupdate/lib/libliveupdate.mk
 
 CFLAGS += -I$(top_srcdir)/tools/include
 CFLAGS += -MD
@@ -31,14 +32,17 @@ LDFLAGS += -pthread
 
 LDLIBS += -luuid
 
-$(TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(LIBVFIO_O)
-	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< $(LIBVFIO_O) $(LDLIBS) -o $@
+LIBS_O := $(LIBVFIO_O)
+LIBS_O += $(LIBLIVEUPDATE_O)
+
+$(TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(LIBS_O)
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< $(LIBS_O) $(LDLIBS) -o $@
 
 TEST_GEN_PROGS_O = $(patsubst %, %.o, $(TEST_GEN_PROGS))
 $(TEST_GEN_PROGS_O): $(OUTPUT)/%.o: %.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
-TEST_DEP_FILES = $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O) $(LIBVFIO_O))
+TEST_DEP_FILES = $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O) $(LIBS_O))
 -include $(TEST_DEP_FILES)
 
 EXTRA_CLEAN += $(TEST_GEN_PROGS_O) $(TEST_DEP_FILES)
-- 
2.55.0.795.g602f6c329a-goog


