Return-Path: <linux-doc+bounces-96326-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QwxiHpJIUWpiBwMAu9opvQ
	(envelope-from <linux-doc+bounces-96326-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:31:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF95173DCB9
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:31:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=fAJpSy6j;
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96326-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96326-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56722300BD9B
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 19:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD0E36C9ED;
	Fri, 10 Jul 2026 19:31:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9152E7394;
	Fri, 10 Jul 2026 19:31:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711885; cv=none; b=IyDZ2auBBmuSjz/73HmkhCU086w6OCJ8pAQI7Jv+bLQQY4CG/gyyZThsPss78TqiWAFp5HDWbaYMnFAdeNcmCktC9x0Zg3l/NBsNVLcQgoAPj6ZJwGtUSy1WYU26xKfLxepU4aql6QnafPygv1sBEjB6OiHnj+7NiwuxKMrhDbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711885; c=relaxed/simple;
	bh=ButKuriI7LihzXFT+dqUMD9RZxQ/IatSFJuZ4sFck8s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IFRO4qQAywMG+YmxLAgoDYCSR1hS2gtTaisdov5ozlxrtDWDqrIZftlyKitXDgyWg/d1Ym791EztfxmXZpO4xbpL1Bl85IjjLa/3ty+Ayg1oOK8NXyDpVAu8eSS1wYk2yprmPpk1z9p2854Vsyqj1I9WrJvst1cyaUQkgEz0/UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fAJpSy6j; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7AEE64108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783711883; bh=fV9XkOpSyRfws3/SSwUeN+jAeSJ2bBxyNAyKKif59G0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fAJpSy6jS2d05znennkIA1l+Vun9yjJCj3pUetyauissdJh5NIMw8sOHe0mDcboE0
	 6bgkNVXD1zoxRMba4UHeTmalRml+70Mp23Zvf7oLuZrACMPSYtMxRI31sGheyJdYfN
	 /dZDqABc6pcUIIRuqvsTPezj3aByRZP0oWUsvbgpUIrzCWIjBKSSGKW0/oS/4C/hcx
	 Ok1I3yA4npzrLtrqvHDCCfVEOhIZP7o0lZM26Flc9JdYKWpdsUrbTPaYs0e6VXsUrm
	 Zfuio2laGY6V/BOErWQn1voy1R2NHfkfmLvphNMFwG3Owc3nZx7I6/AQ8/uosgIiG9
	 p7N1/fE4So2Xg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7AEE64108A;
	Fri, 10 Jul 2026 19:31:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/Documentation: fix code
In-Reply-To: <20260703115114.229848-3-manuelebner@mailbox.org>
References: <20260703115114.229848-3-manuelebner@mailbox.org>
Date: Fri, 10 Jul 2026 13:31:22 -0600
Message-ID: <87zezyk5f9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96326-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid,vger.kernel.org:from_smtp,mailbox.org:email,lwn.net:from_mime,lwn.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF95173DCB9

Manuel Ebner <manuelebner@mailbox.org> writes:

> checkpatch.pl returns 'trailing statements should be on next line'
> for this file. Do as told.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
> This is the only checkpatch-error in all of Documentation/*/*.c
> ---
>  Documentation/scheduler/sched-pelt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/scheduler/sched-pelt.c b/Documentation/scheduler/sched-pelt.c
> index 7238b355919c..38ff53dcf352 100644
> --- a/Documentation/scheduler/sched-pelt.c
> +++ b/Documentation/scheduler/sched-pelt.c
> @@ -25,7 +25,8 @@ void calc_runnable_avg_yN_inv(void)
>  	for (i = 0; i < HALFLIFE; i++) {
>  		x = ((1UL<<32)-1)*pow(y, i);
>  
> -		if (i % 6 == 0) printf("\n\t");
> +		if (i % 6 == 0)
> +			printf("\n\t");
>  		printf("0x%8x, ", x);

Applied, thanks.

jon

