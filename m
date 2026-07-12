Return-Path: <linux-doc+bounces-96441-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HHugACdBU2pMZQMAu9opvQ
	(envelope-from <linux-doc+bounces-96441-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 09:24:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D03E7440E4
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 09:24:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=Z6Fkdk0l;
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96441-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96441-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D17BF3011120
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 07:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AC5370D55;
	Sun, 12 Jul 2026 07:24:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040ED30EF77
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 07:24:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783841059; cv=none; b=jq/j+o+Job+cpKFea1NVG7eCB020avUZzfd3bC4YPKMeHQfN0Qo7jFFap0q/h2F6aGt9xzFp1w+A2yzCcKkTPSO8sMyB7DBb9GOinRLADwZpAKuRppaw/5HM59UC+FG7BXPlHD87RTJyfjMjCVJMwn4vC+tBRyZDJ7IxHbEWYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783841059; c=relaxed/simple;
	bh=FmGfWVl4SPiZQHbm3g0iaQU+LjNa91xTan8Si2TBpjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joIabG1ZWhJc3aZo8nrLgsyZ7S7C7m4GQkYrZsHH1LGJvgY5hFvM3AT7S6I880xngW1Zqp/oLZcu6qpLijVxZzqxMM8SQXlFCU62hF72eydZeE538K9rhwYwxBDZOwa8TTMLd3JASxxDUZa3fOONth+yakO66LWdtFHzZYtNX38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Z6Fkdk0l; arc=none smtp.client-ip=95.215.58.179
Date: Sun, 12 Jul 2026 15:23:51 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783841055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uT0GtxNyEflTuwT/zqAcYMhMTQmP5u1Qq80F4H/LMt0=;
	b=Z6Fkdk0lp64PNSiFy9ecFnfhsA04e30mnIWzbYaezACOOzFoBRNTHRIIRfNW/gsJo+s5pt
	btQl1Da/accb1bjF8Z4+x6rMMl8BDJu2ZsVRSgVXdZIPoRvg2w9996x5UyRULluqxMRV7E
	m7eZtiu8kHA5VQNOkMlvMKMrYTaSPRsBlrwTZahkMf2u+CCEWCSxI6ZWSfQHzluQ+lmS1o
	1DWPOypvaLveRM9HPOjUECgbbGQdA6h4s+2ziaH3aaoGt9udxcUVe4xH/eVNR6xky7K4DO
	4TTHA7TInyBs7+AjFdRfiywGYMqKiTW2GzFTXN7v0AiNQV63iGDxtkxX4B6WvQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <seakeel@gmail.com>
Cc: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
Message-ID: <alNBB1Ju2GGk6Uqu@wyuan.org>
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
 <alDs8bnIK8bWApIr@wyuan.org>
 <57e42f43-44dd-4b22-8d81-c88e20016138@hust.edu.cn>
 <CAKspUhKh=cT_ks1hH9B4G8KppR=XT+THHsmNUFH_irX6xo1SZw@mail.gmail.com>
 <alJ7ocaqtpUkCGrd@wyuan.org>
 <40155119-b6c1-40cc-bbf2-5d1bbe5743e8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40155119-b6c1-40cc-bbf2-5d1bbe5743e8@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	URIBL_RED(0.50)[wyuan.org:from_mime,wyuan.org:dkim,wyuan.org:mid];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_ANON_DOMAIN(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-96441-lists,linux-doc=lfdr.de];
	R_DKIM_ALLOW(0.00)[wyuan.org:s=key1];
	FORGED_RECIPIENTS(0.00)[m:seakeel@gmail.com,m:chenyou910331@gmail.com,m:dzm91@hust.edu.cn,m:2023002089@link.tyut.edu.cn,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mudongliangabcd@gmail.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cat@malon.dev,m:alexs@kernel.org,m:si.yanteng@linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,hust.edu.cn,link.tyut.edu.cn,lwn.net,linuxfoundation.org,vger.kernel.org,malon.dev,kernel.org,linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[wyuan.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[wyuan.org,quarantine];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,wyuan.org:from_mime,wyuan.org:dkim,wyuan.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D03E7440E4

On Sun, Jul 12, 2026 at 12:33:36PM +0800, Alex Shi wrote:
> On 2026/7/12 01:21, Weijie Yuan wrote:
> > > For what it's worth, I am from Taiwan and a native zh_TW speaker.
> > > That is actually what motivated this patch: much of the current text
> > > reads like converted zh_CN rather than natural Taiwanese Mandarin,
> > So, back to my confusion again, and quote myself:
> > 
> > How exactly we define the position of Traditional Chinese or zh_TW?
> > 
> >    1. Simple conversion between simplified and traditional Chinese
> >       characters
> >    2. Taiwanese localized traditional Chinese
> > 
> > This issue needs to be confirmed by the senior maintenance personnel.
> > (I will review the archives to confirm. If there is already a clear
> > definition, please forgive me.)
> 
> Hi Weijie,
> 
> Regarding this issue, we also have Hong Kong and Macau Traditional
> Chinese. While they are mutually intelligible with Taiwanese Chinese,
> there are slight differences. If a Taiwan-specific Traditional Chinese
> translation is required, does this imply that we would also need other
> corresponding localized translations? This is similar to English-the
> English used in the UK, the US, Australia, and so on all differ
> slightly, yet the kernel documentation does not maintain separate
> versions for different countries.

Hi Alex,

Agreed, so I can understand that your point is that Traditional Chinese
(Taiwan) actually doesn't have much practical use?

> Furthermore, aside from a few differences in computing terminology,
> there are no significant differences between Taiwanese Chinese and
> Mainland Chinese that would lead to misunderstandings.

Agreed. 

> In fact, many of the current Simplified Chinese translations were
> contributed by people from Taiwan, like Haowen and others.

Sorry, but I guess he is very likely not from Taiwan.

  1. Based on the recent several patches, his initial translation was
  merely a simple conversion between simplified and traditional Chinese
  characters, without taking into account the local language expressions
  specific to Taiwan. If he were from Taiwan, many obvious linguistic
  habits would surely have been noticed, such as "软件" vs. "軟體".

  2. His previous email domain shows he is studying in the mainland.

  3. His personal blog is written in simplified chinese.

Of course, I have no intention of intruding on others' privacy. I just
merely made a brief observation.

> To avoid scattering our efforts, I suggest we minimize fragmentation
> as much as possible. When it comes to technical documentation
> translation, not literary translation, a straightforward, unadorned,
> and free from misunderstandings is the best translation and easy to
> maintain. Let's keep thing simple, unless sth is really necessary.

Absolutely agreed. These minor issues in expression habits, of course,
will not have much impact on reading.

Given that this document has not been maintained for ~2 years and these
patches to the terminology actually don't have much significance, it
might be more appropriate to directly declare the status of Traditional
Chinese as "Orphan" provisionally for now, and remove it directly in the
near future, until Hao Wen's return and opinion. Or maybe, waiting for a
new good soul to take over, which is unpredictable.

Thanks,
Weijie

