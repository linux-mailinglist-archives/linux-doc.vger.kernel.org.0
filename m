Return-Path: <linux-doc+bounces-90719-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JjOnH6MLIGrLuwAAu9opvQ
	(envelope-from <linux-doc+bounces-90719-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 13:10:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6858636DB4
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 13:10:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=bTNE+nlI;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90719-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90719-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B04D630316FA
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 11:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6E143E9F4;
	Wed,  3 Jun 2026 11:10:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D6843D500;
	Wed,  3 Jun 2026 11:10:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485022; cv=none; b=TE7MgFoctOr49j69L9PRFCyIzpbACRGKFFeTH5n/Ur3yrKKFfqkIIMNqx6wmojg9qdDlOoxTH6Og1CcKaD6g7tsgk0NbSKCsmWfa9WzPvrWtOWXHsUaCngY1WSCBDj7TzpoTF7Um4wdPA7KbgsUwz1nDCcISTrEO+JgkN13eDo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485022; c=relaxed/simple;
	bh=2keBvbqZ2Vgm/fEN+Vz4ZRoD6fUJNi1ra/DrIcA5a9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWbzndHDB+v83blWaihMnJuktc18m/DEaUtREoupJxyTZmmKjcHd2i1PG1yCHlQosUBlr1Mcfuqs0KHCH8xoF3Cy/vsY8BJkHN8QaCYf+aYdyU9FTKmU5Pqr56lzX/tcr7WV+zlurHWfqnF3Tn/as3FiPJ9/vlLZ3c9LYL6nsEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bTNE+nlI; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A453032E4;
	Wed,  3 Jun 2026 04:10:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AC9F3F86F;
	Wed,  3 Jun 2026 04:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780485020; bh=2keBvbqZ2Vgm/fEN+Vz4ZRoD6fUJNi1ra/DrIcA5a9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTNE+nlIWBpqZieGXftMVl0SrMFpBDH2jzlGkuZKz7ZCrd5of1hw/LFUuCHqPPpfo
	 WRqmWP7H41Ws68ISRWCkjeuNvINFWtsbUXPAAWZKxnvJT33SYkRo1wterqiHLNl2pZ
	 hIWj3B5rCiNlGg/RKavlCUvtz8E5c7Z0tYJipXGw=
Date: Wed, 3 Jun 2026 12:10:18 +0100
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
Subject: Re: [PATCH v2 04/18] perf test cs-etm: Test process attribution
Message-ID: <20260603111018.GS101133@e132581.arm.com>
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
 <20260602-james-cs-context-tracking-fix-v2-4-85b5ce6f55c6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-james-cs-context-tracking-fix-v2-4-85b5ce6f55c6@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-90719-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arm.com:dkim,arm.com:from_mime,arm.com:email,e132581.arm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6858636DB4

On Tue, Jun 02, 2026 at 03:26:46PM +0100, James Clark wrote:

[...]

> +check_samples() {
> +	owner_samples=$(grep -c "proc1.*context_switch_loop_proc1" "$tmpdir/script" || true)
> +	next_samples=$(grep -c "proc2.*context_switch_loop_proc2" "$tmpdir/script" || true)
> +
> +	if [ "$owner_samples" -eq 0 ] || [ "$next_samples" -eq 0 ]; then
> +		echo "No samples found"
> +		cleanup

We don't need cleanup explictly here, as trap covers exit case?

> +		exit 1
> +	fi
> +
> +	if grep "proc2.*context_switch_loop_proc1" "$tmpdir/script"; then
> +		echo "Thread1 symbol was attributed to proc2"
> +		cleanup

Ditto.

> +		exit 1
> +	fi
> +
> +	if grep "proc1.*context_switch_loop_proc2" "$tmpdir/script"; then
> +		echo "Thread2 symbol was attributed to proc1"
> +		cleanup

Ditto.

Otherwise:

Reviewed-by: Leo Yan <leo.yan@arm.com>

