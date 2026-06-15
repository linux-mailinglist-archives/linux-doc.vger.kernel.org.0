Return-Path: <linux-doc+bounces-92441-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pR0PLSmBMGqdTwUAu9opvQ
	(envelope-from <linux-doc+bounces-92441-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 00:48:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0946468A77B
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 00:48:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BHSE3ZKG;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92441-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92441-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91DA43061685
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 22:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C84830B53A;
	Mon, 15 Jun 2026 22:48:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B8479CD;
	Mon, 15 Jun 2026 22:48:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563684; cv=none; b=uSPtXSnynLFhCVchw8hZxvfYxJDUBGkuOXDWgAVlTHZZwxED3nAfeKMNdNXGP9r4wOCan/HQmwT2Wt45B/v4Lg0IO37XLa9rx/Dxc3OdvZXJrWbWs0jYkpsc2RYrQX90RihBJFnhwsTizy3Oa9sLhoVJfLM6I8tNeXqtYC4H7rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563684; c=relaxed/simple;
	bh=CqpDulu3Uclnc4tI7DX6e5r2qCyKXkorUrUszaTc7X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDzOALIxiqG875BbGBXU8AR9O0nbu/jXjUpjz/P29wYz0cBnp1xk74IjwN8BY2A/g1BIPnTLtylfSrTAKXGbj/hdBqgJxipmHneQjwxOenIkfEOO7Odzw/mBCkZ362uhKTc3bruZsWuZqksZem7wfKQavftSWeBh5IetoYxQB6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHSE3ZKG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347071F000E9;
	Mon, 15 Jun 2026 22:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781563683;
	bh=Zs8KpH+uagfCKB2jn26tTEhh3LE6JVismookwgsfOjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BHSE3ZKGn9vS2hG6yEsEpDp+9fUGDwaM0QlmAA2tM07RZP50NM5n+N6KK9VWPcrPP
	 1AJR8dWI2X/GXtcn5lyyVz9MhgsEW8+CXNl/tSIU1BDPTlJ2Ou5gY3sJNpfP4baUvr
	 TR+Ri0ngWIpxdJMO3OiyOzINzmVZ/da3ItGzm0hSpEB7VeNa4covlAJCHY/DmKhpCI
	 vCR2sOMrN/hu/NkTcc9AJnMk1dDOqIbB8FCoEni3dCxcFu8MqhuPFupwo4Ox5yggUG
	 aXDghIv9aELmmLWD4TDYOxcoUT668/zno593CgiTe8prKjxCjabWnIc3aRDvQUaqE2
	 WDrtlnJhenpOA==
Date: Mon, 15 Jun 2026 15:48:02 -0700
From: Kees Cook <kees@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dan Carpenter <error27@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefano Zacchiroli <zack@upsilon.cc>,
	Steven Rostedt <rostedt@goodmis.org>,
	Laura Abbott <labbott@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Wenwen Wang <wenwen@cs.uga.edu>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org, Dawei Feng <dawei.feng@seu.edu.cn>
Subject: Re: [PATCH v3] Documentation/process: Add Researcher Guidelines
Message-ID: <202606151547.DB4095584@keescook>
References: <20220304181418.1692016-1-keescook@chromium.org>
 <ahgaOigklcDCYvRp@stanley.mountain>
 <ajACprp9UJp2JSJM@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajACprp9UJp2JSJM@black.igk.intel.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:error27@gmail.com,m:corbet@lwn.net,m:gregkh@linuxfoundation.org,m:zack@upsilon.cc,m:rostedt@goodmis.org,m:labbott@kernel.org,m:julia.lawall@inria.fr,m:wenwen@cs.uga.edu,m:gustavoars@kernel.org,m:linux@leemhuis.info,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:dawei.feng@seu.edu.cn,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[kees@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92441-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,lwn.net,linuxfoundation.org,upsilon.cc,goodmis.org,kernel.org,inria.fr,cs.uga.edu,leemhuis.info,vger.kernel.org,seu.edu.cn];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[keescook:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0946468A77B

On Mon, Jun 15, 2026 at 03:48:22PM +0200, Andy Shevchenko wrote:
> On Thu, May 28, 2026 at 01:34:34PM +0300, Dan Carpenter wrote:
> > On Fri, Mar 04, 2022 at 10:14:18AM -0800, Kees Cook wrote:
> 
> ...
> 
> > > +  x86_64 and arm64 defconfig builds with CONFIG_FOO_BAR=y using GCC
> > > +  11.2 show no new warnings, and LeakMagic no longer warns about this
> > > +  code path. As we don't have a FooBar device to test with, no runtime
> > > +  testing was able to be performed.
> > 
> > People have started sending commit messages in this exact template and
> > normally I would ask them resend with the meta commentary from this
> > paragraph below the --- cut off line.
> > 
> > Do we really want this "Compile tested only" stuff in the permanent git
> > log?
> 
> +1 here, can we rather avoid flooding commit messages with the meta, that
> anyways is available in lore.kernel.org archives?

Hm, I have gotten a lot of push-back from maintainers (reasonablly)
wanting to know the specific level of testing patches get. In the case
of lacking hardware, this seems like useful information still.

-- 
Kees Cook

