Return-Path: <linux-doc+bounces-88323-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK41HAixC2q2LAUAu9opvQ
	(envelope-from <linux-doc+bounces-88323-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 02:38:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B741575997
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 02:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A62CD3008D17
	for <lists+linux-doc@lfdr.de>; Tue, 19 May 2026 00:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950C423F417;
	Tue, 19 May 2026 00:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqAq29rG"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729DD155757;
	Tue, 19 May 2026 00:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151106; cv=none; b=cuNCoSdKo+3Pz8uaqStN6lz0AKiFFn3veIQJMM0eIdRpzoYLn8w+sruX7gqu/sBL1Obrm8fMxs3na9lceyqxW5Zb1ji9SCEyga+2imb6ETHJ3XXUeICDVJva1dZ/ZU6M9evIVUSaMhZUXcJNl/0AIchfSQNpBN4IfjK31n2rF5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151106; c=relaxed/simple;
	bh=dLXATdWeDSOf90S8HMR8NRXCMaR+PI2JbsB1ZSuiKQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QlgEQW8TZXZq7sSEIwvIORnvQP4CIoHnMnmvUBKzsUdN/fTWXYBHu6/9wvpxORxcRBrCIk1DTH5azySxwQdhbSw/hwshaOF3rVr3SIE/9Rclhc8pwblSCPkHmXNvFutZNrloFpCNV27K+3CXPSknbfL92QhOBo4x5hDhPnK+W14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqAq29rG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9515CC2BCB7;
	Tue, 19 May 2026 00:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779151106;
	bh=dLXATdWeDSOf90S8HMR8NRXCMaR+PI2JbsB1ZSuiKQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sqAq29rGfrXDj64i1THzbhpWcgmaVJOwLO9wc/4a8BCKsDImTd4wp5jCszDqZ+weH
	 cEIKFmCQjenJQPRhLk3MQ9/QZkk5AE6SaJ8FY4qTgp6pszrgwApBGd4XJ4Ose5YnsP
	 Kmt9I16Bv2sAn+I4esI4WBDSVfUq2FwQGNodak6o1e1BO99E1fwoNr6TLj5eE07UDe
	 iSUjYL1fhoBcFxZnI3VPgUbciizHm4vBLWI4qmn+PW31pukvDt4cTUq2eWH1TwGyrA
	 zSrCwzjgIhyztmmXP2fX/Guv7kTrG9eOYXxVx8F4ByLjUJzRNftBgqOdzjYpNz4vyU
	 be3unufwToIVw==
From: SeongJae Park <sj@kernel.org>
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com
Subject: Re: [RFC PATCH 2/5] mm/damon/core: cap effective quota size to total monitored memory
Date: Mon, 18 May 2026 17:38:16 -0700
Message-ID: <20260519003818.99779-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CALa+Y14PXA_anNdvJCzx4RfKoKj6hNmEG39KUvMALtOBznprkw@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-88323-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5B741575997
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 17 May 2026 22:22:34 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> On Sun, May 17, 2026 at 11:37 AM SeongJae Park <sj@kernel.org> wrote:
> >
> > Hello Ravi,
> >
> > On Sat, 16 May 2026 14:03:54 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:
> >
> > > The DAMOS quota goal tuner can compute an effective size (esz) larger
> > > than the total monitored memory because it integrates over cumulative
> > > deltas without bounding by the actual workload size.  Once esz exceeds
> > > total monitored memory, the per-tick "remaining quota" arithmetic
> > > stops being meaningful: any scheme can apply to the entire monitored
> > > space and "remaining" stays positive indefinitely.
> >
> > Nice finding!
> >
> > >
> > > Cap esz to the total size of all currently monitored regions as a
> > > final bound after all other quota calculations.  Add
> > > damon_ctx_total_monitored_sz() helper that sums region sizes across
> > > all targets.
> >
> > You could also make an arbitrary cap by setting the static size quota.  That
> > is, if there are not only quota goal but also the size quota and/or time quota,
> > and the different types of quotas disagree about the real quota, DAMOS uses
> > smallest quota.  You could read damos_set_effective_quota() code and kernel-doc
> > comment of 'struct damos_quota' for more details.
> >
> > So you could apply the total monitoring region size cap by setting the size
> > quota of the total monitoring region size.  Could that work for you?
> >
> > Adding the total monitoring region size cap makes sense to me, and I think that
> > will make user experience better.  But, if the size quota based cap works, that
> > could also be handled on user space in an easier and even a betetr way.  If so,
> > I'd prefer the direction, to reduce kernel code complexity.  What do you think?
> 
> Hello SJ,
> 
> Agreed.  quota->sz combined with the smallest-quota-wins rule in
> damos_set_effective_quota does express this cap from userspace
> without kernel changes, and keeping the kernel side clean is the
> right call.
> 
> If the UX argument carries weight later, I'm happy to respin v2
> with sashiko fixes addressed.

Makes sense.  I find no change on the weight for now.  If someone else
including myself or you in the future claims again, we could revisit.


Thanks,
SJ

[...]

