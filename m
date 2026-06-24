Return-Path: <linux-doc+bounces-93397-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zg84GR/wO2oMfwgAu9opvQ
	(envelope-from <linux-doc+bounces-93397-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 16:56:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4976BF5B6
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 16:56:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=egCNRDZ5;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93397-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93397-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10FF63016B81
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 14:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F297080D;
	Wed, 24 Jun 2026 14:54:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51213D5C05;
	Wed, 24 Jun 2026 14:54:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312867; cv=none; b=kLweUAd7wxMtuGIVMrCgoe4+xTJI7of/oeM/DRV9CmC445lVgAMIVyIWaJb1Dypz1VmSsePn92jMELkqr3LUlcW7WMxChnumpwRHeq+pnzq4E33movd3YKBuRyAXTcigZbBrNA9ZDUMovJxZEjuPJ9A8acddLn+3uJ8KNqLlfJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312867; c=relaxed/simple;
	bh=RJN3BHqTjhShdhoyOpmqSe9zWevWxparSWkFsvw36NU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pzdb+KTMTdIebOdu8v+UFz4bi6pbDaZ/BA5o5b3qOsTpmgADiTfsPlJh12wrEwlBiRDQBA5ZJBZt1k2Enx74sw0hZKVC3yFJqJVgu9LPWK++GWu5OsIDT2NxoJZhJEeumJxHeJhgpsH8DtYK7zGklrLF5Du/Si/GG+A+No/TGtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egCNRDZ5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2490A1F000E9;
	Wed, 24 Jun 2026 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782312866;
	bh=y0UN3Un8oyUHkOFXuNz8lBuRk80Y1mfTFcU46CtjQos=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=egCNRDZ5stEnp6shriAeg7z7NOHq3CugHqinmq2CT0Lq+44uoLB6MgUhjdEfvTDtX
	 tETOvfzui1EUiQXdPYBlfX9EqdQqiVbblg9w3OTmbpQT57Wp9/1WStk0jxB0U++EkN
	 25ax4hSy8mTWU7L4SJEENDT1Cf+QE7i4saDNn9msNfHT5GeS8cVx95+6TW6GJnKGF9
	 MTrW8nHv32FIlFLVVAespJgfQN0VBeaxnHXTCflyOJXykmjilwa47eJBrv5qzeM/A9
	 ID7e6d+IwrvJYj5V5kMLjicMZl/YCG+LS0UlW6t/ZOogZcKXcZFK0IU9FkWHKK2G7N
	 iZsj3KM3cn5nQ==
Date: Wed, 24 Jun 2026 15:54:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux@analog.com, David Lechner
 <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v16 04/14] lib: kstrtox: add initial value to
 _parse_integer_limit()
Message-ID: <20260624155414.61755e9a@jic23-huawei>
In-Reply-To: <20260614210044.19dfc8df@jic23-huawei>
References: <20260604-adf41513-iio-driver-v16-0-1a7d09143bc2@analog.com>
	<20260604-adf41513-iio-driver-v16-4-1a7d09143bc2@analog.com>
	<rvx36i2ydmwhbbkdgbvh26uqchyoptzuu7tleuyarqn2skzkxz@owzwp62mzkdo>
	<20260614210044.19dfc8df@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:455.rodrigo.alencar@gmail.com,m:rodrigo.alencar@analog.com,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux@analog.com,m:dlechner@baylibre.com,m:andy@kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:akpm@linux-foundation.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:andriy.shevchenko@linux.intel.com,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:skhan@linuxfoundation.org,m:455rodrigoalencar@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-93397-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,vger.kernel.org:from_smtp,jic23-huawei:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA4976BF5B6

On Sun, 14 Jun 2026 21:00:44 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Thu, 4 Jun 2026 11:09:33 +0100
> Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> 
> > On 26/06/04 10:58AM, Rodrigo Alencar via B4 Relay wrote:  
> > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > 
> > > Add init parameter to _parse_integer_limit() that defines an initial
> > > value for the accumulated result when parsing an 64-bit integer. The
> > > new function prototype is adjusted so that the _parse_integer() macros
> > > stay consistent allowing for one more argument, which defaults to 0.    
> > 
> > ...
> >   
> > >  noinline
> > >  unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned long long *p,
> > > -				  size_t max_chars)
> > > +				  size_t max_chars, unsigned long long init)
> > >  {
> > >  	unsigned long long res;
> > >  	unsigned int rv;
> > >  
> > > -	res = 0;
> > > +	res = init;    
> > 
> > This might generate conflict, as the code around have changed in linux-next.
> > It is an easy fix though.
> >   
> Thanks for the heads up. Hopefully that will all fall out when I rebase testing
> on rc1 once that is out.
I've done a mid merge cycle rebase as the char-misc branches have merged.
So this should be resolve on my testing branch now.

Thanks
Jonathan

> 
> Jonathan
> 
> > >  	rv = 0;
> > >  	while (max_chars--) {
> > >  		unsigned int c = *s;    
> >   
> 
> 


