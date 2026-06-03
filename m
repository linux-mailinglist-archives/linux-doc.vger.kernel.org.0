Return-Path: <linux-doc+bounces-90752-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YK4wHasyIGruyQAAu9opvQ
	(envelope-from <linux-doc+bounces-90752-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 15:56:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D91736384E3
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 15:56:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=soxvulSm;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90752-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90752-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E048D30BC0D7
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 13:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE983101A6;
	Wed,  3 Jun 2026 13:43:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666132FD1DA;
	Wed,  3 Jun 2026 13:43:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780494225; cv=none; b=tcf9OAKA3FIgUuQUP5wTrKz4OVCZghf7T1B5wB1fGkhqgNB0l8C6HquETCBQ30Trm9MGsAs1jDFBS6g9CabNzUrFit0erFOwLWEHn635aeMAg7q6rUnl97yWR6pXuHFaINegp8M1JI/GUBbXCy1PCAkXOut0WfMIXrp5dFuGtYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780494225; c=relaxed/simple;
	bh=XS3AUT8gLJh/VCtqlwIdaljPjNYM4Ji4B9GWl1mdiYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsnsMuhfqpmfoQNbjEXr8XKrmhcxoPpfFT8e0saP3SbS6cQfMEvIEQX2Hj6pQOkLgxC0j77yCkYYFRpfTBFkpZE78YZvD9I66MKrdSUaEdkhYWLyL7cVCNMcyf+Brlc57v9CBMlLKn4up3yE4FEdwGB8pRPeL29uF300TYIMvfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=soxvulSm; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ED4F32E6;
	Wed,  3 Jun 2026 06:43:37 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EF173F86F;
	Wed,  3 Jun 2026 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780494222; bh=XS3AUT8gLJh/VCtqlwIdaljPjNYM4Ji4B9GWl1mdiYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=soxvulSmaI7IldxbFJnpQ0O2B7ZFKecG/cj6e+NCMPC1l9CHaQRwjo0Ww8JD9A2Md
	 qILposO+e1SBiLkjUv14P1U/wLNm8giZZ/rgnkp8yl7uNRXvSyP996OkdAGcSKQPtg
	 cURuBHT/vIt/T+1d9SOPqPvEBEcfV/Yqr7I1tMUI=
Date: Wed, 3 Jun 2026 14:43:39 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paschalis Mpeis <Paschalis.Mpeis@arm.com>,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 05/18] perf test: Add deterministic workload
Message-ID: <20260603134339.GU101133@e132581.arm.com>
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
 <20260602-james-cs-context-tracking-fix-v2-5-85b5ce6f55c6@linaro.org>
 <20260603112742.GT101133@e132581.arm.com>
 <b4836fe9-49cf-44c3-96a9-548e890cee29@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4836fe9-49cf-44c3-96a9-548e890cee29@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90752-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:james.clark@linaro.org,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:acme@kernel.org,m:namhyung@kernel.org,m:jolsa@kernel.org,m:irogers@google.com,m:aaupov@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:Paschalis.Mpeis@arm.com,m:coresight@lists.linaro.org,m:linux-perf-users@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:acme@redhat.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[leo.yan@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D91736384E3

On Wed, Jun 03, 2026 at 02:10:37PM +0100, James Clark wrote:
> 
> 
> On 03/06/2026 12:27 pm, Leo Yan wrote:
> > On Tue, Jun 02, 2026 at 03:26:47PM +0100, James Clark wrote:
> > 
> > [...]
> > 
> > > @@ -22,3 +23,4 @@ CFLAGS_brstack.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
> > >   CFLAGS_datasym.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
> > >   CFLAGS_traploop.o         = -g -O0 -fno-inline -U_FORTIFY_SOURCE
> > >   CFLAGS_inlineloop.o       = -g -O2
> > > +CFLAGS_deterministic.o    = -g -O0
> > 
> > I have no strong opinion for using 'noinline' in source or using the
> > global option '-fno-inline', just thought this is not easy to follow
> > up if anyone (likely myself) will write a new workload for disabling
> > inline. Could we have consistent style for this?
> > 
> > For the patch itself:
> > 
> > Reviewed-by: Leo Yan <leo.yan@arm.com>
> 
> Actually it's a fair question why some have -fno-inline and others do it in
> the code, it could just be copied from when these were built by their shell
> script tests. From a quick look I would say we can easily drop the
> -fno-inline and do it in the code, and it's better to only noinline what's
> needed rather than everything. But that's probably a change for another
> time.

Seems to me, `-fno-inline` is more reliable.

I.e., in this patch deterministic() has no 'noinline' annotation, my
understanding is the test expects it is not inlined. With `-fno-inline`
flag, we don't need to worry anything is missed.

Thanks,
Leo

