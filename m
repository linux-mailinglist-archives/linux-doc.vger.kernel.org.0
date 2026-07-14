Return-Path: <linux-doc+bounces-96770-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j2QNNFJQVmr83AAAu9opvQ
	(envelope-from <linux-doc+bounces-96770-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:05:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B66756375
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:05:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=w4tw+dVY;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96770-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96770-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B86DA303CC52
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 15:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3533D43D4FB;
	Tue, 14 Jul 2026 15:04:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1948A2DB
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:04:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784041489; cv=none; b=IFudxT2OmwxPGC/Snw7fZhklXxkAKUQIVle9unUqY0UDACtV8F/UcmW8MLoFmX5FFcfCGvIpTvvNhnp4MnPcyFQwwT2P3U6tJXVqUZGo/noJgMz5gfxdF1mQ7/Wq5C7xSGQcfwQ8rJ+PiWt2bgAskOn9cwJnqsWY+khFt8E6Hsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784041489; c=relaxed/simple;
	bh=FQm0/D44eriZgFxyZUYSPGkdP/MWN8tiXTiMftZgk74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pURHdfMFeo0Xh0qmaX3a0Ly+7vkYvhYWh5yrMYtLXMDeqCBSiWk162k0b5fVXPrukwpecSLUlGuFhca5qoFwGAoIhaz7LcvZItsqjRatsF4JWKNaCTwBWuNSiY4HZReK0E+u/q9rkKs19zmI7ZEjIcUAzf+1y3faYMli4Pv8Cb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=w4tw+dVY; arc=none smtp.client-ip=91.218.175.182
Date: Tue, 14 Jul 2026 23:04:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784041484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RHaZnGPSOJaMwyJruAf1dCStR/FTnImQ/vZOaUvpGrw=;
	b=w4tw+dVYOIORNunISMPo8K1FawcQlR9prgkQnJgJHSNGt283/uCmZ5w2a/t9eEjZmst2E5
	imFnSVXozyEmJsGLNMD6/ENP5JciZ902o96e0KMKFuB/sr8uQK5zmOjxBBcgM54y52s1eO
	ewkaKgm/r6ittQ6b93n6YTLHrYefS8Pj/qy/Rz5vqMp9ytlftf2fB+I/2dQ2/wXWz5SMPM
	cQNkj0eSerSwfyREnDdDytUm6O9gtDq1B2upjgklRTDmMXwgx0aUoRBmMPSiwzrGrhfhak
	IwvEfWNAeOYKC7mZB1PD+d8Lbe8YY1iPVhIM+khVZKX0EVb4126j4isV5hVKqw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>, Ben Guo <ben.guo@openatom.club>,
	Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>,
	Doehyun Baek <doehyunbaek@gmail.com>,
	Jiandong Qiu <qiujiandong1998@gmail.com>,
	chengyaqiang <chengyaqiang@tsinghua.edu.cn>,
	Haoyang Liu <tttturtleruss@gmail.com>
Subject: Re: What's cooking in zh_CN (Jul 2026, #02)
Message-ID: <alZP_6nAXNy_HfZi@wyuan.org>
References: <alZK0i0HvxOvSKwj@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alZK0i0HvxOvSKwj@wyuan.org>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wyuan.org,quarantine];
	R_DKIM_ALLOW(-0.20)[wyuan.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,hust.edu.cn,openatom.club,garyguo.net,qq.com,gmail.com,tsinghua.edu.cn];
	TAGGED_FROM(0.00)[bounces-96770-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:ben.guo@openatom.club,m:gary@garyguo.net,m:zhuyan2015@qq.com,m:doehyunbaek@gmail.com,m:qiujiandong1998@gmail.com,m:chengyaqiang@tsinghua.edu.cn,m:tttturtleruss@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[wyuan.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,googlesource.com:url,nju.edu.cn:url,wyuan.org:from_mime,wyuan.org:dkim,wyuan.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5B66756375

On Tue, Jul 14, 2026 at 10:42:34PM +0800, Weijie Yuan wrote:
> Here are the topics that have been cooking in Alex's tree.

This statement is incorrect. I will correct it next time.

Sorry for the noise.

> Copies of the source code to Chinese documentation development tree live
> in here:
> 
>     git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>     https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
>     https://kernel.googlesource.com/pub/scm/linux/kernel/git/alexs/linux.git
> 
> Mirrors:
> 
>     https://mirrors.hust.edu.cn/git/kernel-doc-zh.git
>     https://mirror.nju.edu.cn/git/kernel-doc-zh.git (experimental)

