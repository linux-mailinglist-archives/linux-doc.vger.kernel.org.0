Return-Path: <linux-doc+bounces-94473-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aOAlFmBwRWr6AAsAu9opvQ
	(envelope-from <linux-doc+bounces-94473-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:54:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F170C6F1234
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:54:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=CGRt9Qfg;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94473-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94473-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BD48326920C
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 19:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5F6429DCB;
	Wed,  1 Jul 2026 19:33:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58B0428D17
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 19:33:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934398; cv=none; b=V4qbptcYHkVlAxg53juYnQN1XA2INYVGC5vrtC+6qnrN5Rpb+y34Okbj2SfVXV30OXYClEcno6S3YtuZKCBk1qfayfXYv462dsWgYJibrpkCr0oLeyoMqKFE6IhrhR4m9aXIWeT/2+ioUs+FP5Nrj6oMUdwurx16k98B05FX3m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934398; c=relaxed/simple;
	bh=uS9BChC7KgGK2M+8u75Q9Ryt/QRAbZtmL5i8BGg+y40=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bIDr8GAeBqObmZm+ReZpq9mXtYUg6JS0Luwg2sw6g6BEp/mLqkRHonS69PXo7H8MS1bkxhPV4yPrRjkXRHHCS3TujBNekkFvgdNzP2/hnv8Dy9MmDU+yVjz1148rOaK7mM4Cj2iGEb0mYQNbVgUY9A8tgjF7QJgb3YrWHEmlsNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CGRt9Qfg; arc=none smtp.client-ip=209.85.210.201
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-847c3a12ce8so532792b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 12:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934396; x=1783539196; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=w419X+lYiD/kBIvhKaeAU2oxypXcdz+V5rg+/s/ZS+Q=;
        b=CGRt9QfgbZ4A0K1KvEd7oB0E5MclUUrNEZsph5oNIYNfP+sbjSBR7+iS1jJR01CMix
         7DMJ8JYtmzETMNvFUfCm5Bf5DrelvA6Q1iXc9mNy8yZTdw0k7OmfW7SfWNTGeWBLEI+Z
         1Js0Y7t8hNHAUOAOILmf8df3Hu4Aojz4YugYTVDBEWMqDcwPjReBlaTbeYUB40PV/v8j
         B27FjEGoE86wdAnxLcd7nxkbCDjrdZdc/dehlitFIQdvVBYrFX50fudD0mgDZ7+K7lQI
         mNT+ZoyAy8DUwx02z8/hNM0HLgdyUw8Lijaj6zjIv52m5hLawcNuiNW31pqeozVaP+YA
         L+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934396; x=1783539196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w419X+lYiD/kBIvhKaeAU2oxypXcdz+V5rg+/s/ZS+Q=;
        b=KVr9kkIm1A3otNhZk9OFzGBE219iZEeH+7k+SOWA86h2ndIrZ+ChWSMDVsPft6r9k4
         A+yqMw+sUDL6aQ2dFbgPGQ/vQ/Ty59aitCTpED0ZOID65jx09xDBwh+PdGw0cAEa+5zl
         ZDjBxdL9pRQtySnOemOqhXhFrsVh3L74eXi8WYQbvSLPVkJi3fvctg9Y52Gr0JEn2lyk
         gJX4C0no/K8HrqKSorjKTTlh7xKPYXJcgofGoBRRuSLIDtzCBQoWFcl8xkMe7CUFPxye
         4bpTO/84HMabsHHD5A1WOqE6HwJR8hX+MF8L6IERW+joZ8vGNlBQgTXrqNa2A2NKzEdV
         AiAA==
X-Forwarded-Encrypted: i=1; AFNElJ+yxc1SrI9mqNlJEVkAqtK/lx6PdANMKHePTXMvXeYizKXBUxN5KtkNwhA+B7iRA/7jroHwiMTEsqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9qfG7zwQ/6Va/S8BKEfaiR4l/KzNJKeNTWz3aqA8LdMpP0S6B
	cwrFHV85OkmIMj7+YKVPoMTBNrMvJcTO8+W6MiJCECvKzFgPqPZBkOEbDUeq/haaH4y9G1MQ5bT
	UJIhGoA==
X-Received: from pfbdf8.prod.google.com ([2002:a05:6a00:4708:b0:847:a13f:28e2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a112:b0:847:8f7c:fa10
 with SMTP id d2e1a72fcca58-847c0894ebamr2717987b3a.35.1782934395673; Wed, 01
 Jul 2026 12:33:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:01 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-41-seanjc@google.com>
Subject: [PATCH v5 40/51] x86/pvclock: WARN if pvclock's valid_flags are overwritten
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:mhklinux@outlook.com
 ,m:tglx@linutronix.de,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amazon.co.uk:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94473-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zytor.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,amazon.co.uk,infradead.org,outlook.com,linutronix.de];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F170C6F1234

WARN if the common PV clock valid_flags are overwritten; all PV clocks
expect that they are the one and only PV clock, i.e. don't guard against
another PV clock having modified the flags.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/pvclock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index a51adce67f92..8d098841a225 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -21,6 +21,7 @@ static struct pvclock_vsyscall_time_info *pvti_cpu0_va __ro_after_init;
 
 void __init pvclock_set_flags(u8 flags)
 {
+	WARN_ON(valid_flags);
 	valid_flags = flags;
 }
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


