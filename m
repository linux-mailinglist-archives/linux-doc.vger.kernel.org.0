Return-Path: <linux-doc+bounces-95536-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mv3IK82WTWpv2gEAu9opvQ
	(envelope-from <linux-doc+bounces-95536-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 02:16:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D43D77209AF
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 02:16:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=OpRIUlNH;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95536-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95536-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2C9D303E48C
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 00:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B0581724;
	Wed,  8 Jul 2026 00:15:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CA0175A6B;
	Wed,  8 Jul 2026 00:15:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469722; cv=none; b=Cehrb2lWPlZ66Z9gVko9+ZTqXSfwrimIMZdvLQbELUP6dWzj2vGr/PVry/I+UZ6vaGzmPp8xG0Gq1ugUA6aFQsy/kW8Dzmt1k6cfUVfBX0AyR6GjtOzIWZKbOYojGzFlaPniE9ddCcbv1FSnDnCqEdR4U7W4rISw1GNHlYHQ4bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469722; c=relaxed/simple;
	bh=c6mOd5Xexy++wyanEkc5J1rjAbH9Ibq2DT44NAKMWMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtmoaTJeONpA8Fe/8P06mBgSzBsXeKmxdJMt7+1gOgNl3r6w1vOpqIQld7By60nf2kNKUu3qlIyMxOWWlDiPAwYeerGP09W8skQYMBzh6nhAkiTSgBmtyLyK9Nq/sTrwijxkjRPhlVIOcsDN4wDCM/Jj6oVLOi6Xu3YdRkjIvT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OpRIUlNH; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=yTHagoYMoy9xKfXCb9YvxyeFtXMp30EDeG+sZbxkGd0=; b=OpRIUlNHj2AVNXq/1XLyYsbFTo
	r+9K5JZVVlpJUqRJ4QsD2hV+OOuiZzcvx0iYKx0FNcpvQ+KnhEjrnkZDqX4xiX62Ff4qwMz7AsAFl
	5qDDWy3GWAumFfYHMXZ01sYVqP9IUi6KNzTXm2MU2dFp+myFyLvIt8J1vZ3OZVeWvI7EEkpBxKrmy
	Nrz5RJhVTIO2x5FeLpcGd0Sv3f3U0PQXkGooz0aGOk6Uk9G6VFPisdbgAhaj5/6iyY3WCJUWQyE+g
	iOe6PwbOdbmE7RobbueH8yy1eb/E+yQ8yIGcJh4zvoRLXcyTyQswAH+VD3xrNbZSGQ15hAnGTV+Ya
	ZWe/9kfQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whFwT-0000000G2wm-16Rx;
	Wed, 08 Jul 2026 00:15:09 +0000
Message-ID: <214b5333-3aa8-40ef-894f-92caec053001@infradead.org>
Date: Tue, 7 Jul 2026 17:15:08 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/Documentation: fix code
To: Manuel Ebner <manuelebner@mailbox.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703115114.229848-3-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260703115114.229848-3-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-95536-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:from_mime,infradead.org:email,infradead.org:mid,infradead.org:dkim,vger.kernel.org:from_smtp,checkpatch.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D43D77209AF



On 7/3/26 4:51 AM, Manuel Ebner wrote:
> checkpatch.pl returns 'trailing statements should be on next line'
> for this file. Do as told.
> 

and the other instances of this check are split onto 2 lines.

> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

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
>  	}
>  	printf("\n};\n\n");

-- 
~Randy

