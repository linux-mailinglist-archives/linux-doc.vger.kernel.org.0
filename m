Return-Path: <linux-doc+bounces-91407-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hXdFJ2fgJmrZmAIAu9opvQ
	(envelope-from <linux-doc+bounces-91407-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 17:31:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAD4658173
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 17:31:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=Tp+yi1Wz;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91407-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91407-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A902833E1800
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 15:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742BF3F0AA6;
	Mon,  8 Jun 2026 14:55:16 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14693F0767;
	Mon,  8 Jun 2026 14:55:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930516; cv=none; b=HYryWlqIV1DTTcRP+NIWiDed10BYJNjnd5pCp8K66gEioyMQqmKNdEyNnsP5g0zw6P0tDejBNNSQJflXlSWJLivpkQrQItlcaC478VR0m8yLjnjaE7ovUcKTTzv22r1xgGj8HVUKXIYQl+H4H8rzXoFPCUjM18Pu8QzDKDb2ICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930516; c=relaxed/simple;
	bh=3HGCHUA2PyJ2aulk/W2TeWQ178nvRCGBukPfIltJmzE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X96IUIxYQfy3XREdfBNqqF8Y9sLl8YcrCy0P2M4H7I7MTm2XgehI+LmeGRzaB+A/2oOY/L1mq7F0x5HXVhoDCfXucl2qQDGKU+TxAHmGgCFP7LcraC/q1rWy9VxGh7itvdZufy5Jczp2rd06X/pn5UgIqeGQo7QjQL/jMdGC6TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Tp+yi1Wz; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=/6X9NkkXJGBiIJZgksWE6pM8oGLkNoBdJss2eJyo+jo=; b=Tp+yi1Wz3jymBuLeW82uMZjkkH
	mfqyw7ZDqC/8GrxtdY31F4JRU7e64yb4mB12cJAMtCttaRAuGjqefJGL28TwWLMkXP5k0NW0xrRRq
	s80I4Gz0M1yRY6f45AXMEBasj8k2qWYOYhg8TKDw0ImF6oIV131Xba564m6wHw6Sl8NQvlVSZwcU0
	nloZja3Puek11Uc2jm7xj3EXGyokyIKzEwLvYm7whYJ0X4fk46wZlxuZ2r4CX5IL+X2BGHTRsjDzm
	c0zz+zTVRjCTvhiC74DHbmZp7dEt5jz39JMAgwVzsoeuHYOWFvURgNKcrrCBOUhL+g3O1pMTyRuqO
	mxY/IyLw==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbNR-0000000DtxB-31cT;
	Mon, 08 Jun 2026 14:54:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbNR-00000000NF2-3o2K;
	Mon, 08 Jun 2026 15:54:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Jack Allister <jalliste@amazon.com>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	joe.jin@oracle.com,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 11/34] KVM: x86: Restructure get_kvmclock()
Date: Mon,  8 Jun 2026 15:47:52 +0100
Message-ID: <20260608145455.89187-12-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91407-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amazon.co.uk:email,infradead.org:dkim,infradead.org:mid,infradead.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CAD4658173

From: David Woodhouse <dwmw@amazon.co.uk>

Move get/put_cpu inside the use_master_clock branch since they are only
needed there (for RDTSC and get_cpu_tsc_khz() to be on the same CPU).

Simplify the use_master_clock condition: the open-coded CONSTANT_TSC ||
cpu_tsc_khz check is unnecessary since use_master_clock can only be true
when the TSC is usable.

Wrap the entire use_master_clock block in #ifdef CONFIG_X86_64, since
use_master_clock is never true on 32-bit (host_tsc_clocksource is only
set under CONFIG_X86_64).

When the clock read fails (e.g. clocksource transitioning away from
TSC), fall back to the non-master-clock path (get_kvmclock_base_ns)
rather than proceeding with uninitialised data or spinning in the
seqcount loop.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index fce898811fe7..6983a7494fcd 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3209,21 +3209,30 @@ static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 	do {
 		seq = read_seqcount_begin(&ka->pvclock_sc);
 
-		/* both __this_cpu_read() and rdtsc() should be on the same cpu */
-		get_cpu();
-
 		data->flags = 0;
-		if (ka->use_master_clock &&
-		    (static_cpu_has(X86_FEATURE_CONSTANT_TSC) || __this_cpu_read(cpu_tsc_khz))) {
 #ifdef CONFIG_X86_64
+		if (ka->use_master_clock) {
 			struct timespec64 ts;
 
+			/*
+			 * The RDTSC and get_cpu_tsc_khz() must happen on
+			 * the same CPU.
+			 */
+			get_cpu();
+
 			if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
 				data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
 				data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
-			} else
-#endif
-			data->host_tsc = rdtsc();
+			} else {
+				/*
+				 * Clock read failed (e.g. clocksource is
+				 * transitioning away from TSC). Fall back to
+				 * the non-master-clock path rather than
+				 * spinning.
+				 */
+				put_cpu();
+				goto fallback;
+			}
 
 			data->flags |= KVM_CLOCK_TSC_STABLE;
 			hv_clock.tsc_timestamp = ka->master_cycle_now;
@@ -3232,11 +3241,14 @@ static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 					   &hv_clock.tsc_shift,
 					   &hv_clock.tsc_to_system_mul);
 			data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
-		} else {
+
+			put_cpu();
+		} else
+#endif
+		{
+fallback:
 			data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
 		}
-
-		put_cpu();
 	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
 }
 
-- 
2.54.0


