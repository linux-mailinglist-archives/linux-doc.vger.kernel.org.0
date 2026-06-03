Return-Path: <linux-doc+bounces-90727-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c1rSKjgVIGpevgAAu9opvQ
	(envelope-from <linux-doc+bounces-90727-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 13:51:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AD5637393
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 13:51:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W+hdX8NL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GocJuQlG;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W+hdX8NL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GocJuQlG;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90727-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-90727-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=suse.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6B883009E17
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 11:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395133D3D12;
	Wed,  3 Jun 2026 11:45:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E93846AEEA
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 11:45:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487139; cv=none; b=XJ6KdeGP1Ecr+DxHs095m33sznxoiqw0i/HwIq3khtvTq2j+iUC1NZTBlErRVfW+e/Fozbtml/KAcFFd0dxmNChDRYO91rB2yZDw0qi7Hn1gQGOYwa0DHC/Cob72xKkm2CSG9cnfjdeMHUzwid+6P2OlBd3LSW/usU8i4/rVios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487139; c=relaxed/simple;
	bh=nUBTUt6u+VUEoJiU2XSu4LyljZz8GesU5Adl+TGl/wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JmO5qlMjKIk1Slrf/GBWsDaOs5kEWShs82nWyiIHHAHkkn34rCu7gmYWaa4y/EheT8ZKTLO8ivE3wA6/KXXCHO0Yre4Lpfz16bDr/h3D7Qnu7l3tYJ1wjRaaLJmL8UdN78eYDh4ORyPMAjHtqB4qL8feJRKnpzCY9nz1fRs3Od0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W+hdX8NL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GocJuQlG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W+hdX8NL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GocJuQlG; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 244616A800;
	Wed,  3 Jun 2026 11:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780487135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XT56QKdjWikMuY7gT9KrU+V0bhCS1pLWUGmQUob5E2A=;
	b=W+hdX8NLJfF1AvDGi6b+rjG+8tOF6R/UPBEfoRpOfPyr9BS+8Ct9B7/Rhp4NtuoNFYq8K0
	eUfmdTpVxbAAZLwBB+mhhuQwXw2OXgj3G9fzNOr1RobkvWmcUb533o/qcDXNpy5ZcKfopQ
	/0Akp5YJvE8oEbC1ZoYesOZMFM83+DU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780487135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XT56QKdjWikMuY7gT9KrU+V0bhCS1pLWUGmQUob5E2A=;
	b=GocJuQlGJ1HeSQfSH6PdqAotMxbCiFnZYU+dDVPw3OR7b5pZvrR/o2vxBM7Ug+vpp9sC9g
	xPU8gTY/1pKBmlBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780487135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XT56QKdjWikMuY7gT9KrU+V0bhCS1pLWUGmQUob5E2A=;
	b=W+hdX8NLJfF1AvDGi6b+rjG+8tOF6R/UPBEfoRpOfPyr9BS+8Ct9B7/Rhp4NtuoNFYq8K0
	eUfmdTpVxbAAZLwBB+mhhuQwXw2OXgj3G9fzNOr1RobkvWmcUb533o/qcDXNpy5ZcKfopQ
	/0Akp5YJvE8oEbC1ZoYesOZMFM83+DU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780487135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XT56QKdjWikMuY7gT9KrU+V0bhCS1pLWUGmQUob5E2A=;
	b=GocJuQlGJ1HeSQfSH6PdqAotMxbCiFnZYU+dDVPw3OR7b5pZvrR/o2vxBM7Ug+vpp9sC9g
	xPU8gTY/1pKBmlBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78C50779A7;
	Wed,  3 Jun 2026 11:45:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CdjLGt4TIGrVXQAAD6G6ig
	(envelope-from <clopez@suse.de>); Wed, 03 Jun 2026 11:45:34 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Binbin Wu <binbin.wu@linux.intel.com>
Subject: [PATCH] Documentation: KVM: Synchronize x86 VM types
Date: Wed,  3 Jun 2026 13:45:04 +0200
Message-ID: <20260603114504.814647-2-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90727-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:clopez@suse.de,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:brijesh.singh@amd.com,m:isaku.yamahata@intel.com,m:binbin.wu@linux.intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[clopez@suse.de,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clopez@suse.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.de:mid,suse.de:dkim,suse.de:from_mime,suse.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3AD5637393

KVM has reflected KVM_X86_SNP_VM to userspace since 1dfe571c12cf
("KVM: SEV: Add initial SEV-SNP support"), and KVM_X86_TDX_VM since
161d34609f9b ("KVM: TDX: Make TDX VM type supported"). Update the
documentation to reflect this fact.

Fixes: 1dfe571c12cf ("KVM: SEV: Add initial SEV-SNP support")
Fixes: 161d34609f9b ("KVM: TDX: Make TDX VM type supported")
Signed-off-by: Carlos López <clopez@suse.de>
---
 Documentation/virt/kvm/api.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 52bbbb553ce1..3ec574a41f60 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -9363,6 +9363,8 @@ means the VM type with value @n is supported.  Possible values of @n are::
   #define KVM_X86_SW_PROTECTED_VM	1
   #define KVM_X86_SEV_VM	2
   #define KVM_X86_SEV_ES_VM	3
+  #define KVM_X86_SNP_VM		4
+  #define KVM_X86_TDX_VM		5
 
 Note, KVM_X86_SW_PROTECTED_VM is currently only for development and testing.
 Do not use KVM_X86_SW_PROTECTED_VM for "real" VMs, and especially not in
-- 
2.51.0


