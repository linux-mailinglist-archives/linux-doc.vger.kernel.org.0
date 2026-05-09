Return-Path: <linux-doc+bounces-86649-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGeMNeO6/2nl9wAAu9opvQ
	(envelope-from <linux-doc+bounces-86649-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 00:53:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C92501DBA
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 00:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E73230595BD
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 22:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6B83DEFEB;
	Sat,  9 May 2026 22:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="torvBl2I"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA293D0905;
	Sat,  9 May 2026 22:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778366933; cv=none; b=FA/F7c0o37tEBL8k1wtL+M7fcqKfIECUB9INXekOsfc4hQU/Zw418d3OABSZ6XigZXB/QAe5xovlckSFwLI3ok++uJ0sIVhCPVnj/p4OQjInsKa+AKrDbg2Z97hkIWXH2jFyQUFbH+tZtvGRDyphWfIJPZCCxmPVq1k6gI//fqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778366933; c=relaxed/simple;
	bh=y5XHubKRijH+0QFFBVk2nnYjfubeV0gDmwE9H1D2510=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHUjlSG54jB/rEUF+Ram7kraW9u7DEz+JSEJt7XKnxhwaW6Qx2UV9ljJIf5NhM7tUDmVFuDTzIqi9b8iNGdxGNEsmJL6WVlm+IHSX5IyTRM3AQhK5s1AuCro1fLJAhC05mBc9NbVOAJEXdASpRGpmEw3CgYxE5XGT1FqPLKFg84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=torvBl2I; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=cVUBIMjJ1XQ+25DjUmKRxKTuLcXblZ+qoogoFwNKcIc=; b=torvBl2IxVi6KiT3kAGIroWI4I
	UHAsuTdRPh4qRitOygfigQ1bAbUUG7McF3OzIG9i9a0E5Fdpf7W2dxYsdi2T+3Da7wSe5wrhAU0Hu
	UXTwlv8WaP3QzacDy4C4jM3KVH7+Pp5XHWGBU/9KK0WTB73LlGyLWuyHeZv0hc5Kyz465wyPP1mlc
	lhDLx6WzRZ83hVWzBaedx016ZIz5E3feT+mmNponeRyijVADq9F52nSgTNfk9oNhSl0O0YtolH7OG
	473u+7Q9XkH2jKKZnfrEAA5BnEuleCjxcuQLdk9/M+yQswQjTCyZ3FIwzZHbaOwIrPfMtA7EknKKU
	2zPWQIJA==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLqTD-000000060LL-20sT;
	Sat, 09 May 2026 22:48:30 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wLqTD-0000000DhIr-0oMS;
	Sat, 09 May 2026 23:48:27 +0100
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
Subject: [PATCH v4 25/30] KVM: x86/xen: Prevent runstate times from becoming negative
Date: Sat,  9 May 2026 23:46:51 +0100
Message-ID: <20260509224824.3264567-26-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260509224824.3264567-1-dwmw2@infradead.org>
References: <20260509224824.3264567-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rspamd-Queue-Id: 32C92501DBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86649-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[infradead.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amazon.co.uk:email,infradead.org:mid,infradead.org:dkim,xen.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: David Woodhouse <dwmw@amazon.co.uk>

When kvm_xen_update_runstate() is invoked to set a vCPU's runstate, the
time spent in the previous runstate is accounted. This is based on the
delta between the current KVM clock time, and the previous value stored
in vcpu->arch.xen.runstate_entry_time.

If the KVM clock goes backwards, that delta will be negative. Or, since
it's an unsigned 64-bit integer, very *large*. Linux guests deal with
that particularly badly, reporting 100% steal time for ever more (well,
for *centuries* at least, until the delta has been consumed).

So when a negative delta is detected, just refrain from updating the
runstates until the KVM clock catches up with runstate_entry_time again.

Also clamp steal_ns to delta_ns to prevent steal time from exceeding
the total elapsed time, and handle negative steal_ns (which can happen
if run_delay goes backwards across a scheduler update).

The userspace APIs for setting the runstate times do not allow them to
be set past the current KVM clock, but userspace can still adjust the
KVM clock *after* setting the runstate times, which would cause this
situation to occur.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 arch/x86/kvm/xen.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 82e34edbfdbd..fef52b8ea26a 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -586,24 +586,33 @@ void kvm_xen_update_runstate(struct kvm_vcpu *v, int state)
 {
 	struct kvm_vcpu_xen *vx = &v->arch.xen;
 	u64 now = get_kvmclock_ns(v->kvm);
-	u64 delta_ns = now - vx->runstate_entry_time;
 	u64 run_delay = current->sched_info.run_delay;
+	s64 delta_ns = now - vx->runstate_entry_time;
+	s64 steal_ns = run_delay - vx->last_steal;
 
 	if (unlikely(!vx->runstate_entry_time))
 		vx->current_runstate = RUNSTATE_offline;
 
+	vx->last_steal = run_delay;
+
+	/*
+	 * If KVM clock time went backwards, stop updating until it
+	 * catches up (or the runstates are reset by userspace).
+	 */
+	if (delta_ns < 0)
+		return;
+
 	/*
 	 * Time waiting for the scheduler isn't "stolen" if the
 	 * vCPU wasn't running anyway.
 	 */
-	if (vx->current_runstate == RUNSTATE_running) {
-		u64 steal_ns = run_delay - vx->last_steal;
+	if (vx->current_runstate == RUNSTATE_running && steal_ns > 0) {
+		if (steal_ns > delta_ns)
+			steal_ns = delta_ns;
 
 		delta_ns -= steal_ns;
-
 		vx->runstate_times[RUNSTATE_runnable] += steal_ns;
 	}
-	vx->last_steal = run_delay;
 
 	vx->runstate_times[vx->current_runstate] += delta_ns;
 	vx->current_runstate = state;
-- 
2.51.0


