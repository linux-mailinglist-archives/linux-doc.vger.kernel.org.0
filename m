Return-Path: <linux-doc+bounces-90675-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 16tqHUXxH2rvsgAAu9opvQ
	(envelope-from <linux-doc+bounces-90675-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 11:17:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C17D1636125
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 11:17:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=VIC+l2bO;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90675-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90675-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A92630BDFA8
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 09:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A441737C118;
	Wed,  3 Jun 2026 09:08:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB20C37BE7E;
	Wed,  3 Jun 2026 09:08:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477728; cv=none; b=V0L6Xa6EfQ6yFqLbV0rTZUbMqczYpBUDcQHdQ6xSwwXQgt0EfGRtY8X26S3+bFcAI5OXAqiFq3OqesSQIsj45+1/uT/tlc2IWLmTAv0qS7Py9stPh5f07NFPt7rI66IXTGg2PeHa0iNSgmU4iQhlTO5WX89UVedX2eIkvHPoJOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477728; c=relaxed/simple;
	bh=JfJw0R7L0SlTjl7cN9ao6oUSPyEBft3ic8R9P4imIIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpXM5WQoC1dt9TBIShZB2GTJ2CeW6f+AGQDE49yx2jeV/zTHoAXqdxcAeC0AusVCQUb6AHmptgqzGxC5eZAS4FF3TlTBBw3439f7xgVqVOGJxDp5kih1ezE0s4U615dw5sJrb3h0JRIHhHUfeg5DqEuDPBV+E2myUFZJeoVAHN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VIC+l2bO; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B8A732E3;
	Wed,  3 Jun 2026 02:08:41 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97CFD3F7D8;
	Wed,  3 Jun 2026 02:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780477726; bh=JfJw0R7L0SlTjl7cN9ao6oUSPyEBft3ic8R9P4imIIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VIC+l2bOcGWkZnPySdfpJb3DUf5Q+a/PeG3LyDBDJPMCmTkbGTEfVu7utSF22EQO5
	 T54EUW7jbf9FfFxNgCnge8tqf00MqY/+AABA7z8fyP5tXVQjgXGB0auYHQi1uqgzmN
	 OF6u5RqGVwda/x5gTlizxbvra2xNsj+PwdOPJ6cU=
Date: Wed, 3 Jun 2026 10:08:43 +0100
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
Subject: Re: [PATCH v2 01/18] perf cs-etm: Queue context packets for frontend
Message-ID: <20260603090843.GO101133@e132581.arm.com>
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
 <20260602-james-cs-context-tracking-fix-v2-1-85b5ce6f55c6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-james-cs-context-tracking-fix-v2-1-85b5ce6f55c6@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90675-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,arm.com:from_mime,arm.com:dkim,e132581.arm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C17D1636125

On Tue, Jun 02, 2026 at 03:26:43PM +0100, James Clark wrote:

[...]

> @@ -614,10 +621,12 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
>  
>  	queue = &etmq->etm->queues.queue_array[etmq->queue_nr];
>  	tidq->trace_chan_id = trace_chan_id;
> -	tidq->el = tidq->prev_packet_el = ocsd_EL_unknown;
> -	tidq->thread = machine__findnew_thread(&etm->session->machines.host, -1,
> +	tidq->decode_el = ocsd_EL_unknown;
> +	tidq->frontend_thread = machine__findnew_thread(&etm->session->machines.host, -1,
> +					       queue->tid);
> +	tidq->decode_thread = machine__findnew_thread(&etm->session->machines.host, -1,
>  					       queue->tid);
> -	tidq->prev_packet_thread = machine__idle_thread(&etm->session->machines.host);
> +

Redundant new line.

>  	tidq->packet = zalloc(sizeof(struct cs_etm_packet));
>  	if (!tidq->packet)
> @@ -751,20 +760,16 @@ static void cs_etm__packet_swap(struct cs_etm_auxtrace *etm,
>  		 * Swap PACKET with PREV_PACKET: PACKET becomes PREV_PACKET for
>  		 * the next incoming packet.
>  		 *
> -		 * Threads and exception levels are also tracked for both the
> -		 * previous and current packets. This is because the previous
> -		 * packet is used for the 'from' IP for branch samples, so the
> -		 * thread at that time must also be assigned to that sample.
> -		 * Across discontinuity packets the thread can change, so by
> -		 * tracking the thread for the previous packet the branch sample
> -		 * will have the correct info.
> +		 * Track Exception levels for both the previous and current
> +		 * packets. This is because the previous packet's address is
> +		 * used for the 'from' IP for branch samples, so the previous EL
> +		 * must also be used so that sample shows it originates from the
> +		 * correct EL. Branches can't branch to a different thread, so
> +		 * no need to track the previous thread.
>  		 */
>  		tmp = tidq->packet;
>  		tidq->packet = tidq->prev_packet;
>  		tidq->prev_packet = tmp;
> -		tidq->prev_packet_el = tidq->el;
> -		thread__put(tidq->prev_packet_thread);
> -		tidq->prev_packet_thread = thread__get(tidq->thread);

As here no any code for EL swap, the comment above is a bit disconnected
with the code. Can we just remove the comment to avoid confusion?

Otherwise, looks good. Thanks for maturing the patch.

Leo

