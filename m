Return-Path: <linux-doc+bounces-96421-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yEdYF7p7UmpyQQMAu9opvQ
	(envelope-from <linux-doc+bounces-96421-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 11 Jul 2026 19:22:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB1174262A
	for <lists+linux-doc@lfdr.de>; Sat, 11 Jul 2026 19:22:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=wm4GsIy2;
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96421-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96421-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BC3A301CC09
	for <lists+linux-doc@lfdr.de>; Sat, 11 Jul 2026 17:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090833CC7CE;
	Sat, 11 Jul 2026 17:21:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C592989B5
	for <linux-doc@vger.kernel.org>; Sat, 11 Jul 2026 17:21:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783790518; cv=none; b=I9sACg1K27s5GrR2uAieBApwRbW5M+fl/ph901WQwS4Bo7O5UmA1AmqcZnpJRXWDILshlsoTEs0l3cbS949VR/IMN+fvfNLYRvcLzOUmIXDgDcBvjTISjznEbog1xriJYWRyvBFVKvRfN5/7MKBaeygsQ1XNpwul9XQdcUNyMWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783790518; c=relaxed/simple;
	bh=JAx9OBbyCf7VDk3R8nN+a52HruKSIrRfL8jkjmfaCYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7Ak6y91jHrHoVV41MQQqCRf/VEVZCgTErFrmE/NztIl8n1KOX8glOFyInk2yC8H5kBZBJrQvBDghf6wpyyPtV0L4UOXJNFDhGi7+m2Ma7BhElq8snu1WflycXa8jArwn3OOqoQ4/UyUuHyhonu1wBucoddoYi4IYdaGdSJU4lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=wm4GsIy2; arc=none smtp.client-ip=91.218.175.184
Date: Sun, 12 Jul 2026 01:21:37 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783790514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1wJCJB7Ko+EDwFElwOX16uuWigql3hwBssF2zT1cOQ=;
	b=wm4GsIy2tBuu+rGSTJSoEDOr2VG1XmqPnhTbpxFm9x6oj8jK5OFmHUjDqOphF3Zf2qvero
	y360+jf5S8S3vFI91/Qb8KhiZo4SlPLtKh7kYacCjyB/6mX9BmCQxqpcI/xfn6frEmJvUl
	gQD/1C475Ru4zQm1WjhFSE/LlGYe1e3ZkKU1Y8ubW68NYO2ebtBaOFcSpHlVTJO4nMSFI5
	4E3rVFDwVQbODlOincyiQxOGVGKNw2jGggWSFC7zD0mVZ88MzwtSEY0c/N5F63ojV6Uqx1
	p+lEYrV+jmbuoYJBtxkPFXCiqIAsS9Np1x81aNUqZf2sqouqBvO4wDTST5I/7Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
Message-ID: <alJ7ocaqtpUkCGrd@wyuan.org>
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
 <alDs8bnIK8bWApIr@wyuan.org>
 <57e42f43-44dd-4b22-8d81-c88e20016138@hust.edu.cn>
 <CAKspUhKh=cT_ks1hH9B4G8KppR=XT+THHsmNUFH_irX6xo1SZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhKh=cT_ks1hH9B4G8KppR=XT+THHsmNUFH_irX6xo1SZw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	URIBL_RED(0.50)[wyuan.org:from_mime,wyuan.org:dkim,wyuan.org:mid];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	HAS_ANON_DOMAIN(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96421-lists,linux-doc=lfdr.de];
	R_DKIM_ALLOW(0.00)[wyuan.org:s=key1];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[hust.edu.cn,link.tyut.edu.cn,lwn.net,linuxfoundation.org,gmail.com,vger.kernel.org,malon.dev,kernel.org,linux.dev];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_POLICY_ALLOW(0.00)[wyuan.org,quarantine];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:chenyou910331@gmail.com,m:dzm91@hust.edu.cn,m:2023002089@link.tyut.edu.cn,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mudongliangabcd@gmail.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cat@malon.dev,m:alexs@kernel.org,m:si.yanteng@linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[wyuan.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CB1174262A

On Sat, Jul 11, 2026 at 02:01:46AM +0800, 葉宸佑 wrote:
> Hi Weijie,
> 
> > I think currently having Alex apply your patch is a temporary measure,
> > because the maintainer of traditional Chinese seems unlikely to be
> > available in the near future.
> 
> Thanks for taking the time to explain the bigger picture in such detail.
> Details. I understand the concern: accepting individual fixes doesn’t…
> Solve the underlying problem that zh_TW documents have been facing.
> Stagnant for a long time.

So I'm very glad and grateful to hear more people's opinions. Of course,
that's only my wish, I have no intention of forcing anyone.

> > So if we are doing zh_TW instead of a direct simplified and
> > traditional Chinese conversion, I don't think we can handle this
> > properly without the help of Taiwanese friends.
> 
> For what it's worth, I am from Taiwan and a native zh_TW speaker.
> That is actually what motivated this patch: much of the current text
> reads like converted zh_CN rather than natural Taiwanese Mandarin,

So, back to my confusion again, and quote myself:

How exactly we define the position of Traditional Chinese or zh_TW?

  1. Simple conversion between simplified and traditional Chinese
     characters
  2. Taiwanese localized traditional Chinese

This issue needs to be confirmed by the senior maintenance personnel.
(I will review the archives to confirm. If there is already a clear
definition, please forgive me.)

> and 8.Conclusion was simply where I started. Within my ability as a
> newcomer, I would be happy to help review zh_TW patches or keep
> improving the process/ documents, if that is useful to the discussion
> you are planning to start.

If we are conducting the localization of the traditional Chinese version
for Taiwan, then it would be a good idea to start by continuing
identifying these terminology issues now. However, for such similar
terminology issues, using a series of patches in bulk is better than
sending out one word correction at a time, like previous similar single
patches.

> This is also my first kernel patch, so naturally I would be glad to
> see it applied. That said, I fully respect whatever direction you and
> the docs maintainers decide is best for zh_TW as a whole, and I am
> happy to rebase or adjust it if the discussion lands somewhere that
> requires changes.

Congrats! You have made your first step.

btw, I have no say in any decision, i.e. my proposed direction has no
effect at all. I respect maintainers' decision. At the same time, I feel
ashamed that I haven't made any contribution yet.

> > I can help review patches in traditional Chinese. With the help of
> > LLM, it is fine for me to handle local terminologies in zh_TW.
> 
> Thank you for offering to help with review, and thanks again for your
> comments on v1.
> 
> Thanks,
> Chen-Yu

Yes, thank you very much, Dongliang! But it seems that finding a more
reasonable workflow is the best way to solve the problem. This would
also relieve the burden on our reviewers. The current situation might
not be too bad, but if it keeps going like this, it could be a problem.

