Return-Path: <linux-doc+bounces-90757-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KtHNHr82IGqxygAAu9opvQ
	(envelope-from <linux-doc+bounces-90757-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 16:14:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C344B638732
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 16:14:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=cZYXsPz7;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90757-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90757-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1373A304D5F3
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 14:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41DF3A8724;
	Wed,  3 Jun 2026 14:08:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6813A4508;
	Wed,  3 Jun 2026 14:08:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495688; cv=none; b=j8DGM6PfytIaHQ+TQIbhQzDV+gU9liZ1XSoImdH172athUdLHHoP0DqUjB3StefdvR0AwVl/RNCgq4YSW1DGHV3x2JqfP6KjjryR0TLmB331BSmeKrvR2/ol/ok7cKdOtYkOnBc0qa0ZX8ymLIyv2sRVIT9DImd1gNkIRmGgApw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495688; c=relaxed/simple;
	bh=J4lf7anc8bhIqqTujEh0dhSjQuwaw0eZ2Ppem51hTno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlTViEKQtWhOsT8lIU2C6d2xx5g3Z30bmFmto5V75Yg3dbVlKTMBtCST15bvy1LA5HDkP/UYCvrE5HVs0n+bUbhCkG+jDhUD9zJkS6BaV59gDVvJZMHaTvm3LeRYiNAoRd7ZJlG+snlFHBniiSjolSBbM/q3uTI1XhAD4UdkPpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cZYXsPz7; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B0BA1477;
	Wed,  3 Jun 2026 07:08:01 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A54B63F632;
	Wed,  3 Jun 2026 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780495686; bh=J4lf7anc8bhIqqTujEh0dhSjQuwaw0eZ2Ppem51hTno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cZYXsPz7FqjxG8z0ST2KB10rXymP2b7jskj5ADyemTNYnrYytuu+892eQtA4MAk0U
	 DKAxA0SY/rhdlwxTc2NASHw8kQ9vpBhsjefAXtWuGYEbMDzHF4j/doDNnC3wi8+bST
	 EfHEkEP85TqWB3b7kmduuQ9TcQo/oosRiZ9oGbx8=
Date: Wed, 3 Jun 2026 15:08:03 +0100
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
Message-ID: <20260603140803.GV101133@e132581.arm.com>
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
 <20260602-james-cs-context-tracking-fix-v2-6-85b5ce6f55c6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-james-cs-context-tracking-fix-v2-6-85b5ce6f55c6@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90757-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:from_mime,arm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C344B638732

On Tue, Jun 02, 2026 at 03:26:48PM +0100, James Clark wrote:

[...]

> +# Remove open brace lines as they may not be hit depending on the compiler
> +sed -i \
> +  -e '/deterministic.c:8$/d' \
> +  -e '/deterministic.c:15$/d' \
> +  -e '/deterministic.c:23$/d' \
> +  "$tmpdir/script"

Is this related to the function definition?

I can see the brace lines with change below. It might be more reliable
if adding unused function argument, which can give chance for hit
function entry.

  static int function1(void)
  {
      ...

      return 0;
  }

Thanks,
Leo

