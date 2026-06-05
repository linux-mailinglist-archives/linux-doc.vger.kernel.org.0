Return-Path: <linux-doc+bounces-91109-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KhhWHq0DI2q3gQEAu9opvQ
	(envelope-from <linux-doc+bounces-91109-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 19:13:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E149164A072
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 19:13:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=H4cq3GPs;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91109-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91109-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27725306FD80
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 17:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE6339DBE0;
	Fri,  5 Jun 2026 17:08:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267813905E0
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 17:08:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679329; cv=none; b=CTqN6PhOGJVTVIdM+0oapJ2wTP9TjJfKRe3Y7PtCu2s5IaNTgD3cViwjNhQY2sdLfneXGU+IXbtQAJnpiUABecpT5eMKV44PsqRRbmemqcuz+jTZGkkhjILsnzox0fL9CYVG0afZaoCxgZVixB3eC2NXDFsY5VnFc3wVM9M1W40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679329; c=relaxed/simple;
	bh=eteoMHJ7Mk3s+G+vf25Of59vs7CpFhPIpMWB+6c3DaM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F0o4nfX4UTKrSL5AmylaL+08b0JzaTy6t/01UWF472Y0xVYIsFHqRjuMKj+wP6IN6hZz1Zi3WYoFDhsXIu6PxqPhIV6uXvnpvvf5x0B+q1fNUeLRsXCU0bIbFLXEEVH9xENr5yfeqjdGDkegXMDD8VLiXuiZ1abvrQdMHYv3NOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H4cq3GPs; arc=none smtp.client-ip=209.85.208.74
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-68d23422ec4so3540663a12.3
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 10:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780679326; x=1781284126; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mUNSpB3dfOvSGnAPr0UW6nHYEMpqSvyWhzAeEo+qvXw=;
        b=H4cq3GPsGDKZqx/B4zCO812yBBo3wlJqEEEsB/9fFf0HyGjaxomB5wy5Zqi18TTT2B
         rMcJSQ/5nsRXh589tSVIVrjl9J2zUy73nFWFq3hToFsrmwaVPtfGf50hDcKBEUbnpDnG
         4z6Pnx1+sJ11IAi/Gk6D96En35em4RmEjzRH2EfKM2rJuai4TF3xXIig5dVrQuRIimGh
         Opo9itYAdUh6oi2FncgGJNs2/+tdoLBgtbFjqNPuuIw/dvJmWALnGSxCf+HWUoifirN3
         fjoJEXJjGZIu3FgKDvgGXTUitVK9YZQf/TplKT4LJ62wESfLhlODDa8ETym2HAMInghH
         7lXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780679326; x=1781284126;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUNSpB3dfOvSGnAPr0UW6nHYEMpqSvyWhzAeEo+qvXw=;
        b=Q2Npkkw3IKSPFJHXYr93cbNBxpcKCamwKqYVmS/kBA+4ADT2rh84luMS0LYSa79JdP
         LdJ5aQAUfEJbs4ioTt5U7MRUkJN8ajhjtMSF7hecyMyg7A/5od4TnvvnmZX9neESVI+w
         ZdpdF2QWyutgwImX7IDv0cojDyu+Ty8DLNVxgipPCgFrvWGN1NxnZ2pjcC9tGmx7D6mL
         iZGibtQYRfAjZyyezyS8lYVMtxtveRX9e3qhFlVDr/Y28GtcRuuONAQJeAn8WqyXfUto
         Pj4EVKsARVjmps0uMMH3+T36o8NiiCv+dP/wlQUjUXbf1X2BPjUtDsSliDVZaU1Hl9vx
         FIgw==
X-Forwarded-Encrypted: i=1; AFNElJ9WjbUQ092AVqroNRkS7JSAkJF8d6QqbHpO0bL8M+mn5jJrawxOyhwoi0vPhMXp0zRmp+M5Jf2chN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpV27QxXmwUp8H5wyP1/YwGe41tJmI9wYrW3y7kVtTEjhMANRw
	o0neo7rL843e1HaOk4bn9gUqbHmM2Cpm3bZNz6wiVsVf+I+uOR3S8It6OqGBk7uu/NEvZrNgI2x
	xJm4MTLIYUuHKu1+X6w==
X-Received: from ejbzc9.prod.google.com ([2002:a17:906:9889:b0:bc1:3569:5260])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9812:b0:bec:18d5:ddec with SMTP id a640c23a62f3a-bf37311392cmr242121166b.41.1780679323496;
 Fri, 05 Jun 2026 10:08:43 -0700 (PDT)
Date: Fri,  5 Jun 2026 17:08:27 +0000
In-Reply-To: <cover.1780676742.git.tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1780676742.git.tarunsahu@google.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <c17394cb12c805a7026047beda2563c7bad44a61.1780676742.git.tarunsahu@google.com>
Subject: [RFC PATCH v2 02/10] liveupdate: Add LIVEUPDATE_GUEST_MEMFD config option
From: Tarun Sahu <tarunsahu@google.com>
To: Jonathan Corbet <corbet@lwn.net>, vannapurve@google.com, 
	Tarun Sahu <tarunsahu@google.com>, fvdl@google.com, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Shuah Khan <skhan@linuxfoundation.org>, sagis@google.com, 
	aneesh.kumar@kernel.org, skhawaja@google.com, vipinsh@google.com, 
	ackerleytng@google.com, Pratyush Yadav <pratyush@kernel.org>, david@redhat.com, 
	dmatlack@google.com, mark.rutland@arm.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	seanjc@google.com, axelrasmussen@google.com
Cc: linux-kselftest@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:vannapurve@google.com,m:tarunsahu@google.com,m:fvdl@google.com,m:pasha.tatashin@soleen.com,m:skhan@linuxfoundation.org,m:sagis@google.com,m:aneesh.kumar@kernel.org,m:skhawaja@google.com,m:vipinsh@google.com,m:ackerleytng@google.com,m:pratyush@kernel.org,m:david@redhat.com,m:dmatlack@google.com,m:mark.rutland@arm.com,m:pbonzini@redhat.com,m:rppt@kernel.org,m:graf@amazon.com,m:seanjc@google.com,m:axelrasmussen@google.com,m:linux-kselftest@vger.kernel.org,m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tarunsahu@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91109-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarunsahu@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E149164A072

Introduce the LIVEUPDATE_GUEST_MEMFD Kconfig option. This option
enables live update support for KVM guest_memfd files, enabling
guest_memfd-backed memory preservation across kernel upgrades.

Currently this support only guest_memfd files that are full-shared
and pre-faulted.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 kernel/liveupdate/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index 1a8513f16ef7..0bbc4037192e 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -88,4 +88,19 @@ config LIVEUPDATE_MEMFD
 
 	  If unsure, say N.
 
+config LIVEUPDATE_GUEST_MEMFD
+	bool "Live update support for guest_memfd"
+	depends on LIVEUPDATE
+	depends on KVM_GUEST_MEMFD
+	default LIVEUPDATE
+	help
+	  Enable live update support for KVM guest_memfd files. This allows
+	  preserving VM Memory backed by guest_memfd file across kernel live
+	  updates.
+
+	  This can only be used for the guest_memfd that are fully-shared
+	  and pre-faulted.
+
+	  If unsure, say N.
+
 endmenu
-- 
2.54.0.1032.g2f8565e1d1-goog


