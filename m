Return-Path: <linux-doc+bounces-89757-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNpmFLoPF2o12wcAu9opvQ
	(envelope-from <linux-doc+bounces-89757-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 17:37:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 998CF5E6F95
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 17:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CDA63094B3B
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 15:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDD043CECD;
	Wed, 27 May 2026 15:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzNMKTnH"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4522D9EDC;
	Wed, 27 May 2026 15:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896004; cv=none; b=LuAIpVYgQKXjEDfi/laOYgDlvMiVdNMI23VkRw0Ym2zXXZL9iXiNU5KZdTkgqevT15MvhJupNTiGmDH/p3q0qaIRSM/gEZlU5CeaHY6gI6CJAwLrSXPrtEi2YpZZBLQ+qIQvDII9SEJUosgUS/8R/L7/AYk7GDG7keRTZgMGm40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896004; c=relaxed/simple;
	bh=eF5fEOWZsn5iEd6JrTeFCCBK6A3UIngZ9wzCS6q9kjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KLtRCQO4rlmK2FA/P1QLSRzF/tI/cWZ1BPsv8mMF+6MkDM8dDux4HCOz/mgH3XrXOo7DTSzIcEvqlgrbgI/6PklQLh5p1zNglZr+5OrqkMY4UP/vN3u+Xj0TKpgY8JdZgIpyutrAxIKGy7059Ej+84FVDyfTLFdXWrgpE4yNTio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzNMKTnH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B526DC2BCFA;
	Wed, 27 May 2026 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779896002;
	bh=eF5fEOWZsn5iEd6JrTeFCCBK6A3UIngZ9wzCS6q9kjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HzNMKTnH7LjMRKl96vGWtzp8Ea9tjVE6pAzMj0dRt83r8yIQ1zFguN4GOSKbadFNp
	 X2V3BjYTnEfG4XfGYNZwE8GzKCO2GfbR+QnLfhe+qIgu0omOj3Na0XjQ9KtoLOy7sA
	 dTR8VbdGjrDZfTH6Ue7Rz/0RtzfZqU6b26KCLqbKZdUFYug2x2U+X5s320dAgGfJzR
	 GgC+V2AartD7uP1VOAHvAwP9jDeAGyn84zzNh2JCFwebylEvozyLyPtiXJevW731yK
	 Gi26+gSMbzdvjHM4gkr6sL+jaSNILuds2Ulwv8Ew0vaJaHUymwSDsS7CS95h28kzb/
	 185uJlcton7/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD663CD5BD0;
	Wed, 27 May 2026 15:33:22 +0000 (UTC)
From: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Date: Wed, 27 May 2026 08:33:17 -0700
Subject: [PATCH RFC 05/12] Documentation: KVM: Explain what rule the
 exception section is meant for
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-kvm-locking-docs-v1-5-4fe8b602ff47@google.com>
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com>
In-Reply-To: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
 vannapurve@google.com, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 Ackerley Tng <ackerleytng@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779896001; l=866;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=UhewnEFTG+HebdABX6t5eYYm+bNGAkoVsLLrTGAOeg4=;
 b=H1OQEdfNpvGS7THThfrjojW6x13TvDlSiVDOrcNRwD6ECzNiF+y3cEqXlnDWAXTlLltd+N+OR
 mklc0Q4Qr+BDr5L6d/govG1pkusRLLY1/lYMOt9RtFH8pqsWyDfELTw
X-Developer-Key: i=ackerleytng@google.com; a=ed25519;
 pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Endpoint-Received: by B4 Relay for ackerleytng@google.com/20260225 with
 auth_id=649
X-Original-From: Ackerley Tng <ackerleytng@google.com>
Reply-To: ackerleytng@google.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89757-lists,linux-doc=lfdr.de,ackerleytng.google.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	HAS_REPLYTO(0.00)[ackerleytng@google.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 998CF5E6F95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ackerley Tng <ackerleytng@google.com>

The Exception section describes some exceptions but not the rule the
exception is for. Add a paragraph to clarify that detail.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 Documentation/virt/kvm/locking.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
index e349c2cb94943..5161636cec481 100644
--- a/Documentation/virt/kvm/locking.rst
+++ b/Documentation/virt/kvm/locking.rst
@@ -61,6 +61,10 @@ sections.
 2. Exception
 ------------
 
+The general rule in KVM is that any modification to shadow page tables
+(and their entries (SPTEs)) must be protected by ``kvm->mmu_lock``,
+with the exceptions described below.
+
 Fast page fault:
 
 Fast page fault is the fast path which fixes the guest page fault out of

-- 
2.54.0.823.g6e5bcc1fc9-goog



