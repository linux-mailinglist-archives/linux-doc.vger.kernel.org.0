Return-Path: <linux-doc+bounces-95712-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o5VJC09TTmoFKwIAu9opvQ
	(envelope-from <linux-doc+bounces-95712-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 15:40:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF857726E20
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 15:40:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=dIR3DNbK;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95712-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95712-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 669F23020D0D
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 13:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660BE38552C;
	Wed,  8 Jul 2026 13:39:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD1382F02
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 13:39:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517963; cv=none; b=iT1eNbq/7I1Cczt9EmGEHPrzka3sPd9cYwKhVFllvB8u69AENhVw5gUEhs0gSMRcPf/SlbJ/p13uX2maw7w+5EyZnQdF1iJlKgUIzViQ3ltTRk8w0tYwWcnseVGNniBunS95alH1altM4JEwiv9bcecRBzgfM6qtQC20xJJDDkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517963; c=relaxed/simple;
	bh=m5c+ccLYXR5ymz8ROG8r7MEHITmLJNROuh0xkKUaH2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDiDAD6JO6+jHEOfZSYmtN83El2uzBpn5DX6HLcCx52rp09doyeYV+k4cHzSR2esXTNeUZ9VkerFsEAhqn1OGzVyhmWQUFsxQEqHKtqqXvuMNITjJIlVU2I2NJBTnrz95fFKbQBhPoR2VbNeD+9aS6nCSlPLZqZN8a17sqmOdXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dIR3DNbK; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783517961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/k7wJHHf1drTOERq04oriQIq1stfFuLb0fCEeKENTU=;
	b=dIR3DNbKlyCALkGaVaRJjYLpTaned4rybLmCQCwSzprw4cvLuwZ3aDy0jYu5FdtqGjPIwo
	zv24sjoMCs4vxxTMbsTMS8J836LwcTa7985Cof79Wg/azAXgQuD6rh8x8ePTv+GTlXq9uz
	x94XB5+hBZFK1GVRI1AbyWtEd0dRSiQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-xXdVoeY7NySIpfzcz9kKXw-1; Wed,
 08 Jul 2026 09:39:18 -0400
X-MC-Unique: xXdVoeY7NySIpfzcz9kKXw-1
X-Mimecast-MFC-AGG-ID: xXdVoeY7NySIpfzcz9kKXw_1783517957
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 83D61195609D;
	Wed,  8 Jul 2026 13:39:17 +0000 (UTC)
Received: from work.fritz.box (unknown [10.44.49.159])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0CEED3000C13;
	Wed,  8 Jul 2026 13:39:14 +0000 (UTC)
From: Tim Wiederhake <twiederh@redhat.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tim Wiederhake <twiederh@redhat.com>
Subject: [PATCH 2/2] KVM: x86: Document APIC base address constraint for in-kernel irqchip
Date: Wed,  8 Jul 2026 15:38:55 +0200
Message-ID: <20260708133856.302151-3-twiederh@redhat.com>
In-Reply-To: <20260708133856.302151-1-twiederh@redhat.com>
References: <20260708133856.302151-1-twiederh@redhat.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:twiederh@redhat.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95712-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[twiederh@redhat.com,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[twiederh@redhat.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF857726E20

When virtual APIC access acceleration is enabled (APICv on Intel, AVIC
on AMD), vcpu creation installs a private memory slot at the default
APIC base address (0xfee00000).  If a user memory region overlaps this
address, vcpu creation fails with EEXIST.  The same error occurs when
installing an overlapping user memory region after vcpu creation.

This also applies when using KVM_CAP_SPLIT_IRQCHIP.

This constraint is not documented anywhere.  Add a note to the
KVM_CREATE_IRQCHIP and KVM_CAP_SPLIT_IRQCHIP documentation.

Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
---
 Documentation/virt/kvm/api.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 270c3f0d668f..8a6210b4cd56 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -863,6 +863,14 @@ KVM_CREATE_DEVICE, which also supports creating a GICv2.  Using
 KVM_CREATE_DEVICE is preferred over KVM_CREATE_IRQCHIP for GICv2.
 On s390, a dummy irq routing table is created.
 
+On x86, vcpu creation may install a private 4 KiB memory slot at the default
+APIC base address (0xfee00000).  User memory regions must not overlap this
+address; doing so will cause vcpu creation to fail with ``EEXIST``, or the
+memory region to be rejected if created after the vcpu.  This occurs when
+APIC access acceleration is enabled (APICv on Intel, AVIC on AMD), which is
+the default on supported hardware.  The same constraint applies when using
+``KVM_CAP_SPLIT_IRQCHIP``.
+
 Note that on s390 the KVM_CAP_S390_IRQCHIP vm capability needs to be enabled
 before KVM_CREATE_IRQCHIP can be used.
 
@@ -7921,6 +7929,10 @@ used in the IRQ routing table.  The first args[0] MSI routes are reserved
 for the IOAPIC pins.  Whenever the LAPIC receives an EOI for these routes,
 a KVM_EXIT_IOAPIC_EOI vmexit will be reported to userspace.
 
+As with ``KVM_CREATE_IRQCHIP``, vcpu creation may install a private memory
+slot at the APIC base address (0xfee00000) that must not overlap user memory
+regions.  See ``KVM_CREATE_IRQCHIP`` for details.
+
 Fails if VCPU has already been created, or if the irqchip is already in the
 kernel (i.e. KVM_CREATE_IRQCHIP has already been called).
 
-- 
2.52.0


