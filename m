Return-Path: <linux-doc+bounces-91717-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8SYuJXhNKGqIBwMAu9opvQ
	(envelope-from <linux-doc+bounces-91717-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 19:29:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A37662F69
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 19:29:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=Pg6xFOx8;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91717-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-91717-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53F05301A2F7
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 17:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097A34BC027;
	Tue,  9 Jun 2026 17:19:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26D7481FAE;
	Tue,  9 Jun 2026 17:19:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025541; cv=none; b=TOFr/g3EJkUqY6zZH9C4Zsi628Dr3/Yyt+24SFoYXr3Ucr8SHqtgbdnqo8YphRsSztsAEdwPCCQU54yB04ZN3SnXdKvzJVZ8b/VNkmoAj9ztcxOQbaRfWBk1vW/6n8vturM2x+7dtPwHn8sLvC3dFRPMxEl5nAPBaH2UBthUHco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025541; c=relaxed/simple;
	bh=tqT8YCZb7IjuhdToOCmCuykD4lTDO3YOgqiJ5RwAVms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5HS3A+3D9RaTKJbkGHQuOE2Xq7yqVT6bG61zkRUI7b+6GrHnWfjbft9c3kvnIgdZ91r87bBhV4/qIh/Z2kPPk1m/J3/N536weO7TPAtaXHVIBqOc7J9BgIS70cTXX6TxTTBW52KB50g+3kbNKY8u4HtwV79dk4x1JXsm9uBG2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Pg6xFOx8; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5130E3D7A;
	Tue,  9 Jun 2026 10:18:55 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B486D3FD88;
	Tue,  9 Jun 2026 10:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781025540; bh=tqT8YCZb7IjuhdToOCmCuykD4lTDO3YOgqiJ5RwAVms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pg6xFOx8b5qSmMD0YciRcQHp2ryy+UmAEJszVsvO1cpzq4rkMtBpQPflp4p0QuEsB
	 3C0ajdeEDkS5rUbjsJErrfpTAB1OXIrg0mvfKXsyOGS3YNrMKC6GGu3/0qsPMck106
	 wqaNwCwNayTnGwDvnWikCjyqYQKZs1YO2IADHBAU=
Date: Tue, 9 Jun 2026 18:18:57 +0100
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
Subject: Re: [PATCH v5 10/19] perf test cs-etm: Test decoding for concurrent
 threads test
Message-ID: <20260609171857.GR101133@e132581.arm.com>
References: <20260609-james-cs-context-tracking-fix-v5-0-d53a7d096a19@linaro.org>
 <20260609-james-cs-context-tracking-fix-v5-10-d53a7d096a19@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-james-cs-context-tracking-fix-v5-10-d53a7d096a19@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91717-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arm.com:dkim,arm.com:email,arm.com:from_mime,e132581.arm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90A37662F69

On Tue, Jun 09, 2026 at 03:40:15PM +0100, James Clark wrote:
> The thread_loop test only looks for context IDs in the raw trace.
> There's a lot more that can go wrong when decoding these, so replace it
> with a test that looks at the final output for matching thread names and
> symbols.
> 
> In the future we might use timestamps and context switch events to track
> threads, so looking at context IDs in the raw trace wouldn't always
> work.
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Tested-by: Leo Yan <leo.yan@arm.com>

