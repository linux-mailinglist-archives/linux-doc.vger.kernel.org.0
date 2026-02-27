Return-Path: <linux-doc+bounces-77286-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENfbI8D7oGlXogQAu9opvQ
	(envelope-from <linux-doc+bounces-77286-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 03:04:48 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F831B1CC6
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 03:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C73530078A0
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 02:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1C72D1F6B;
	Fri, 27 Feb 2026 02:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMU1AWey"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C22C033C;
	Fri, 27 Feb 2026 02:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772157885; cv=none; b=h1nI4Sg7snkMeoda2t9ZJCBss+xA7taZYiAcleJcELGPfUr4k9V2u1IjeelYCNJ2tWkkTFv8DFfopMzpL6N/gcGf8iTvrKfFebbSUCnAw0j9ZdKR7Tp6+YzO+uxVeSmozfFMc5hnnG6+3zGB94+u95GViaK+wY4Uy34T/kBvuPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772157885; c=relaxed/simple;
	bh=E21v8cysKSwly9dK9dIK3fxUVDPj0v2xjJ3Mf3w+4+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQLoYSEFKDUs1yLlSa4fs2RcdVSvtSbbONqkWNjjn7ZqVlGHmnzKuuFSAElT8UsU3AdeKKrMKoxB216obq6casf6UZ9uUB8MDjbfK7Ym9XHfDQRQVj1rZ1qKVZRixJnUB5zreuCQnxcx69D9743g0seiocGhXdL8egB2atKPhY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMU1AWey; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09449C116C6;
	Fri, 27 Feb 2026 02:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772157885;
	bh=E21v8cysKSwly9dK9dIK3fxUVDPj0v2xjJ3Mf3w+4+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CMU1AWeyRFfOGqc+ZHYBu7GVyFc/gjhYGkGUKhA9pTLz0Dfh6UrfNmX7odfzJBQXY
	 x8QmvWP/ufWXiPlOUO3yTTAS3ZueAm1Kp2GUn7SwBz4yT7IUtLVftTU24Rxfzkx7rc
	 TR0YgHb1/TIaT6Fy2LBX60KAI6E7ajDSCDqO/lo1BqVKnef9R2EicaotuaTVHfenr0
	 UGK6vTqq/r5rHjlSEIfD1j9Y7TSdLqLVz4phYu7Di2B7wt2Kclo78nzbDue3avc7k2
	 GVg4P5dMUVyKkO0PVCCczZAzvkYS9O5W0YTrUsB9zJUBgZWpyPEBWL6/biXnpCn9NA
	 GbnbA77LL/hJg==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Ravi Jonnalagadda <ravis.opensrc@gmail.com>,
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
Subject: Re: [RFC PATCH v3 1/4] mm/damon/sysfs: set goal_tuner after scheme creation
Date: Thu, 26 Feb 2026 18:04:42 -0800
Message-ID: <20260227020443.91984-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226005350.7612-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77286-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,micron.com,sk.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 25F831B1CC6
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 16:53:48 -0800 SeongJae Park <sj@kernel.org> wrote:

> On Wed, 25 Feb 2026 10:23:09 -0800 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:
> 
> > On Mon, Feb 23, 2026 at 5:40 PM SeongJae Park <sj@kernel.org> wrote:
> > >
> > > On Mon, 23 Feb 2026 12:32:29 +0000 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:
> > >
> > > > damon_new_scheme() always sets quota.goal_tuner to CONSIST (the default)
> > > > regardless of what was passed in the quota struct. This caused the sysfs
> > > > goal_tuner setting to be ignored.
> > > >
> > > > The comment in damon_new_scheme() says "quota.goals and .goal_tuner
> > > > should be separately set by caller", but the sysfs code wasn't doing
> > > > this. Add explicit assignment of goal_tuner after damon_new_scheme()
> > > > returns to properly apply the user's setting.
> > > >
> > > > Without this fix, setting goal_tuner to "temporal" via sysfs has no
> > > > effect - the scheme always uses the CONSIST (feed loop) tuner, causing
> > > > overshoot when the goal is reached instead of immediate stop.
> > >
> > > Thank you for catching this, Ravi!  So, this is a fix for the RFC patch series
> > > [1] that not yet merged, right?  I think this fix is better to be carried with
> > > the series, and squashed into the broken commit to not introduce unnecessary
> > > regression.
> > >
> > > So, if you don't mind, I will squash this into the sysfs-schemes part change on
> > > my tree, with your Co-developed-by: tag.
> > 
> > Yes. Please go ahead and squash it into your series.
> > 
> > >
> > > [1] https://lore.kernel.org/20260212062314.69961-1-sj@kernel.org
> > > [2] https://lore.kernel.org/20260212062314.69961-4-sj@kernel.org
> > >
> > > >
> > > > Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
> > >
> > > Reviewed-by: SeongJae Park <sj@kernel.org>
> > >
> > > > ---
> > > >  mm/damon/sysfs-schemes.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
> > > > index bbea908074bb..fe2e3b2db9e1 100644
> > > > --- a/mm/damon/sysfs-schemes.c
> > > > +++ b/mm/damon/sysfs-schemes.c
> > > > @@ -2809,6 +2809,9 @@ static struct damos *damon_sysfs_mk_scheme(
> > > >       if (!scheme)
> > > >               return NULL;
> > > >
> > > > +     /* Set goal_tuner after damon_new_scheme() as it defaults to CONSIST */
> > > > +     scheme->quota.goal_tuner = sysfs_quotas->goal_tuner;
> > > > +
> > > >       err = damos_sysfs_add_quota_score(sysfs_quotas->goals, &scheme->quota);
> > > >       if (err) {
> > > >               damon_destroy_scheme(scheme);
> > >
> > > To follow the order on the comment ("quota.goals and .goal_tuner should be
> > > separately set by caller"), I'd prefer setting the goal_tuner after
> > > damos_sysfs_add_quota_Score() call here, if you don't mind.  Let me know if you
> > > prefer keeping the current order.  If not, I will just make the change when I
> > > apply this to damon/next.
> > >
> > 
> > Agreed. Please make that change when you apply it.
> 
> Thank you, I will do!

I now think it is better to just remove the damon_new_scheme() internal
initialization.  I added the detail [1] to the original thread.  I'll keep your
Co-developed-by: tag with the new fix though, unless you mind.  Let's keep
discussing there if you have more opinions.

[1] https://lore.kernel.org/20260227015613.91346-1-sj@kernel.org


Thanks,
SJ

[...]

