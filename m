Return-Path: <linux-doc+bounces-94912-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P5SqBlQoSGo+nAAAu9opvQ
	(envelope-from <linux-doc+bounces-94912-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 23:23:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA5B705C35
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 23:23:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=UEnwhLQs;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94912-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94912-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 90409300B536
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 21:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79AB135E1A5;
	Fri,  3 Jul 2026 21:22:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727C13264EF;
	Fri,  3 Jul 2026 21:22:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113727; cv=none; b=szozGkU+ugW7EHeWvA0biJZ/Bno6ChuO+JRyQPSJkGJmeEl5KM4BnwL1GxDLPGytKydi5N68R3cSQkwbWSFTdZ9xU/Gs7OWjg35U4/LBsqaWef5d2VIKj/Ram44Y/xQ7Je3F6K5auWJSXvG/d6B59kj7+sK3X2+zadee31D9PJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113727; c=relaxed/simple;
	bh=vAPp2lVTYAhMhcmn20gifk0evS5pRYocrYbQuJwNGRI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHcJr7a52h+7HLPmrIL/dEs4VUjQR6829v2lv2RujAc7rSWIV8OqTDAOsWi+3NNgnQMRMwi0YMXc41AWyOVwTGO98tHHh0BlZnglCtPmG0M4zyKMIRExGxVhCjFnYgLiEM+cTXEsrizYy2UEpTDzyarsBzj6Njtb5kCRA/8n1l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UEnwhLQs; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=V5hQ2fJb27QK5yOdBL7f7A818+T1JNBNilH2QwnYDyE=; b=UEnwhLQsS2wkPtr1Pd+i9zzOxH
	sP8ejEvNPTu+HXmRA1IRK2tldo2/gJzqZvVFkblE3k6NJg2illNeTq4r1tIkNMYNlkdWFonJNHdMK
	mhSmA+bD14VOI9+r+ngRb7JB7fqCDAalnTCht1e3MXaFddIt8qbgkhuau0zS6oAateAvgrEcabeSd
	8ssD8QbBlyyz0HmKWi8dhUlItveVTjZXTUCDUvvZgduEIsDDko+7didrcRF7/U9ZjOHxshnYVg5m8
	dzZupkJUGPLn1s+4YQMYQSdzXtYuOWrxtKD6MQ0XG4ZFW1ckoKyrimh4GbzgzAMJIyiUdwJSkSu0l
	7JBF15DA==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wflKX-0000000AsYF-1TB1;
	Fri, 03 Jul 2026 21:21:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wflKX-00000001RPX-0w0H;
	Fri, 03 Jul 2026 22:21:49 +0100
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
Subject: [PATCH v6 26/36] KVM: x86/xen: Prevent runstate times from becoming negative
Date: Fri,  3 Jul 2026 22:18:05 +0100
Message-ID: <20260703212145.343527-27-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94912-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,amazon.co.uk:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CA5B705C35

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
runstate times until the KVM clock catches up with runstate_entry_time
again.

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
 arch/x86/kvm/xen.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 82e34edbfdbd..b1d67ece5db3 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -586,29 +586,45 @@ void kvm_xen_update_runstate(struct kvm_vcpu *v, int state)
 {
 	struct kvm_vcpu_xen *vx = &v->arch.xen;
 	u64 now = get_kvmclock_ns(v->kvm);
-	u64 delta_ns = now - vx->runstate_entry_time;
 	u64 run_delay = current->sched_info.run_delay;
+	s64 delta_ns = now - vx->runstate_entry_time;
+	s64 steal_ns = run_delay - vx->last_steal;
 
+	/*
+	 * If the vCPU was never run before, its prior state should
+	 * be considered RUNSTATE_offline.
+	 */
 	if (unlikely(!vx->runstate_entry_time))
 		vx->current_runstate = RUNSTATE_offline;
 
+	/*
+	 * If KVM clock went backwards, just update the current runstate
+	 * but don't account any time. Leave entry_time unchanged so the
+	 * next positive delta covers the full period once the clock
+	 * catches up. Update last_steal every time so stolen time only
+	 * reflects the interval since the most recent call.
+	 */
+	if (delta_ns < 0)
+		goto update_guest;
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
-	vx->current_runstate = state;
 	vx->runstate_entry_time = now;
 
+ update_guest:
+	vx->current_runstate = state;
+	vx->last_steal = run_delay;
 	if (vx->runstate_cache.active)
 		kvm_xen_update_runstate_guest(v, state == RUNSTATE_runnable);
 }
-- 
2.54.0


