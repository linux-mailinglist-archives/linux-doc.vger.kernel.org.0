Return-Path: <linux-doc+bounces-91549-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2ODfEOPTJ2oU3AIAu9opvQ
	(envelope-from <linux-doc+bounces-91549-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 10:50:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C040F65DF90
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 10:50:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=uzmUcOMZ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91549-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91549-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C470310299B
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 08:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EEA369D5E;
	Tue,  9 Jun 2026 08:44:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A280631715A;
	Tue,  9 Jun 2026 08:44:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994650; cv=none; b=USyAa26eP6ST71J0BKHvLbWRxIs6eNy/mX+lv4Qk3c1Q37N8/3QIKrhT2vlltCYaC6G3ymnaMeex5MzZjQ5ywUhIujqS2eOp6CgSpkPDArBRu4zGjo9p8qHtoU2dZ131Cccmi5Cos+nTPTjWuiBvtIJfbCLfxx8xePnDqNZb1ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994650; c=relaxed/simple;
	bh=KbRPuyyHLmIUrmdZAP1gPwjJO/CNDvgy1uQ8Ui5P/gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFqcjOOYP6A/cVrnm8stRwxNCv78NgOnbKvEWfror5mmgiUSE2yADIKCDgmr9Qn7DnqsEn1JrYU+OhLS6c6kpRiuoEPCu9fL7PvV6026zle9vIHNjc62QP3G4QsexLS3jFf7O2YtDylU0JoyEPDbX2knjIfUlWkqGLhJn022SYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uzmUcOMZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56311F00893;
	Tue,  9 Jun 2026 08:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780994649;
	bh=xsOoWZGr/UeT1WrAeRIOME4bjHy2hpfFoSpaeDAsP9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uzmUcOMZ2uAu6MaSjrq6eM11aLaXCEkH339tXGrxv1rd1uv9/S/yCDXtaP6lnFbVf
	 JT+IRQs3LzxEubt1OGnfKL4ojUU55YWunZduIzo5epUfE3J4zVgHlSCfm8X3K8txsm
	 HTFXhGy/jV7ULu2ADTEvYYK9wBQbyTxj4NKhA/qg=
Date: Tue, 9 Jun 2026 10:43:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Askar Safin <safinaskar@gmail.com>
Cc: w@1wt.eu, corbet@lwn.net, leon@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, security@kernel.org,
	skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <2026060955-zesty-cucumber-1a49@gregkh>
References: <20260509094755.2838-3-w@1wt.eu>
 <20260609083305.2382925-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609083305.2382925-1-safinaskar@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91549-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:safinaskar@gmail.com,m:w@1wt.eu,m:corbet@lwn.net,m:leon@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:security@kernel.org,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C040F65DF90

On Tue, Jun 09, 2026 at 11:33:05AM +0300, Askar Safin wrote:
> Willy Tarreau <w@1wt.eu>:
> > +in a way that allows multiple local users to get a fair share of the available
> 
> Your "security-bugs.rst" says that we should consult "threat-model.rst" to
> determine whether a bug should be sent to secret mailing list.
> 
> And "threat-model.rst" says that kernel gives everyone "fair share"
> of resources.
> 
> This can be interpreted so: if scheduler is not fair enough, then this is
> security bug and should be reported to secret mailing list. I don't think
> this is what you meant.

Within reason of course, please use your best judgement.

> > +When hardware fails to maintain its specified isolation (e.g., CPU bugs,
> > +side-channels, hardware response to unexpected inputs), the kernel will usually
> > +attempt to implement reasonable mitigations. These are best-effort measures
> > +intended to reduce the attack surface or elevate the cost of an attack within
> > +the limits of the hardware's facilities; they do not constitute a
> > +kernel-provided safety guarantee.
> 
> "best-effort measures" and "they do not constitute a kernel-provided safety
> guarantee" can be interpreted so: if someone finds yet another Meltdown-like
> side-channel CPU bug, then this is not security bug, and should be
> reported openly. I don't think this is what you meant.

Again, please be reasonable.  Hardware bugs have their own reporting
process that we have well documented.

> > +    affect the system's availability (shutdown, reboot, panic, hang, or making
> > +    the system unresponsive via unbounded resource exhaustion).
> 
> So if unprivileged process can crash system, then this is security bug?

Yes.

> Also I'm not sure "unbounded resource exhaustion" is correct here.

Why not?

> As well as I understand, by default kernel and distros don't set any
> memory limits or limits for number of processes for unprivileged processes,
> so unprivileged process can easily cause resource exhaustion by
> allocating a lot of memory or by fork bomb.

That's a distro problem, not a kernel problem.

> So, I think you should instead say that unprivileged process, which
> has memory limit (and other limits) set using cgroups, should not
> be able to cause resource exhaustion.

Patches are always gladly accepted.  But again, be reasonable please,
this isn't a legal document :)

> > +are designed to be accessible to regular local users with a low risk (e.g.
> > +kernel logs via ``/proc/kmsg``), some would expose enough information to
> 
> /proc/kmsg has rights "-r--------", so I think there is error here.
> 
> ---------------
> 
> Finally, I have questions:
> 
> - If unprivileged user created process, which is impossible to kill
> by privileged process, is this security bug?

Sounds like a bug, we can deal with it that way.

> - If unprivileged user prevents privileged user from suspending
> system, is this security bug?

Physical access of suspending a machine feels like an odd threat model
to be worried about :)

If you have bugs that you feel are security issues like the above,
great, please report them and we can take them on a case-by-case basis.

This document is meant as a starting point for that, and to help remove
a huge number of "this is a security bug!" reports that we keep getting
that are obviously not that.

thanks,

greg k-h

