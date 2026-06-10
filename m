Return-Path: <linux-doc+bounces-91878-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6tD0NPvHKWrcdAMAu9opvQ
	(envelope-from <linux-doc+bounces-91878-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 22:24:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3270B66CC24
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 22:24:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CtWAADDy;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91878-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91878-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30A6D31337DF
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 20:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E057478E5D;
	Wed, 10 Jun 2026 20:23:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9F731353C;
	Wed, 10 Jun 2026 20:23:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122991; cv=none; b=EUIKmDE8/uh41C2xKZGJlmz5eE8dcpMcnlaoy8akY0Af81wndd7NO2h3idlyM7lCs+00VfGY6mfAXJuO+ADsSBSTJSmNhuGUw8GqOM97mP6wGPyxRwc+lnsxs2PLo6x5sZLRxLHwpjeZ4vQ3RDDc1Iy89oVw8JG56lNg1faBMhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122991; c=relaxed/simple;
	bh=DTOoGiG04hNAwdKyog+oW6k2jntrnWbRPypS84E/Mng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wd7ABi/uxvt19Y2Nxn1JJLZlKH0Nh8m1OKN+UQfFwffjqkudh6GDy0yCCR/OWUiIrxZNNAFRQseGVH/lM9TCNUZJLP8C1jscsok5ZuGNu9RwFiyMVeToorAcjz3Cq1I3hLE8i2vItCEKH39d5m+XJhZ5enZqHeJ4fIALMo12dSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtWAADDy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F791F00893;
	Wed, 10 Jun 2026 20:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781122990;
	bh=gTrL7Tyeuo4QVSWDitVGbLtjegWv9djHZTxLQNU7wlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CtWAADDykj72u83HzQmtaRoEh5tcvDokkQ75xIGg/6QXAvT5YoaM/kz56hM4qEQ5y
	 NQMq7ptAN1QzywQmXMW24rACo8PbYvPGcM6PVqJrvDVOJ4MhWE9F772YPUonjTyVU9
	 rqPW6hyOQ+2fBF1T2loPNwZ8ioGiTWhHzLf93CgV/c70rTySJo4FKBKnH/Y7i37RrP
	 +xSeyhqkedvSFnCxsJxjFjLL08BofkaPtXMqMp1NY0YZxZs2OHuwy1+CCQ6KrA5pXU
	 GpKEESDLyMEqbhoPni6f00Mr8SQwef5so9qS04sob6SVnDUEtDPGn13jnMTF6k6T1E
	 WJ8iFIKdFxn4A==
Date: Wed, 10 Jun 2026 13:23:09 -0700
From: Kees Cook <kees@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Michal Gorlas <michal.gorlas@9elements.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH 0/2] module: restrict module auto-loading to privileged
 users
Message-ID: <202606101317.D23383F465@keescook>
References: <20260515-autoload_restrict-v1-0-40b7c03ddd04@9elements.com>
 <20260605183646.GC2939956@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605183646.GC2939956@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:samitolvanen@google.com,m:michal.gorlas@9elements.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:atomlin@atomlin.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-modules@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kees@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91878-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3270B66CC24

On Fri, Jun 05, 2026 at 06:36:46PM +0000, Sami Tolvanen wrote:
> On Fri, May 15, 2026 at 07:20:18PM +0200, Michal Gorlas wrote:
> > Add option to restrict the module auto-loading to CAP_SYS_ADMIN.
> > This is heavily inspired by CONFIG_GRKERNSEC_MODHARDEN of the latest
> > available Grsecurity patches [1]. Instead of checking whether the
> > callers' UID is 0, check whether the calling process has CAP_SYS_ADMIN.
> > The reasoning here is that many modules are autoloaded by systemd
> > services which are running as privileged users, but do not have UID 0.
> > While systemd-udevd runs as root, systemd-network (which often
> > auto-loads a module) for example runs as system user (UID range 6 to
> > 999).
> > 
> > When enabled, reduces attack surface where unprivileged users can trigger
> > vulnerable module to be auto-loaded, to then exploit it. Recent LPEs
> > (CopyFail [3], DirtyFrag [4]) for example, would have been mitigated
> > with this option enabled as long as the vulnerable modules are not built-in
> > (or already loaded at the point of running the exploit). 
> 
> This sounds potentially useful as an optional feature. Kees, you've
> looked at grsec features in the past, do you have any thoughts about
> this?

This doesn't really look like GRKERNSEC_MODHARDEN to me? In that
feature, the credentials of the usermode helper are passed down so that
udev or whatever can examine them and make choices (instead of seeing
the uid-0 usermode helper credentials).

This looks like it is just doing a request-time policy check, but that's
already covered by the security_kernel_module_request() call immediately
before the proposed module_autoload_restrict check.

Also note that module loading is _already_ controlled by CAP_SYS_MODULE,
not uid 0 nor CAP_SYS_ADMIN.

Sashiko has similar feedback, and some other notes too:
https://sashiko.dev/#/patchset/20260515-autoload_restrict-v1-0-40b7c03ddd04%409elements.com

I'm not clear what problem this patch is trying to solve?

-Kees

-- 
Kees Cook

