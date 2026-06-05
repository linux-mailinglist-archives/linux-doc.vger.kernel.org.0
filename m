Return-Path: <linux-doc+bounces-91044-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QBj3NFJ4ImrfXwEAu9opvQ
	(envelope-from <linux-doc+bounces-91044-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 09:18:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD99645E00
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 09:18:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oZCVS0xb;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91044-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91044-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B71B7303037B
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 07:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640E046AF38;
	Fri,  5 Jun 2026 07:10:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618CE472760;
	Fri,  5 Jun 2026 07:10:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643455; cv=none; b=VorCeAQptLVh8raPmJvU8A/JI2TIyIHp9tmROTHOb42Wvp+/QH+p+LWZz2XNYJh1QZWMhrsjdEX6GTJyUDldqnt7VNvwspE6ue/+WJf9ULRLkcNzIXeH1TEBJn0b4X/fOLenr7x1j9Bb3J1MyITqo5yyIqN2mkkuEx5FvuUoUbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643455; c=relaxed/simple;
	bh=4yU/OCT1/T1FXA0lrkmmn/qIMb1C05A/1eJwZ2V5vFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSRAxfX5prAqEhq8CXTzfnlDWfuDgGVrswt4y5TE9zQzzHkTZFJVGFEKteAj/kUAj/tcV8gCO35q5crZLEDX6Vbm2Nzx7pSnfokVLF+dzD99V6//fLAWLqD3/6IHw/4onwFfkv5lqRHm/WjTh1ZdlYlY8ou50yKPIdZz0az9dXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZCVS0xb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0391F00893;
	Fri,  5 Jun 2026 07:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780643454;
	bh=ZqZI8J9nTj7elKUH2Z6q9tM5bBMN9BGf/tMB5WQW7IU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oZCVS0xbB3ept8DSn8zmqUUp5iXMZd7d9yU5v/PwJWzkKOaLp1f1qTcOsgpasGA1A
	 dkiA4k7pvlrfxyr98E/QLxnp+BzfE5RE/HZmtWNLb6y1HOVc5hyZF44o9skt/x1j60
	 0/BFeEsP738URWphjAne+2IJOJJR6xSfgDdae58W6MsLLoiqloHS4ooxUoiQfe0DjD
	 OenxifPH2pOGaQdGwUcqJR3aJ1yBxx0uhzF1XDLn8HfGdYc5wO612zXTs7Y/1FfYew
	 OMxNMJHIlQ5KtQ/txW7hEDbmE6smArXshNunEk7YVeCCNBxbcfzMKtLMoX3gqE1TYB
	 9szQz5APYxn6w==
Date: Fri, 5 Jun 2026 07:10:49 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
	tfiga@chromium.org, senozhatsky@chromium.org
Subject: Re: [PATCH v2 2/3] PM: dpm_watchdog: Allow disabling DPM watchdog by
 default
Message-ID: <aiJ2eaxid2rwKHCG@google.com>
References: <20260604090756.2884671-1-tzungbi@kernel.org>
 <20260604090756.2884671-3-tzungbi@kernel.org>
 <32fda49e-f246-4fae-9e4e-05c12fdb3ea6@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32fda49e-f246-4fae-9e4e-05c12fdb3ea6@infradead.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:corbet@lwn.net,m:rafael@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:skhan@linuxfoundation.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:tfiga@chromium.org,m:senozhatsky@chromium.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-91044-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DD99645E00

On Thu, Jun 04, 2026 at 09:53:11PM -0700, Randy Dunlap wrote:
> On 6/4/26 2:07 AM, Tzung-Bi Shih wrote:
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 00375193bd26..0a0d5340b0c7 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -5399,6 +5399,14 @@ Kernel parameters
> >  			function to NULL. On Idle the CPU just reduces
> >  			execution priority.
> >  
> > +	power.dpm_watchdog_enabled=
> > +			[KNL] Enable or disable the device suspend/resume
> 
> I think that [KNL] isn't very useful here (nor in many of its uses in
> kernel-parameters.txt).
> What is required to use this option are:
>   CONFIG_PM_SLEEP, CONFIG_DPM_WATCHDOG
> You should convey that information somehow.
> 
> Also, in kernel-parameters.txt, "pm_async=" is only valid when [PM]
> is enabled, but "PM" is not defined/described anywhere.
> That should be added near the beginning of kernel-parameters.txt (in
> alphabetical order).

Thank you for your review.  Will fix them in the next version.

