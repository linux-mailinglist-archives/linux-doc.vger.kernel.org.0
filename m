Return-Path: <linux-doc+bounces-94516-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LV28JDkPRmpsIgsAu9opvQ
	(envelope-from <linux-doc+bounces-94516-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 09:11:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EB56F40AD
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 09:11:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NP2HRIfh;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94516-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94516-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B35EE301DC16
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 07:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86B538F633;
	Thu,  2 Jul 2026 07:10:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87B235AC05;
	Thu,  2 Jul 2026 07:10:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976222; cv=none; b=BuROTnsxQ97wpA4EZucOdU9RUIFo3BzK/pg8MtGwv289OrFho05UqkB5mWedFR5+t0b79LW0gD1hs6c0j/1ft/nuvg09b2htL0f7OKKjHiQOxHjKYgf7Vw+FgSPiSPhFQjp2+v7+owt3ds+o1YpGS26kZBSwie+tgGJ8mT/Deig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976222; c=relaxed/simple;
	bh=H9cq9J5I8RvjTPqKTf2Vp4uM1bdZNjeM1J2TD8ipjA0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=T7eQBsrTzJEOT/5GRS+dW63H/1EloHVwTx4kNw+2WcjuJh1JNH0QafXD+W5fErL24qi0wrvoyirKeH41ZJd4ejphOPy37izv1RWkE6Xrr6X25OVtBKUcirEF8Yet/Kp3Xv/hoGVsOap07lTifx0WzDFqlUf/lh7816eIIpopvSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NP2HRIfh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18C01F000E9;
	Thu,  2 Jul 2026 07:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782976221;
	bh=D2pLGCnroQX1sNIDMvrdZct3pgdsYE/qusEBuWw4wXY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=NP2HRIfhGpPQrKmtYV54zRGjXYHqTo4PUrTxTZ7xn9ZiApjhFSysKDY7ERLwyJpU/
	 XDhmzYaavbdwb3fzVvhKivlTTI57I2CzSuIbir9S+fdWTl9eSji/o4lmFngUSLEdUz
	 dSrser7sZO4My5yZWdUi0PMFFq0v8z5KfAV6842m035e8QBsCJsw6t/Mw7Tfni+J5V
	 dD5oxd7m9TW5doPrJ66WwVrTC+OYH3wyPxDi9YvRlBNPag1OWgIpjQbPL8WnMBywOE
	 iU42cTxhBGd3q5Amab7x1uOGvqZatv47S5D7qVU47JyovIzekFFIXRCYy4aGGWOBQ1
	 qlPUZ0taRk6DA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
From: Christian Brauner <brauner@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, 
 David Hildenbrand <david@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, workflows@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org
In-Reply-To: <70c1d2eb-a1ae-441c-91d4-1c5113b131aa@sirena.org.uk>
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
 <70c1d2eb-a1ae-441c-91d4-1c5113b131aa@sirena.org.uk>
Date: Thu, 02 Jul 2026 09:10:16 +0200
Message-Id: <20260702-ehebruch-dromedar-anbiedern-1116154f96dc@brauner>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=682; i=brauner@kernel.org;
 h=from:subject:message-id; bh=H9cq9J5I8RvjTPqKTf2Vp4uM1bdZNjeM1J2TD8ipjA0=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWS58d26dzWjTP7g4otckgsUbtRJhx5f/u2Hc9D1iSJvS
 1+67/ML6ihlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZhI7nqGX0yxktF7X1tpP3h0
 SuTq0ztfM6ZpyT44d+BeYXGYUflCwU6G/75HYr97bW3tmvPzwdOeTEfz6Svcvpe9VjffGsGf7/n
 7GC8A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:david@kernel.org,m:jlayton@kernel.org,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[brauner@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94516-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brauner@kernel.org,linux-doc@vger.kernel.org];
	URIBL_MULTI_FAIL(0.00)[brauner:server fail,vger.kernel.org:server fail,tor.lore.kernel.org:server fail];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1EB56F40AD

On 2026-07-01 17:08 +0100, Mark Brown wrote:
> On Wed, Jul 01, 2026 at 05:54:48PM +0200, Christian Brauner wrote:
> 
> > And it reamins unclear to me what exactly we do get out of this detailed
> > information: Do we want to run statistical analysis on what agent and
> > model is used the most and publish that on LWN at some point?
> 
> IIRC it was literally this, have people mention which tools they used so
> we can use that to inform our assessment of the patches.  I'm not sure

Forgive my candor but I think that is just useless for us. It's
certainly useful for AI company statistics. If we want to provide that
service I would recommend we start charging. ;)


