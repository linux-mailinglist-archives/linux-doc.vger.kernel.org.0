Return-Path: <linux-doc+bounces-95109-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tYk5FXaTS2pKVwEAu9opvQ
	(envelope-from <linux-doc+bounces-95109-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 13:37:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1B470FF08
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 13:37:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=h34glNGw;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95109-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95109-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40A3B305F5BF
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 09:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3598C3F482E;
	Mon,  6 Jul 2026 09:21:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D18C414A2D
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 09:20:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329662; cv=none; b=i4dLcv7IKDjU57VjcwZuACs5qPYCoXLxb3OsaIFPE77H1aBzmZ/mbE5wJzGNJTqoG4stZMeKBYh0rpUYCu430RTbdyRPoOUZS2n4YtQJiDIIwVqjSgsW0OjlT4QKKwKC2IJdXAy1EoECe0FK4yfaH0quFGMKEApCYaSTQDtyBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329662; c=relaxed/simple;
	bh=aXFcvMPJglyyPN/cp/+2729sZbTrCA3QYDjLxsa/gl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQEJH/GUKFsXezkl7YmF/j4YlAaHHo0ImkO9uzoyjmcbRqSpISWm20v5i7QemkPWb2XsmeZ5H2GdXKSWxmvzLy8OUABEcWgKfxqGi/FXc6p1ujz9ln/2Mmz9RMtWpfPmbCK6EoVKT1r0008tAr+fXqlKRYANOqalakdUkd2j+24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h34glNGw; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783329657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Ffk881gDyUgg9mQ+JlQ4lLzZ/nMxQSbsnUYykxYCb0=;
	b=h34glNGw2pGRbiVsZz5a/6JJHq3d+a1yQkpfZLB2JxWxqsc9AVCB3dPtpllBdFx+dzSEEP
	L+sF4Dz9jCDsoHtvhSwX8pP1Nem440TYYfYPC/7Q2BtU2f0c6QG2fRamfww3+eM+9gK9Mi
	hEqsCHgkaAYFd6IEOZH1eidmeqhN6Pc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-6-vpE8Ft9LOJqF2Uv59DgHgA-1; Mon,
 06 Jul 2026 05:20:52 -0400
X-MC-Unique: vpE8Ft9LOJqF2Uv59DgHgA-1
X-Mimecast-MFC-AGG-ID: vpE8Ft9LOJqF2Uv59DgHgA_1783329650
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9DD31955F1F;
	Mon,  6 Jul 2026 09:20:49 +0000 (UTC)
Received: from work.fritz.box (unknown [10.44.49.159])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ABED53000B4D;
	Mon,  6 Jul 2026 09:20:44 +0000 (UTC)
From: Tim Wiederhake <twiederh@redhat.com>
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: Tim Wiederhake <twiederh@redhat.com>
Subject: [PATCH 0/4] KVM: x86: Document and enforce APIC base memory hole
Date: Mon,  6 Jul 2026 11:20:15 +0200
Message-ID: <20260706092021.3625908-2-twiederh@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95109-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:mingo@redhat.com,m:corbet@lwn.net,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:x86@kernel.org,m:twiederh@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[twiederh@redhat.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[twiederh@redhat.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F1B470FF08

When an in-kernel irqchip is enabled on x86, KVM installs a private
memory slot at the default APIC base address (0xfee00000) during vcpu
creation.  If user space has already mapped a memory region covering
that address, vcpu creation fails with -EEXIST.  The same happens in
reverse: mapping memory over the APIC base after vcpu creation also
fails with -EEXIST.

None of this is documented, and the error is reported far from where
the actual conflict is introduced.  A VMM developer hitting this has
to trace through KVM internals to understand what went wrong.

This series documents the two undocumented constraints (irqchip before
vcpu, APIC base memory hole) and adds early checks so the error is
reported at the ioctl that actually violates the constraint.

Patches 1-2 are documentation only.  Patches 3-4 add early validation
that turns a confusing -EEXIST at vcpu creation into an explicit error
at the point where the conflict is introduced.

Tested with a reproducer that exercises all six orderings of
{irqchip, memory, vcpu} creation against both overlapping and
non-overlapping memory regions.

Tim Wiederhake (4):
  KVM: x86: Document that KVM_CREATE_IRQCHIP must precede vcpu creation
  KVM: x86: Document APIC base address constraint for in-kernel irqchip
  KVM: x86: Reject KVM_CREATE_IRQCHIP if APIC base is already mapped
  KVM: x86: Reject user memory regions covering the APIC base

 Documentation/virt/kvm/api.rst |  8 +++++++-
 arch/x86/kvm/x86.c             | 11 +++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.52.0


