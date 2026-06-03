Return-Path: <linux-doc+bounces-90717-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 71XcIXwMIGosvAAAu9opvQ
	(envelope-from <linux-doc+bounces-90717-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 13:14:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3925A636E6E
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 13:14:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=Dh0pgKkY;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90717-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-90717-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 175FA30A3F81
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 11:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF2F43CEEF;
	Wed,  3 Jun 2026 11:06:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A10F3B2FD1;
	Wed,  3 Jun 2026 11:06:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484785; cv=none; b=e1YJierJXuWbm0ubsGs9DPQ4S7UZHI4x9+vcTiNtHrxRSru1aNghNbCt4T0KLRQV15G0e/4y5IInEm8Mk915iqr/N3kuXMOleDjwconUH0DtbvGq7xbk4oV++MY+StdopOtX4J6Absx+PE2af+JRQi2SiEBD5xK9ghwJC8qrC3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484785; c=relaxed/simple;
	bh=GvgqB2E/Kyddxf977Klr0BYNxizGw/BC0d/bmgsXfbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zqi2n1T5+O2TF1VhA62366YucSBxY+QC3TZnm9WiEodFClAQqv3N8Ec7XJnc2m03TNrNsMtrTJ/uqAbl5mRYav+40/SbRZkkFyPnKy5livhNUnIwJbfIEfpSyEfTbcB5S2X4xEBgbMYSx2vcrG+d20WupgqOmaoOyJ4uQnuWDAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Dh0pgKkY; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C775632E4;
	Wed,  3 Jun 2026 04:06:18 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52B513F86F;
	Wed,  3 Jun 2026 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780484783; bh=GvgqB2E/Kyddxf977Klr0BYNxizGw/BC0d/bmgsXfbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dh0pgKkYamrFVE00IdP/ciPJ47rh+RmuKqGjRSeCJ30JkFx5eHMjdNxruDu5l3J9w
	 suWtvZiytH1+GfAPpSyvb5Wzs88uX8N8myXgeHGSyQt4fwA5dsbyUiz93SI2IpYW3r
	 2EslEMMGxCO/8aSakzkDwqCnWEzflopzev0Vy5F0=
Date: Wed, 3 Jun 2026 12:06:21 +0100
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
Subject: Re: [PATCH v2 03/18] perf test: Add a workload that forces context
 switches
Message-ID: <20260603110621.GR101133@e132581.arm.com>
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
 <20260602-james-cs-context-tracking-fix-v2-3-85b5ce6f55c6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-james-cs-context-tracking-fix-v2-3-85b5ce6f55c6@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-90717-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,e132581.arm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:from_mime,arm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3925A636E6E

On Tue, Jun 02, 2026 at 03:26:45PM +0100, James Clark wrote:

[...]

> +/* Not static to avoid LTO clobbering the function name */
> +void context_switch_loop_proc1(int in_fd, int out_fd);
> +noinline void context_switch_loop_proc1(int in_fd, int out_fd)
> +{
> +	for (int i = 0; i < loops; i++) {
> +		read_block(in_fd);
> +		context_switch_loop_work += i * 3;
> +		write_block(out_fd);
> +	}
> +}

Rather than struggling with unexpected options, and "noinline" might
not work as it is not a standard compiler option (it is defined in
kernel header as AI reminded me), wouldn't it is reliable to use a
dedicated CFLAG rule same as other programs?

Thanks,
Leo

