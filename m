Return-Path: <linux-doc+bounces-77119-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAofFqeZn2mucwQAu9opvQ
	(envelope-from <linux-doc+bounces-77119-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 01:53:59 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0CF19FA31
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 01:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB613302E1EE
	for <lists+linux-doc@lfdr.de>; Thu, 26 Feb 2026 00:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556467081F;
	Thu, 26 Feb 2026 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xqlkl38o"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32544286A8;
	Thu, 26 Feb 2026 00:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772067232; cv=none; b=GgHMKl0j3GdIGwNPAoBie/4ZqwjFzV/jw3OUMC2v3nL5CIaYa/RY4WirWBu7HNxMwLaUu0xGGlqBLqdvB4ifE4KZzIBx46nXloAexDuGoQbzBRp4+JUWcZx3Cfsn5kKB8nPZwVNgHJ/aM5snJfJoEPR4D8WKpnNJJ3ISXhNwpiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772067232; c=relaxed/simple;
	bh=H+4ZFB56eGq4gNOwEmh7VtVx1y/BR3AOfSM4+GziBoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cUfH42IITlzxoKBzXK0qqFA/hCL+Cv1CoZ0fX69GEQUa6nvGdPuqV5G9q1Y83Edrt7oYWcIAaDcA0x9VxTVgy3tkYMYeViOji1E+xQ6nna7dWl8KmWQXjmXEmGlOntV43ZBaNX0xjzu2S8FNUfiwhX7SNFc7hUYoXHKzeEfE0pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xqlkl38o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64945C116D0;
	Thu, 26 Feb 2026 00:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772067231;
	bh=H+4ZFB56eGq4gNOwEmh7VtVx1y/BR3AOfSM4+GziBoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xqlkl38otYDSZdSJptQyN0H83BcVNsYv/0+EPC7EBKPWvPIMIWovn+bgfZftbUmjp
	 S2AWI/ciM1Ayfn+pk72wGKwm1WECAEsguLw3YxEpCFuspjPTgN6vqwXnvRsCezrKBf
	 TJHE7SWpexdjA6Ry8U6dWZe0ZTYEJTNCJm+1intc7XOyS5i3KP6MhlFwdFp7V3iazl
	 7chYT+RIJDWTG/aEvv44utQuEpCgBO+AXKPhvRtIUAhw5oUnmsZH2v2UPFFwqVJmMs
	 d/H/ccfoNMnBg+ZuoGLX3o5hpGQ1InrLkgGPKpt+2MHo9Cm6YJgt63sIBbbu3cJ1Vd
	 Br4VJZ9P2yTSw==
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
Subject: Re: [RFC PATCH v3 1/4] mm/damon/sysfs: set goal_tuner after scheme creation
Date: Wed, 25 Feb 2026 16:53:48 -0800
Message-ID: <20260226005350.7612-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CALa+Y15MQecahb-FfeQEJK2uwFdC7VxUH7GHCfSvy3uQ_jNC_A@mail.gmail.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77119-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D0CF19FA31
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 10:23:09 -0800 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> On Mon, Feb 23, 2026 at 5:40 PM SeongJae Park <sj@kernel.org> wrote:
> >
> > On Mon, 23 Feb 2026 12:32:29 +0000 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:
> >
> > > damon_new_scheme() always sets quota.goal_tuner to CONSIST (the default)
> > > regardless of what was passed in the quota struct. This caused the sysfs
> > > goal_tuner setting to be ignored.
> > >
> > > The comment in damon_new_scheme() says "quota.goals and .goal_tuner
> > > should be separately set by caller", but the sysfs code wasn't doing
> > > this. Add explicit assignment of goal_tuner after damon_new_scheme()
> > > returns to properly apply the user's setting.
> > >
> > > Without this fix, setting goal_tuner to "temporal" via sysfs has no
> > > effect - the scheme always uses the CONSIST (feed loop) tuner, causing
> > > overshoot when the goal is reached instead of immediate stop.
> >
> > Thank you for catching this, Ravi!  So, this is a fix for the RFC patch series
> > [1] that not yet merged, right?  I think this fix is better to be carried with
> > the series, and squashed into the broken commit to not introduce unnecessary
> > regression.
> >
> > So, if you don't mind, I will squash this into the sysfs-schemes part change on
> > my tree, with your Co-developed-by: tag.
> 
> Yes. Please go ahead and squash it into your series.
> 
> >
> > [1] https://lore.kernel.org/20260212062314.69961-1-sj@kernel.org
> > [2] https://lore.kernel.org/20260212062314.69961-4-sj@kernel.org
> >
> > >
> > > Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
> >
> > Reviewed-by: SeongJae Park <sj@kernel.org>
> >
> > > ---
> > >  mm/damon/sysfs-schemes.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
> > > index bbea908074bb..fe2e3b2db9e1 100644
> > > --- a/mm/damon/sysfs-schemes.c
> > > +++ b/mm/damon/sysfs-schemes.c
> > > @@ -2809,6 +2809,9 @@ static struct damos *damon_sysfs_mk_scheme(
> > >       if (!scheme)
> > >               return NULL;
> > >
> > > +     /* Set goal_tuner after damon_new_scheme() as it defaults to CONSIST */
> > > +     scheme->quota.goal_tuner = sysfs_quotas->goal_tuner;
> > > +
> > >       err = damos_sysfs_add_quota_score(sysfs_quotas->goals, &scheme->quota);
> > >       if (err) {
> > >               damon_destroy_scheme(scheme);
> >
> > To follow the order on the comment ("quota.goals and .goal_tuner should be
> > separately set by caller"), I'd prefer setting the goal_tuner after
> > damos_sysfs_add_quota_Score() call here, if you don't mind.  Let me know if you
> > prefer keeping the current order.  If not, I will just make the change when I
> > apply this to damon/next.
> >
> 
> Agreed. Please make that change when you apply it.

Thank you, I will do!


Thanks,
SJ

[...]

