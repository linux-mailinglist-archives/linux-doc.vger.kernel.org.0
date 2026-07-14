Return-Path: <linux-doc+bounces-96802-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6KQxHh52Vmpo6AAAu9opvQ
	(envelope-from <linux-doc+bounces-96802-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 19:47:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB9475798D
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 19:47:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=Ho0XkK1q;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96802-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96802-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB76031C1C9C
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1277A37B01E;
	Tue, 14 Jul 2026 17:42:47 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9925412BF8
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 17:42:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050964; cv=none; b=bulvCwZUKA0SzvlP+MN9GKWbGFUl3uRalQq/3mj5Aso/4Y7oNpSplpDXykh7Kn5uTL3L+tZNoffj2L3JsU59TX0sqAygh8q8Ruv4KPm4M0z9OljLzN9JBA1ml4d8suDMFYDlIXPkq/aXmLAZ+8e8m2HQGhk2vMqK2cC8j9/W/v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050964; c=relaxed/simple;
	bh=m6zbCx5drc7D0LcJe8ul3eurDPPP20cktNaFUfO+/zM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnVWPCJ+pQyefAPZstJjhswbbhJbLEcdtfaBfMYRsWkvEFMkwSmwaQ8y7ZYYK09jb+kSCHUGn1p75YjW+fZs5T99YIsluC4Oo6Upo0vxzVgFDiEjO0e9UIbpKPYyBpMlw3TjzTPKaDrakqioMQnYfreum4yslEArAw9Xfzzr2rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Ho0XkK1q; arc=none smtp.client-ip=91.218.175.184
Date: Wed, 15 Jul 2026 01:42:27 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784050954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i43EzRs3Ex4WhWCq2zYIh0sOq0NF7L2SAU7qI26pTP8=;
	b=Ho0XkK1qTb+MtkxQi7HwrXC1lXntQgjrT8mIGZBcdOPY7SGR6K/2yWpgYATjrE4yOUAx4T
	q2eoP9aRemiEUjYFiTtqjhBUi8Wt7rxX4pwg7qKzYW44kLk6VCAPVdWZDq10GHG2+KrNY5
	fG5/eGmIy9WEHfgV5peolmzfAwBZo7MKhqsCczBbqbSXyfTHOKe1fyny8YtNwaQRY+S1Z2
	xyj+Tg1bR52QNCTeeQJSEMEezw1sEKq7vEqLzKgBMJJC6kK7LEvFhCU71HQn3qfymckLv4
	3f+Y4ygDHdtmvYHj08STA7zfObJ4ec+DFtAor10tqS4NVdNXdtvGL2O5zoWpDw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Doehyun Baek <doehyunbaek@gmail.com>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Ben Guo <ben.guo@openatom.club>, Gary Guo <gary@garyguo.net>,
	Yan Zhu <zhuyan2015@qq.com>,
	Jiandong Qiu <qiujiandong1998@gmail.com>,
	chengyaqiang <chengyaqiang@tsinghua.edu.cn>,
	Haoyang Liu <tttturtleruss@gmail.com>
Subject: Re: What's cooking in zh_CN (Jul 2026, #02)
Message-ID: <alZ1AzLX8LrB-JFK@wyuan.org>
References: <alZK0i0HvxOvSKwj@wyuan.org>
 <alZP_6nAXNy_HfZi@wyuan.org>
 <CAN-j9UoUHQ2i4H+9G-XK_mOfKKyE9K9-mwUgPc+4yOVfiizgmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN-j9UoUHQ2i4H+9G-XK_mOfKKyE9K9-mwUgPc+4yOVfiizgmA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wyuan.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[wyuan.org:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96802-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:doehyunbaek@gmail.com,m:linux-doc@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:ben.guo@openatom.club,m:gary@garyguo.net,m:zhuyan2015@qq.com,m:qiujiandong1998@gmail.com,m:chengyaqiang@tsinghua.edu.cn,m:tttturtleruss@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.dev,hust.edu.cn,openatom.club,garyguo.net,qq.com,gmail.com,tsinghua.edu.cn];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,doehyunbaek.github.io:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DB9475798D

On Tue, Jul 14, 2026 at 07:05:28PM +0200, Doehyun Baek wrote:
> I "cooked" up a small website this evening that attempts to automate them:
> 
> https://doehyunbaek.github.io/cook-linux-zhcn/
> 
> Every hour, a GitHub Actions workflow scans recent `docs/zh_CN` patches on
> the linux-doc mailing list, groups rerolls, and compares their subjects
> with Alex´s `docs-next` tree to determine whether they have been applied.
> Pending series with no update for more than 30 days are classified as
> "Cold."
> 
> This is still an experimental prototype, and its heuristics may have bugs,
> particularly when threads or patch subjects change. The source is available
> here:
> 
> https://github.com/doehyunbaek/cook-linux-zhcn
> 
> Issues, suggestions, and pull requests are welcome!

Hi Doehyun,

Wow, at first glance, it seemed quite good, as a prototype.

I feel like your UI is kind of similar to sashiko? I'm fine with it.

I guess this might be the thing that Dongliang had in mind. Let's
wait for the comments from those in the UTC+8 time zone after they
wake up ;-)

Btw, for example, my patch (Weijie Yuan · docs/zh_CN: add docs-next
checkout workaround) is actually directly discarded after we reached
a consensus during our communication (with Dongliang). But it's
obvious that we didn't say it explicitly. So your website can't
recognize it automaticly right now. Perhaps we can think about how
to deal with this situation later.

Thanks for your effort,
Weijie

-- 
seems that your email doesn't show up as expected on
lore.kernel.org til now, confused..

