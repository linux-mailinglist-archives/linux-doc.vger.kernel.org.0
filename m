Return-Path: <linux-doc+bounces-96671-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 55FGMProVWo2vgAAu9opvQ
	(envelope-from <linux-doc+bounces-96671-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 09:44:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCF775208C
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 09:44:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=UMla5DdA;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96671-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96671-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 475A83004C20
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 07:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33532DB7BD;
	Tue, 14 Jul 2026 07:42:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E97825B0BD
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 07:42:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014971; cv=none; b=HUSzkufKR72gzAGhgibxjcenjlTfc9benlcwY6v4cwlPWBLMwMWB9TL1PKNqWZV18K9ekbdwWATArOHt8CdX+tOeNXN1tiMzZA4QK4qdxQDxFYxK5t6bjoIpPbWNku8wR8uuLc4eMz1JrBmhz1PkAl/pZUqDVoXrpxdU2/NtZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014971; c=relaxed/simple;
	bh=ByL07VQCS85YVTgmxIcSn0oZa2l/wDIuK84xh4ma4KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWyZH5wvde2eGZM24RRuLqWOjEVdPX/UWlZQhlx9WAv4kwg4W2mP3xwC3FqRbTdHDMnMUvsU98MNNLlHEgjVQCb8gi/0aTjxQSJ1f5cyJ57rvDtdDFnbiouVB87zP/n62I0zVFaiS0NB8CQS0o3GDzRtbJgZowiPj+z9sUTc9Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=UMla5DdA; arc=none smtp.client-ip=91.218.175.189
Date: Tue, 14 Jul 2026 15:42:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784014967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRLegmZuABzjJn8ZoAzjDyeJsK8X2gXNCaNS7L5h3ms=;
	b=UMla5DdAZHfX/Yhv6Sr+ZthNfrpRO7vEPflZyvF0eDSsEPiZPPiUJ67zQQLLxAu9DJU/IE
	5dJh3w+cdiEv34A/gxPECN/eVleVKRirRCGFdEmjfj1bNjwq7CDHYxYuXc6oz/lEWLIopm
	zx1bWYaya8k0de3Bx0pRbCKKq51uLfVwikNgd0hisbBMcqScdtRbfS29Tk8vZbx+6zKZv+
	khMtCN02n1B3TwWcs4SJudFhGDVllhQNQpsl58fQOK8oiT02MVBDnge7l42jHEQIEHS0Kh
	A8m2yKmhQTf9I9zOf5shEwT6VtFCGTWjlb+ybkhBAKgJDFMwuH9AQDXgLXiANA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <seakeel@gmail.com>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
Message-ID: <alXoZ-n8hIhzHZi8@wyuan.org>
References: <21179a3c-60d6-40b0-a5b1-594e989ef508@hust.edu.cn>
 <alS8lLglyMqJEYZ4@wyuan.org>
 <CAKspUhJTGXzM=UeKTTZYX69NttBuCnAezz=ZOM9imPWLSP5g9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKspUhJTGXzM=UeKTTZYX69NttBuCnAezz=ZOM9imPWLSP5g9A@mail.gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:chenyou910331@gmail.com,m:dzm91@hust.edu.cn,m:seakeel@gmail.com,m:2023002089@link.tyut.edu.cn,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mudongliangabcd@gmail.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cat@malon.dev,m:alexs@kernel.org,m:si.yanteng@linux.dev,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-96671-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[hust.edu.cn,gmail.com,link.tyut.edu.cn,lwn.net,linuxfoundation.org,vger.kernel.org,malon.dev,kernel.org,linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[wyuan.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,wyuan.org:from_mime,wyuan.org:dkim,wyuan.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FCF775208C

Sorry for replying late.

On Tue, Jul 14, 2026 at 03:47:58AM +0800, 葉宸佑 wrote:
> So, to keep everything in one place, my understanding of the plan:
> 
> - Chen-Yu: terminology series for process/ (14 files), folding in the
>   pending 8.Conclusion changes, glossary included; adopt the
>   "update to commit HASH" convention from now on
> - Chen-Yu: read Jon's advice for new-language efforts (Spanish thread)
> - later: a zh_TW how-to document
> - Weijie: investigate which documents may not need translation;
>   monitor the CN/TW lists during the trial period
> - Dongliang: review; patches routed through Alex's tree (pending
>   Alex's confirmation)

I have nothing to correct now. But clear to see you are the one who gets
the most tasks to do. Appreciate it! ;-)

Today I have sent the first "What's cooking in zh_CN", but once your
work showing up on the list, I will simultaneously record and update
information from both sides, simplified and traditional, during this
transitional period, until later decisions.

Best regards,
Weijie

