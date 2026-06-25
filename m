Return-Path: <linux-doc+bounces-93559-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TDb9FrlNPWod1AgAu9opvQ
	(envelope-from <linux-doc+bounces-93559-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 17:48:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BA16C7298
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 17:48:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=BJ+0i3vO;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93559-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93559-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54610305D840
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 15:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493CB2701B8;
	Thu, 25 Jun 2026 15:47:58 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E84325A2B5;
	Thu, 25 Jun 2026 15:47:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402478; cv=none; b=InDUhCQbTly3uzWFs04kf6NT4G/aaWLbbBJ7PSkHRCDVUMxN7pAHpk8SckxnqVSlXe46Xm8TmmdDURki54WgOjJM16Kk9KbKeS7XFS7YR0mX1VKovSjlNnCIqwpuT4hxEAPQTzUS8LLIoXdLHxqOcNj4fWOhRtEl66amEDxm2vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402478; c=relaxed/simple;
	bh=r10z/XNbEr3FGkYVC/xlcllUoZrQUAtdbL3x+Hji+nQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LUK7/nEqbVZ+EwmhRQzYQGOcv1sKC6IoJ2xcFTR7aGKgBXBypLCinxSyAle6vQoa3/7ciQHbvll4HhGCDb2WyUNgcTIxxF8UAbakaMbRib6Qc6/0iw1yQJFo5aZip5q3L5fIPLLuWhpYp5/NYJRIeyVBIfxiyjYO7L7j+1DdrpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BJ+0i3vO; arc=none smtp.client-ip=220.197.31.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=r6
	Z+vqofs0Z6XLmf3qaOWgKbrty7AYM+MhIKhql/k/c=; b=BJ+0i3vO8qcoWYiv2K
	GQGz965AfiIcdGiYYL3f7WBt7n6pM69GbCMne0DqSEAsC3fZtq8T0fx2zC8IGNdX
	SSQlL0Y0RAiOn3TS6cgwtZNxTjPv1NNq4s5e9SQp/YszK4M454pzZ8RTr1hVNP5M
	UZ7yvCElrWX6gwzlCkjklUvgQ=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDXgmsyTT1qofsSDg--.30639S2;
	Thu, 25 Jun 2026 23:45:56 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	alex.aring@gmail.com,
	allen.lkml@gmail.com,
	arnd@arndb.de,
	brauner@kernel.org,
	chuck.lever@oracle.com,
	corbet@lwn.net,
	david@kernel.org,
	ebiederm@xmission.com,
	j.granados@samsung.com,
	jack@suse.cz,
	jackzxcui1989@163.com,
	jlayton@kernel.org,
	juri.lelli@redhat.com,
	keescook@chromium.org,
	liam@infradead.org,
	linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mcgrof@kernel.org,
	mingo@redhat.com,
	mjguzik@gmail.com,
	peterz@infradead.org,
	pfalcato@suse.de,
	vincent.guittot@linaro.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH v4] coredump: Add /proc/<pid>/coredump_pre_exit for pre-exit before dumping
Date: Thu, 25 Jun 2026 23:45:54 +0800
Message-Id: <20260625154554.1226457-1-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aj0cUrwdXYKIicC-@lucifer>
References: <aj0cUrwdXYKIicC-@lucifer>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDXgmsyTT1qofsSDg--.30639S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFykZry5Aw43Kw4ftry3CFg_yoW8ur4xpF
	WfKryakr1ktr4Ikr97uw47Za4Yv348Ka43WrnxW392krW5uF1xXrWI9F4Y9F1DWFW0kr1I
	qrsrZas8Aa45JFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUn_-gUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbC6BVKVGo9TTW94AAA3R
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-93559-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jackzxcui1989@163.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:alex.aring@gmail.com,m:allen.lkml@gmail.com,m:arnd@arndb.de,m:brauner@kernel.org,m:chuck.lever@oracle.com,m:corbet@lwn.net,m:david@kernel.org,m:ebiederm@xmission.com,m:j.granados@samsung.com,m:jack@suse.cz,m:jackzxcui1989@163.com,m:jlayton@kernel.org,m:juri.lelli@redhat.com,m:keescook@chromium.org,m:liam@infradead.org,m:linux-arch@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:mcgrof@kernel.org,m:mingo@redhat.com,m:mjguzik@gmail.com,m:peterz@infradead.org,m:pfalcato@suse.de,m:vincent.guittot@linaro.org,m:viro@zeniv.linux.org.uk,m:alexaring@gmail.com,m:allenlkml@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackzxcui1989@163.com,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,gmail.com,arndb.de,kernel.org,oracle.com,lwn.net,xmission.com,samsung.com,suse.cz,163.com,redhat.com,chromium.org,infradead.org,vger.kernel.org,kvack.org,suse.de,linaro.org,zeniv.linux.org.uk];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02BA16C7298

On Thu, 25 Jun 2026 13:48:10 +0100 Lorenzo Stoakes <ljs@kernel.org> wrote:

> +cc missing maintainers, lists.
> 
> NAK.
> 
> This is un-upstreamable for numerous reasons.
> 
> The stuff you're doing in mm is broken, wrong and invasive and you've not
> even bothered to cc- mm people. I'm annoyed by this.
> 
> You're also doing incredibly silly mistakes at v4 of something that should have
> been an RFC.
> 
> You don't seem to understand the concept of patch _series_ (break it up into
> smaller patches!!!) and you haven't bothered cc'ing maintainers whose subsystems
> you're radically alterting.
> 
> I'm annoyed as you have a history where you were told not to add insane hacks
> before ([0], my reply at [1]).
> 
> [0]:https://lore.kernel.org/all/20260116042817.3790405-1-jackzxcui1989@163.com/
> [1]:https://lore.kernel.org/all/14110b70-19e7-474d-b0dd-ba80e8bed9b0@lucifer.local/
> 
> Was I wasting my time there? Am I wasting my time responding now?
> 
> And how hard is it to run a simple perl script?
> 
> Let me run it for you for _just_ the maintainers:

I probably shouldn't reply to this email to waste more of your time, but I
can't help but respond because your comments have been very beneficial to
me, and I enjoy the process.

The v4 version has changed too much compared to the v3 version. I should
have re-executed the "get maintainer" script, but I mistakenly copied the
previous email list and sent it out. I sincerely apologize for that.

There are quite a few issues now, and I haven't come up with a good
overall solution. I actually want to resolve the problems we encountered
in our project with minimal kernel modifications, but I can't think of a
good way to do it. It seems that the v4 version has turned out to be a
complete disaster of a patch, and I sincerely hope that my example won't
be used as a counterexample in the future. Thank you for that.

Suddenly, I have some thoughts about this issue, but I even question
whether I should have these ideas. Let me sit down and sort things out
properly. I hope the v5 version won't be a disaster.

Thanks
Xin Zhao


