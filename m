Return-Path: <linux-doc+bounces-90725-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FVtGFKYQIGpzvQAAu9opvQ
	(envelope-from <linux-doc+bounces-90725-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 13:31:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC5F637154
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 13:31:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=H4IF+SS1;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90725-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-90725-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 811C9305F759
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 11:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D39E44CAE0;
	Wed,  3 Jun 2026 11:27:47 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1287A3D7D77;
	Wed,  3 Jun 2026 11:27:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486067; cv=none; b=bqRKlMM3a4OMfFHCgcTulN/2X74ZfeVIEsaz6X6mk3V9kjghGzxdKmepqPKmc0r3DaqrhPmOdHzFDn5LCzd3fFZ9cjVwQgb4iT1IQVcyaZJkJAaK/KA0lajvLr16unFS0VThw5PRuC2JyvqL5GyjhQc5CO/0guwKJampOMuagug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486067; c=relaxed/simple;
	bh=uUloJLDR/+8k+kdIq3y/lojUZwX4d30zMUIMrvc+ZGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9v7GChkrZuC8s9+toJSxe37ZvKCDrNd4r9UoGJZ7wRAIKiVy74erm9O6X1Q+sW2B7m3IfM3OYCnP+1NiZdXPmOHKmOHeriw6YGsfxMj1C4UKtXTlOTGQlFI9XFMG8tPqdpfI/ExxN/N0IENCSRhAkE3CtghSnIPQRxvKXgzQKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=H4IF+SS1; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7467C153B;
	Wed,  3 Jun 2026 04:27:40 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEE093F86F;
	Wed,  3 Jun 2026 04:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780486065; bh=uUloJLDR/+8k+kdIq3y/lojUZwX4d30zMUIMrvc+ZGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4IF+SS1tB0UfSft+S7DQqbevfdPjoQppXCBXARrA+Dr5T3XsyCRTqSG59r+fCxJd
	 CjkJeEm4IEpG5tlve2EbRscHtP/HB1Bw8bGf0EV0RZFjWYXYCv7Mc/AL9Ga25Lt8iN
	 IhfCdiy7X6/d3FIXfP6QiKLWbPrm4f2OZdUExh+k=
Date: Wed, 3 Jun 2026 12:27:42 +0100
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
Message-ID: <20260603112742.GT101133@e132581.arm.com>
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
 <20260602-james-cs-context-tracking-fix-v2-5-85b5ce6f55c6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-james-cs-context-tracking-fix-v2-5-85b5ce6f55c6@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90725-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[leo.yan@arm.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:james.clark@linaro.org,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:acme@kernel.org,m:namhyung@kernel.org,m:jolsa@kernel.org,m:irogers@google.com,m:aaupov@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:Paschalis.Mpeis@arm.com,m:coresight@lists.linaro.org,m:linux-perf-users@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:acme@redhat.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:from_mime,arm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBC5F637154

On Tue, Jun 02, 2026 at 03:26:47PM +0100, James Clark wrote:

[...]

> @@ -22,3 +23,4 @@ CFLAGS_brstack.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>  CFLAGS_datasym.o          = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>  CFLAGS_traploop.o         = -g -O0 -fno-inline -U_FORTIFY_SOURCE
>  CFLAGS_inlineloop.o       = -g -O2
> +CFLAGS_deterministic.o    = -g -O0

I have no strong opinion for using 'noinline' in source or using the
global option '-fno-inline', just thought this is not easy to follow
up if anyone (likely myself) will write a new workload for disabling
inline. Could we have consistent style for this?

For the patch itself:

Reviewed-by: Leo Yan <leo.yan@arm.com>

