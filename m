Return-Path: <linux-doc+bounces-95710-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8AOIAi5TTmr7KgIAu9opvQ
	(envelope-from <linux-doc+bounces-95710-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 15:39:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581C726E05
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 15:39:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=H8w2Wv3j;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95710-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95710-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F875300F27B
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 13:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2307537DEA9;
	Wed,  8 Jul 2026 13:39:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ADD37E2FB
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 13:39:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517959; cv=none; b=uCxykiR9JnMyI/J3ZaN7yTIzH8SVhtSITOxO5zGK0n3bXpWshhsEQFnD5r2r+PBvoC6GYWC7EQNl68QOThIL2oBwNc0F/5Sos3DgjFwhJBU+8gZ+3VNAsV01UDO66mTDnpHI7L04ZuXzp2+P6RioWEZV1WQj9eVmvFyTFIzFrT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517959; c=relaxed/simple;
	bh=/0g+Y4wPFerm9mXGe154aQarap2+uauds1ZHfE+SLQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UxC/BpdBiVCqEG3vQ+2/RjRFAOietFrvetr2VjE4jMK6F1wSPeKo+iymjmGNXWfDc/pUPtf+4eYiFh6/Xt8XNO4FBeFnQLcfjO4RQqS+cOWrxg/apfIwcSfPk9aJN8NZFcwUuMCury3zRpsb91FW1QauwmzxicEuSGGzFVJPbjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H8w2Wv3j; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783517956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ECVWxNUMUUQjHTObpd3YI7AQD/uZ8AjllXMw0PpKKdE=;
	b=H8w2Wv3jgzVvf6oG1iZ2uwA9Z0JwJ2IPFTDo/jcgrwSvKPjId+t1WndwteUH5EZ1C6t7tL
	hDcSbUGC610PBY67LLB3MCz+mJJACd6DiHua8hbvpJefFfmfp1YRYzGiDans+tRUKan5RZ
	EEeu5MgSBPR5zV2a0fXa2XQGAyzadU4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-VvKfb93-PWWDpygkYNfy2Q-1; Wed,
 08 Jul 2026 09:39:13 -0400
X-MC-Unique: VvKfb93-PWWDpygkYNfy2Q-1
X-Mimecast-MFC-AGG-ID: VvKfb93-PWWDpygkYNfy2Q_1783517951
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ED33018005B1;
	Wed,  8 Jul 2026 13:39:10 +0000 (UTC)
Received: from work.fritz.box (unknown [10.44.49.159])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 71BA03000C13;
	Wed,  8 Jul 2026 13:39:08 +0000 (UTC)
From: Tim Wiederhake <twiederh@redhat.com>
To: Sean Christopherson <seanjc@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Tim Wiederhake <twiederh@redhat.com>
Subject: [PATCH v2 0/2] KVM: x86: Document APIC base memory hole constraint
Date: Wed,  8 Jul 2026 15:38:53 +0200
Message-ID: <20260708133856.302151-1-twiederh@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:corbet@lwn.net,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pbonzini@redhat.com,m:skhan@linuxfoundation.org,m:twiederh@redhat.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95710-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[twiederh@redhat.com,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 3581C726E05

When virtual APIC access acceleration is enabled on x86 (APICv on
Intel, AVIC on AMD), vcpu creation installs a private memory slot at
the default APIC base address (0xfee00000).  If user space maps a
memory region covering that address, vcpu creation fails with -EEXIST.
This is not documented and very puzzling when it happens.

This series documents two undocumented constraints:

  1/2  KVM_CREATE_IRQCHIP must precede vcpu creation
  2/2  APIC base address memory hole when APIC acceleration is enabled

Thanks to Sean Christopherson for the thorough review of v1.

Changes since v1:
  - Dropped enforcement patches (3/4, 4/4) per review feedback.
  - Patch 1/2: Reworded to avoid implying that KVM_CREATE_IRQCHIP is
    mandatory.
  - Patch 2/2: Reworded to reflect that the APIC access page is not
    installed in every case. Added note about KVM_CAP_SPLIT_IRQCHIP
    having the same constraint.

v1: https://lore.kernel.org/kvm/20260706092021.3625908-2-twiederh@redhat.com/

Tim Wiederhake (2):
  KVM: x86: Document that KVM_CREATE_IRQCHIP must precede vcpu creation
  KVM: x86: Document APIC base address constraint for in-kernel irqchip

 Documentation/virt/kvm/api.rst | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

-- 
2.52.0


