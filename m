Return-Path: <linux-doc+bounces-90792-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /dpSEG1gIGqh2AAAu9opvQ
	(envelope-from <linux-doc+bounces-90792-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 19:12:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D8063A11C
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 19:12:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=hDQrq35u;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90792-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90792-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2FE53013EEC
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 17:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA003E9F61;
	Wed,  3 Jun 2026 17:08:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCF93E1CF0;
	Wed,  3 Jun 2026 17:08:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506508; cv=none; b=Ky9zGxubIemsiKwoMXIFfHZ9sScQlWantjRk3rPA52pMmeDtOPDv2ZiBcSMj0x5qwen/6w1PnGkEOA/z4JpyfAph8eTfZwYI6lGqK24MbVOoZPdPmSunEny8VUXDvA6Lil2rAfM3OHuYWkwEPQk7Isx2K9piL+6WE3xZ7gau7dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506508; c=relaxed/simple;
	bh=coDF+fPSybGXWIT0PI4La9M9bBJpTiUeLEadqpd9b6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWDwgXVhuqlHGHiUhYkMmdyiRmp50Tcr9HFlTz7JaOWM0T8h/aEnYi17e5mrWEtpA0MwfPwf6/aFaV9goLbo47zto1LX0BsxJajd4vCUcrk4O4awBlwQIs/aIClCb2TnSz+xGw/dhgcVhG53ZIZ8ezrWJsCeurWfLZdaV897Li0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hDQrq35u; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EDED307A;
	Wed,  3 Jun 2026 10:08:21 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC1203F632;
	Wed,  3 Jun 2026 10:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780506506; bh=coDF+fPSybGXWIT0PI4La9M9bBJpTiUeLEadqpd9b6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDQrq35uqqxbId+KX0z9VeYR9TLqfT7Rd3YOedOki1/uGb3zXnGNmUzR/Nbg4dXmk
	 X10KT1FydA589o0IhbDBfMWVm90xE6/GvHuMlpEDNZLPbANQySa4y3GEYKcZ0l7Ugm
	 FMNmsOlkraV3tKyqFVnkFiJ8HKA6ptE8o8zIcfKM=
Date: Wed, 3 Jun 2026 18:08:23 +0100
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
Subject: Re: [PATCH v2 06/18] perf test cs-etm: Replace unroll loop thread
 with deterministic decode test
Message-ID: <20260603170823.GA101133@e132581.arm.com>
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
 <20260602-james-cs-context-tracking-fix-v2-6-85b5ce6f55c6@linaro.org>
 <20260603140803.GV101133@e132581.arm.com>
 <2f1db2b3-93e8-4c32-b207-304e3a43ce77@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f1db2b3-93e8-4c32-b207-304e3a43ce77@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-90792-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,arm.com:from_mime,arm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7D8063A11C

On Wed, Jun 03, 2026 at 05:01:02PM +0100, James Clark wrote:

[...]

> > > +# Remove open brace lines as they may not be hit depending on the compiler
> > > +sed -i \
> > > +  -e '/deterministic.c:8$/d' \
> > > +  -e '/deterministic.c:15$/d' \
> > > +  -e '/deterministic.c:23$/d' \
> > > +  "$tmpdir/script"
> > 
> > Is this related to the function definition?
> > 
> > I can see the brace lines with change below. It might be more reliable
> > if adding unused function argument, which can give chance for hit
> > function entry.
> > 
> >    static int function1(void)
> >    {
> >        ...
> > 
> >        return 0;
> >    }
> 
> Originally I included the brace lines in the test and it was working even
> without function arguments, but Sashiko mentioned that they may not always
> be hit.

I tried Clang to build the program and can see the brace lines are
missed for function1() / function2().

Does Sashiko mention any reasons causing the issue?

> I think its point was that there is no hard rule about debug symbols for
> open braces and the behavior might change from one version of the compiler
> to the next, or whether there is a function prologue or inlining or not etc.
> 
> I don't think it's important to the test at all though? So to err on the
> side of caution it makes sense to not test for them. Unless there's a reason
> you think testing for open braces is important? Surely just testing for
> actual lines of code appearing in a certain order is enough.

As the test program is named as "deterministic", wouldn't we expect the
test to hit every code line run in the program?

It is fine for me to skip some checks _if_ we know the reason. I dumped
the disassembly, it shows function entry is a distinguished position
from the first calculation sentence (same for both GCC and Clang). And
there have no difference for a function entry after I tweaked the
function return type from "void" to "int". I still have no clue why
brace lines are misses.

Thanks,
Leo

