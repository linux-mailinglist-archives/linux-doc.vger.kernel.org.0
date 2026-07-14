Return-Path: <linux-doc+bounces-96652-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w9JTCoa/VWp6sQAAu9opvQ
	(envelope-from <linux-doc+bounces-96652-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 06:48:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5FB750EF6
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 06:48:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=a7+dW88j;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96652-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96652-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8D59303383B
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 04:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0C327FB37;
	Tue, 14 Jul 2026 04:48:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED88C1C84A2
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 04:48:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004482; cv=none; b=LX8K5WAUiDhiqr11aV4M6GsdCBURSRli5emQK280aGRcFyEgbxvB6u+k47C1FPM/xBHtl/BdtRyfkZBfvJjIhVn5/MTDVFrdmGUKX4Deubw5X2ToBO/1jnynqqwulmbL4NXqC708mbBtLvlETLChqitBTSfZQOHQhGIode1+ejI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004482; c=relaxed/simple;
	bh=1DTL3lad3DsRbDrAT57k9DdQqCzT+1nQ8QxATbjq2ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EO6dkwf0APxrQXmlgpUeTBSp9d5FAXRzwIiAg+J0oAiU5pTqEdALlGwN6v4TtzD8Ujv9uGauqEUdXQRi5fgVjxIQoIWZNRmWQzfElBTja7MLeQ2Kr9MO10IPFggo9vqcfeZdXQ6dp8j7/3fKg8fpN+ZhKW3W2Ej6Ym3FveVKcfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=a7+dW88j; arc=none smtp.client-ip=91.218.175.179
Date: Tue, 14 Jul 2026 12:47:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784004478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UqlEIwtC4H5pWHc3e8YOykFGMkRR3yx/OjqBvHx3Mhs=;
	b=a7+dW88jC7h9pr6LmVA6U9avtFizlukEcgjgPDmMzoKvPEaZK+a9dVN6VI2hDo9fSPS6Rx
	+XYZptr+6wos578P6VfzX4EEWmE+NYl1KV4i+8yzC5BmVaKBPJ1BwW3Edsesvqf+DjDkA2
	7jrvyvwpmJYdaDYxxhjAQ7RM9DQxdCI5zp68iN89QwmXDKOP9K7cj2J+Wte2KIq75xb/U8
	7xfe7cBjRqfHeVVVTORP+HLEUaRGZCsKz4M7C+l45KEc9SV1BYEtg8rxLJNZmSQs8N9ace
	aN7twf+5cuc/n43QhLeQnAqK3aOxiWU/A60596wBFE5T7NPakJ1/PtPJHsOF4Q==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jiandong Qiu <qiujiandong1998@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Ben Guo <ben.guo@openatom.club>, Gary Guo <gary@garyguo.net>,
	Yan Zhu <zhuyan2015@qq.com>, Doehyun Baek <doehyunbaek@gmail.com>,
	chengyaqiang <chengyaqiang@chengyaqiang.com>
Subject: Re: What's cooking in zh_CN (Jul 2026)
Message-ID: <alW_di9bNNK9-zqM@wyuan.org>
References: <alUXH8qRRjno2eZG@wyuan.org>
 <CAAJ18eFxjotuhggQ=wkSuXfyz5yVHE0LiP26STdcJwfdwAfF5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAJ18eFxjotuhggQ=wkSuXfyz5yVHE0LiP26STdcJwfdwAfF5w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wyuan.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[wyuan.org:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96652-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.dev,hust.edu.cn,openatom.club,garyguo.net,qq.com,gmail.com,chengyaqiang.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:qiujiandong1998@gmail.com,m:linux-doc@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:ben.guo@openatom.club,m:gary@garyguo.net,m:zhuyan2015@qq.com,m:doehyunbaek@gmail.com,m:chengyaqiang@chengyaqiang.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[wyuan.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,wyuan.org:from_mime,wyuan.org:dkim,wyuan.org:mid,git-scm.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F5FB750EF6

On Tue, Jul 14, 2026 at 10:30:24AM +0800, Jiandong Qiu wrote:
> Just a thought: zh_CN/how-to.rst currently focuses mainly on submitting
> patches. If we want to encourage newcomers to review too, maybe we could
> add some guidance there on how to review, what to check and how to give
> feedback? Curious what others think.

Yeah, Although the current situation indicates that the pressure of
review is not very high at present, gradually distributing the review
work to the community would definitely not be a bad thing. Finally, it
would be best to have Alex, Dongliang and Yanteng handle the last pass.

I see that most of the patches are currently reviewed by Dongliang. This
is definitely fine, but having more pairs of eyes would be even better,
just as Linus Torvalds said.

For how-to.rst, maybe we can add a section?

btw, Git has a doc especially for review:

  https://git-scm.com/docs/ReviewingGuidelines

we can have a look, then let's see what we can do.

