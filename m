Return-Path: <linux-doc+bounces-95711-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WPcXMiRTTmr5KgIAu9opvQ
	(envelope-from <linux-doc+bounces-95711-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 15:39:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 98877726DFD
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 15:39:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=K1vm02xF;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95711-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-95711-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12DC43021C8D
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 13:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403053803DA;
	Wed,  8 Jul 2026 13:39:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBFB37EFFB
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 13:39:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517960; cv=none; b=jklrymG7praaqRIfznaxJByGaVAg1fsSI7UWFJOjo25aIzpmuBGAXQYGW3NW2x9j3Dc5lHiolVvR5iItIx9TEabUhtSJugDeBkJDqFVHV46Ly3OrOCr5GLAhqhHKJAcU4GfraGUOIsYqmPwZ7ZUnz9a8qy3umjuPKO7iAxt0fWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517960; c=relaxed/simple;
	bh=S5h10yVlLg4hm4QfhjnsGPEF0EdYHi9GPMixAWGm46U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J4VwJRLxjwJHnU5Oa9tSlfqSS4W706PWFD/gpPzLaulJVoc94up01eHHsJ3FkIo9asJJOhQMV72frLB8jR7j9nhLUxXwmX+hU1HKfwhsnC+fRBwR8GSbSqvC1r+fIeh+tsvNLXRogVILt+ljm88PMlAKdwYuCR6rX8iKEAD1WFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K1vm02xF; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783517957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=itPDcsMF108vlvA8pNHNzQIyWhr1PaF6rs0r2BP78Kg=;
	b=K1vm02xFqg086kgE8KWdRy2l6y6LkHksVr+ZvVcLmwjDnwVpcaqNNuwjrqgdTqCMoLdEic
	fdMnGstQnQl3FBqN8C+AMYOBr75f9ijyL51vmzeFNbbOzaAaoIu73QYaaBvnpcKyouRFJG
	yPT8X4SMXwcxR3YAMDWb+6V3ntcrtEs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-244-zToPt1-oNhSaZ4ssrsWp2g-1; Wed,
 08 Jul 2026 09:39:15 -0400
X-MC-Unique: zToPt1-oNhSaZ4ssrsWp2g-1
X-Mimecast-MFC-AGG-ID: zToPt1-oNhSaZ4ssrsWp2g_1783517954
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 34E581955F75;
	Wed,  8 Jul 2026 13:39:14 +0000 (UTC)
Received: from work.fritz.box (unknown [10.44.49.159])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BE48C3000C1F;
	Wed,  8 Jul 2026 13:39:11 +0000 (UTC)
From: Tim Wiederhake <twiederh@redhat.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tim Wiederhake <twiederh@redhat.com>
Subject: [PATCH 1/2] KVM: x86: Document that KVM_CREATE_IRQCHIP must precede vcpu creation
Date: Wed,  8 Jul 2026 15:38:54 +0200
Message-ID: <20260708133856.302151-2-twiederh@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:twiederh@redhat.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95711-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[twiederh@redhat.com,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 98877726DFD

The kernel rejects KVM_CREATE_IRQCHIP with -EINVAL if any vcpus have
already been created, but the API documentation does not mention this
constraint.  Add a note.

Signed-off-by: Tim Wiederhake <twiederh@redhat.com>
---
 Documentation/virt/kvm/api.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 52bbbb553ce1..270c3f0d668f 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -856,7 +856,8 @@ Writes the floating point state to the vcpu.
 Creates an interrupt controller model in the kernel.
 On x86, creates a virtual ioapic, a virtual PIC (two PICs, nested), and sets up
 future vcpus to have a local APIC.  IRQ routing for GSIs 0-15 is set to both
-PIC and IOAPIC; GSI 16-23 only go to the IOAPIC.
+PIC and IOAPIC; GSI 16-23 only go to the IOAPIC.  This ioctl can only be
+called before creating any vcpus.
 On arm64, a GICv2 is created. Any other GIC versions require the usage of
 KVM_CREATE_DEVICE, which also supports creating a GICv2.  Using
 KVM_CREATE_DEVICE is preferred over KVM_CREATE_IRQCHIP for GICv2.
-- 
2.52.0


