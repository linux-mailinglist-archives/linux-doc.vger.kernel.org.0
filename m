Return-Path: <linux-doc+bounces-95108-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ti+FI3aTS2pLVwEAu9opvQ
	(envelope-from <linux-doc+bounces-95108-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 13:37:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3285170FF09
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 13:37:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="TGb7We/B";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95108-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95108-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D910635B1AC6
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 09:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EDF3DA7D7;
	Mon,  6 Jul 2026 09:21:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E803F929A
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 09:20:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329662; cv=none; b=oVPYb2ifsl/MJXlJcn7nc/MvjeYp/GTpiVWc15jDo1xh1Zb8dbKiUG+z8gvXlk0vNHEdhWiF5OqN0ZDY3Wd2o5LnZt9uNReNuj4DhbU+tBwyPsIlhY4b5+ZEp65M7SpWW9Uetyb60gc6Z2nC6B8/mwcvDWX4YcD+MVFXEBPRDBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329662; c=relaxed/simple;
	bh=SQH7RsdEnyNfeS7eCNOEXp6G0v6D4JYiJ63zj8DGjCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gedklcZUsYO/Of5mHeMKqJH0v0fUCr2Iw8V9e4vHqlNguLhDbTmq0hjkKIzIS7NvBjiwFSvdvtv4Yuffjke90KQ9ZTxv7b0uH0coKh/f85PVurBy46RbpX8fnmUGBiJ8xsCQBw8LsqFgMVHufu82mil0AvbdBVWPYcKhhUg4GSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TGb7We/B; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783329657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uQxyf8gFubuHQRk62vioXACqbVSli2rzreFz2EP145g=;
	b=TGb7We/Blz/KKx+w21uuI66IVR0rRQcJhE2SwDn1UrzyYq9zY2rBlQYhMMzIhZ1StM8H2H
	3qCtJzt1gWSYvYp7xjDvVJcd8h6yhn75FECtdJcQXMXmRdWl084gykIPsJR4paMKMjAl3C
	0aYkOzgVm0AEHYILW7zbLED2pzsCsg4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1-UeKAIWzAN0y0LEMF522luw-1; Mon,
 06 Jul 2026 05:20:54 -0400
X-MC-Unique: UeKAIWzAN0y0LEMF522luw-1
X-Mimecast-MFC-AGG-ID: UeKAIWzAN0y0LEMF522luw_1783329652
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A37841955F11;
	Mon,  6 Jul 2026 09:20:52 +0000 (UTC)
Received: from work.fritz.box (unknown [10.44.49.159])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 79E91300070A;
	Mon,  6 Jul 2026 09:20:50 +0000 (UTC)
From: Tim Wiederhake <twiederh@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tim Wiederhake <twiederh@redhat.com>
Subject: [PATCH 1/4] KVM: x86: Document that KVM_CREATE_IRQCHIP must precede vcpu creation
Date: Mon,  6 Jul 2026 11:20:16 +0200
Message-ID: <20260706092021.3625908-3-twiederh@redhat.com>
In-Reply-To: <20260706092021.3625908-2-twiederh@redhat.com>
References: <20260706092021.3625908-2-twiederh@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[twiederh@redhat.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-95108-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:twiederh@redhat.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[twiederh@redhat.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3285170FF09

The kernel rejects KVM_CREATE_IRQCHIP with -EINVAL if any vcpus have
already been created, but the API documentation does not mention this
requirement.  Add a note.

Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
---
 Documentation/virt/kvm/api.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 52bbbb553ce1..ec5bf99ff8b8 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -856,7 +856,8 @@ Writes the floating point state to the vcpu.
 Creates an interrupt controller model in the kernel.
 On x86, creates a virtual ioapic, a virtual PIC (two PICs, nested), and sets up
 future vcpus to have a local APIC.  IRQ routing for GSIs 0-15 is set to both
-PIC and IOAPIC; GSI 16-23 only go to the IOAPIC.
+PIC and IOAPIC; GSI 16-23 only go to the IOAPIC.  This ioctl must be called
+before creating any vcpus.
 On arm64, a GICv2 is created. Any other GIC versions require the usage of
 KVM_CREATE_DEVICE, which also supports creating a GICv2.  Using
 KVM_CREATE_DEVICE is preferred over KVM_CREATE_IRQCHIP for GICv2.
-- 
2.52.0


