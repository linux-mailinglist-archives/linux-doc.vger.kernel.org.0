Return-Path: <linux-doc+bounces-93671-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5BkdG71HPmowCgkAu9opvQ
	(envelope-from <linux-doc+bounces-93671-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 11:34:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C84C6CBBB3
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 11:34:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=rgAv5xJA;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93671-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93671-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F392300620F
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 09:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323802D7393;
	Fri, 26 Jun 2026 09:34:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC32423C4FF;
	Fri, 26 Jun 2026 09:34:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466488; cv=none; b=e5s2eWvm+y6fF89L35LYfd1OJhja+JE091vtoZlQr87lOAEuQ1RewVi7JvfGumjrGjmPUupB6b656RGmqnpyCLinkOujO0XMbtq621uOS91D13yoaM6pwAe91ANtCBGL+am347swsXTZk2v554ma2o0WLTlpM2wcZzCQna6GI58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466488; c=relaxed/simple;
	bh=krZHw5SfK5w0H+RYzPwaMiAXDM+GY4v8+acbYdZWd8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsBe4alxRgbOZvZlsH4jBEFbEPJjqnPUimnfDlzbxeX3MXfN5p9ICkxx1SO3HwJJ1WLt56RSISuyQrlmrCwN+bGAW6M/i468IgEUQUtB783iLttFsSu5GPRLPGoEf/bHZ0+Y/ZfK2vJpcORbC4S/82R0oOukGFaM9BGW070c7Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rgAv5xJA; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8x0Ht+AgzN/+Z1jXgD/X2IuKYOvaDDgoJ0Syoi7rtDw=; b=rgAv5xJAYJFln/8iTUeNrRpcuN
	DnMeOkpUoF89lsz8VO3DcHNB9WBYKjcMMkZR9LEmjeA7LruYHb7KOAm+Mlnpc/sX1gz0tLIT7zBQB
	KqwpVejwTLL+tvrr840JT8xe/D4z303MfISvxdyQzKHpRhFCBLaSD5Jcwc54pvFqGocqm5T1Spmk4
	3LFlzQtGmEe9S64FmMGozmGHSg9YMEUO45abhjg6SGnJKnipM0XIIdVIH30zHYGxKdwJN00+M/cRg
	F19BR0RdPiW7qzBfdLoYQZaqv3zpciuq9B9WpYy4vmfeWA9hb30mFDW98P8YLN1grHr52mfTuViEZ
	bEPGVIAQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2ww-0000000Ba7Y-1lw1;
	Fri, 26 Jun 2026 09:34:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 65455300BDE; Fri, 26 Jun 2026 11:34:14 +0200 (CEST)
Date: Fri, 26 Jun 2026 11:34:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, yury.norov@gmail.com,
	kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net,
	tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
	seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
	rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
	srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
	vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
	pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 04/24] cpumask: Introduce cpu_preferred_mask
Message-ID: <20260626093414.GM1181229@noisy.programming.kicks-ass.net>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-5-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625124648.802832-5-sshegde@linux.ibm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93671-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:mingo@kernel.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:yury.norov@gmail.com,m:kprateek.nayak@amd.com,m:iii@linux.ibm.com,m:corbet@lwn.net,m:tglx@kernel.org,m:gregkh@linuxfoundation.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:vschneid@redhat.com,m:huschle@linux.ibm.com,m:rostedt@goodmis.org,m:dietmar.eggemann@arm.com,m:maddy@linux.ibm.com,m:srikar@linux.ibm.com,m:hdanton@sina.com,m:chleroy@kernel.org,m:vineeth@bitbyteword.org,m:frederic@kernel.org,m:arighi@nvidia.com,m:pauld@redhat.com,m:christian.loehle@arm.com,m:tj@kernel.org,m:tommaso.cucinotta@gmail.com,m:maz@kernel.org,m:rafael@kernel.org,m:rdunlap@infradead.org,m:kernellwp@gmail.com,m:linux-doc@vger.kernel.org,m:yurynorov@gmail.com,m:tommasocucinotta@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[peterz@infradead.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,redhat.com,linaro.org,gmail.com,amd.com,linux.ibm.com,lwn.net,linuxfoundation.org,google.com,goodmis.org,arm.com,sina.com,bitbyteword.org,nvidia.com,infradead.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,noisy.programming.kicks-ass.net:mid,infradead.org:dkim,infradead.org:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C84C6CBBB3

On Thu, Jun 25, 2026 at 06:16:28PM +0530, Shrikanth Hegde wrote:
> This patch does
> - Declare and Define cpu_preferred_mask.
> - Get/Set helpers for it.

There is a blub in submitting-patches.rst about how 'this patch' is
basically a red-flag for a changelog.

The changelog is per-definition pertaining to 'this patch', therefore
stating this is a tautology. Further, it is often fairly clear what the
patch does, but less clear as to why.

So the suggestion is to phrase this like:

Provide cpu_preferred_mask infrastructure (definitions, declarations and
helper methods) to facilitate ....


> Values are set/clear by the scheduler by detecting the steal time values.
> 
> A CPU is set to preferred when it becomes active. Later it may be
> marked as non-preferred depending on steal time values with
> steal monitor being enabled.
> 
> Always maintain design construct of preferred is subset of active.
> i.e. preferred ⊆ active ⊆ online ⊆ present ⊆ possible
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>

