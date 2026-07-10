Return-Path: <linux-doc+bounces-96256-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yZ//H9/vUGoS8wIAu9opvQ
	(envelope-from <linux-doc+bounces-96256-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 15:13:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1664273B1F5
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 15:13:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=oss.cyber.gouv.fr header.s=default header.b=BcaUZ6aS;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=oss.cyber.gouv.fr (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96256-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96256-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B3F0300FEF0
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 13:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA299426EDE;
	Fri, 10 Jul 2026 13:09:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from oss.cyber.gouv.fr (oss.cyber.gouv.fr [51.159.188.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9237131D372;
	Fri, 10 Jul 2026 13:09:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688994; cv=none; b=pcSrdV6PCuRb0WfWH7zCWzVZ0gukbBUj4gXHBCFTq71VsMwD8xdagPedA5OFEwLAJnDvDlq3W52mcLTTqYV+Cm9xqBZwt+g8o/x2zNLMRtEXt1aRiV0cT0DQP/0aNOLjKRrhdqkHWjtiYfr+mDA2+ndamFWpUAJWeAN6gTFITX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688994; c=relaxed/simple;
	bh=LpDSSjIZj3yLjNQ0NCsdZm2XmzUKx3Za503MNzCOYiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkpCqK3Nkctzt6Vs7n2dl+F4b2iuMbRsVcSX+ZdUE0b1EhsQlw4de6oA0f37Tl02JrbfOUysyGal1lEQwBzkZ0yh90njD70L02rth2k2QjkM+0fSPSEO/BJfudxeM3mpMjLw/fxCYeqvN41Nqyz3chjJc+Djyq5bSdTFnefYFJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cyber.gouv.fr; spf=pass smtp.mailfrom=oss.cyber.gouv.fr; dkim=pass (2048-bit key) header.d=oss.cyber.gouv.fr header.i=@oss.cyber.gouv.fr header.b=BcaUZ6aS; arc=none smtp.client-ip=51.159.188.251
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oss.cyber.gouv.fr; s=default; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YNmqdOXHC9bVvxEhK3ClkhyZS4A77BRnu2okgiPeqMo=; b=BcaUZ6aSM1SNiBqGrg6jCSEJ4F
	OsLZgsHa4E063AAA1q1LrXAUXOHcUqj1E6pJYKhe9ZJEKTzYnnf3izCLC8b7z51gvhWzrS8ZOqXWI
	HY1UPxZnlTVNgGYkNaHLKYNdDwy+R33IpBb80OlhALWCFMXGIEL9epgXqqqT5LYbbMBUAiPqqdhGE
	uO21fU+TzArwFixoOkBweRSpJ+Sv+kePQClWgJWGzioBW8c6n95r2rYtpIMtywyx3M7C+KQChor3l
	s4puZOih3nJSSKSvykeV5vtQI9OOlI6j7fpv9v3DGZ+31ZgmK1PK+24UbhSmNTGa6hIROxKxWam8s
	Tywpbphw==;
Received: from laubervilliers-658-1-215-187.w90-63.abo.wanadoo.fr ([90.63.246.187]:56274 helo=archlinux)
	by pf-012.whm.fr-par.scw.cloud with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <nicolas.bouchinet@oss.cyber.gouv.fr>)
	id 1wiAzD-00000004kUd-3Nbz;
	Fri, 10 Jul 2026 15:09:45 +0200
Date: Fri, 10 Jul 2026 13:09:42 +0000
From: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>
To: Sean Rhodes <sean@starlabs.systems>
Cc: rafael@kernel.org, lenb@kernel.org, pavel@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, 
	xiujianfeng@huawei.com, keescook@chromium.org, linux-pm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "mjg59@srcf.ucam.org" <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] PM: hibernate: Allow hibernation opt-in when locked down
Message-ID: <alDt32nsEOMb5UmI@archlinux>
References: <CABtds-0AUr1jD2Sri6ViiFiqyBbjc3-6xeAOr12YLJA9ux-2BA@mail.gmail.com>
 <CABtds-1d8uYi5YbxgbL5MwZOXTUgBmeLQWiggVhBKtqct5VC-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABtds-1d8uYi5YbxgbL5MwZOXTUgBmeLQWiggVhBKtqct5VC-g@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - pf-012.whm.fr-par.scw.cloud
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oss.cyber.gouv.fr
X-Get-Message-Sender-Via: pf-012.whm.fr-par.scw.cloud: authenticated_id: nicolas.bouchinet@oss.cyber.gouv.fr
X-Authenticated-Sender: pf-012.whm.fr-par.scw.cloud: nicolas.bouchinet@oss.cyber.gouv.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	R_DKIM_REJECT(1.00)[oss.cyber.gouv.fr:s=default];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[oss.cyber.gouv.fr : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-96256-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sean@starlabs.systems,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:xiujianfeng@huawei.com,m:keescook@chromium.org,m:linux-pm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mjg59@srcf.ucam.org,s:lists@lfdr.de];
	HAS_X_AS(0.00)[nicolas.bouchinet@oss.cyber.gouv.fr];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	HAS_X_GMSV(0.00)[nicolas.bouchinet@oss.cyber.gouv.fr];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[nicolas.bouchinet@oss.cyber.gouv.fr,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[oss.cyber.gouv.fr:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.bouchinet@oss.cyber.gouv.fr,linux-doc@vger.kernel.org];
	HAS_X_SOURCE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.cyber.gouv.fr:from_mime,vger.kernel.org:from_smtp,nondeterministic.computer:url,archlinux:mid,dreamwidth.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1664273B1F5

On Thu, Jul 09, 2026 at 04:33:38PM -0400, Sean Rhodes wrote:
> Please ignore this patch; the approach was wrong.
> 
> I'll follow up with a v2.
> 
> On Thu, 9 Jul 2026 12:23:11 -0700, Sean Rhodes <sean@starlabs.systems> wrote:
> > Kernel lockdown disables hibernation because the resume image cannot be
> > verified before it is restored. On systems where external platform or
> > storage policy protects the hibernation image from offline modification,
> > users may still need hibernation while lockdown is active.
> >
> > Add a hibernate=allow_locked_down command line option to make that opt-in
> > explicit. This only bypasses the LOCKDOWN_HIBERNATION gate; nohibernate,
> > secretmem and CXL memory restrictions still apply.
> >
> > The kernel does not validate the external policy or authenticate the image
> > with this option.
> >
> > Build-tested with Fedora config:
> > make O=../linux-lockdown-hibernate-build kernel/power/hibernate.o

Hi Sean, thanks for your contribution.

While I understand the frustration of Lockdown disabling hibernation, it really
is necessary in order to protect against the root user which is in Lockdown's
threat model. Similar discussions already happened in this patch set [1].

About Lockdown hibernation support, some work have started some time ago by
Matthew, it blog post [2] describe really well the security issue of hibernation.
This has then lead to a first implementation [3] that has been recently bumped
[4] but sadly no news have been given since.
Some interesting discussion also happened recently about this subject on
mastodon [5].

If a solution have to be implemented, it definitively should take a different
approach than just disabling Lockdown. If your interested by working on the
original patch, I'd gladly review it.

[1]: https://lore.kernel.org/all/20250728111517.134116-1-nik.borisov@suse.com/
[2]: https://mjg59.dreamwidth.org/55845.html
[3]: https://lore.kernel.org/lkml/20210220013255.1083202-1-matthewgarrett@google.com/
[4]: https://lore.kernel.org/all/IA1PR14MB62243E515C24AE8BF40E36BCB14BA@IA1PR14MB6224.namprd14.prod.outlook.com/
[5]: https://nondeterministic.computer/@mjg59/115491928573781876.

Best regards,

Nicolas

