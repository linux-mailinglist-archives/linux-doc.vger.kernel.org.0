Return-Path: <linux-doc+bounces-96438-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cdHTKD0jU2pYXwMAu9opvQ
	(envelope-from <linux-doc+bounces-96438-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 07:16:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 224FE743EAD
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 07:16:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=woJcWOZK;
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96438-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96438-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE3C23015487
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 05:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1024964;
	Sun, 12 Jul 2026 05:16:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C497E23D2A1
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 05:16:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783833393; cv=none; b=NEvHTVH6TiSgCBPnn/YiCqmivHWLffEPGah2epSlkj7JZCV0fz9MHPHova3zUvk9I1vqbyaIfQQXvmjQz8kQS+DWRz2gu2FAA2k4pwXxOkn9s8uPWiZtvDreRJDpVG4exZNCMdQiVIMVuG7VDPfbDhMbbyBPWLmebCj6OKL6nw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783833393; c=relaxed/simple;
	bh=I9zB1MXYtjXtcX0yfhhLuEHMxDfFPuG/xH9CenBrLBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1Lk7JUirHC/5UGyQm0zCGxs4eZ2Uy7GvH4UOEY9B/EK6XwCbvU0qkJHyj9SOmW80cZ9glcwDcRBaJsrTPoh6HukcuAo81VPjag0PUyL8IQOceOtE5pCqPjXv4+OVrrcFb6Wl1CbSfj8ap+zmdHcF24FuQ1+ozy5FXYz1qmyKyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=woJcWOZK; arc=none smtp.client-ip=91.218.175.170
Date: Sun, 12 Jul 2026 13:15:59 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783833378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TT4s4zK5o3KhRlWbIf4iTrnz4W9alszmWfnQvpsGKvY=;
	b=woJcWOZK6eIcwA6aBswFvaKb73hQlBJembVh+MldF+e2DqNpEgZxu2If2fEqui+C6oKOfN
	ofof+4e3VI01y/9VT/puKBDTt8Km8wvn47Iu/WmPUa3lKibGrLJORJocBwpdE674G9+nq2
	+sCckRxxeJANCJoA6g/zgBA4E2H1X663knscQKvXeLIYwO2V+aT7/w2Mttwg/XXs6N3IHq
	sbUBldbNPcc892jyLPzZcZHgDc8erGr+6I3Gel+gRIjkC4xXpWp18VXmmwjAwKlWgLBYex
	W5ewwcchNLnZ9Dq6U1Srh78cMjsk1p/juIqxrIjAXAW/Yckw4WKgTGGe0b0a3w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
Message-ID: <alMjD_dNWVgPKOlN@wyuan.org>
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
 <alDs8bnIK8bWApIr@wyuan.org>
 <57e42f43-44dd-4b22-8d81-c88e20016138@hust.edu.cn>
 <CAKspUhKh=cT_ks1hH9B4G8KppR=XT+THHsmNUFH_irX6xo1SZw@mail.gmail.com>
 <alJ7ocaqtpUkCGrd@wyuan.org>
 <87wlv1i985.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wlv1i985.fsf@trenco.lwn.net>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	URIBL_RED(0.50)[wyuan.org:from_mime,wyuan.org:email,wyuan.org:mid,wyuan.org:dkim];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	HAS_ANON_DOMAIN(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96438-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,hust.edu.cn,link.tyut.edu.cn,linuxfoundation.org,vger.kernel.org,malon.dev,kernel.org,linux.dev];
	R_DKIM_ALLOW(0.00)[wyuan.org:s=key1];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:chenyou910331@gmail.com,m:dzm91@hust.edu.cn,m:2023002089@link.tyut.edu.cn,m:skhan@linuxfoundation.org,m:mudongliangabcd@gmail.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cat@malon.dev,m:alexs@kernel.org,m:si.yanteng@linux.dev,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[wyuan.org,quarantine];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
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
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wyuan.org:from_mime,wyuan.org:email,wyuan.org:mid,wyuan.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 224FE743EAD

On Sat, Jul 11, 2026 at 02:04:26PM -0600, Jonathan Corbet wrote:
> Weijie Yuan <wy@wyuan.org> writes:
> 
> > How exactly we define the position of Traditional Chinese or zh_TW?
> >
> >   1. Simple conversion between simplified and traditional Chinese
> >      characters
> >   2. Taiwanese localized traditional Chinese
> >
> > This issue needs to be confirmed by the senior maintenance personnel.
> > (I will review the archives to confirm. If there is already a clear
> > definition, please forgive me.)
> 
> "Senior maintenance personnel" in this case is the people who actually
> step up to maintain this translation.  There is no higher level of
> authority that needs to somehow sign off on it.

Yeah, so, due to the current special circumstances, I actually mean that
I want to seek the opinions of the Simplified Chinese team, and then
finally have you Ack.

> The existing translation is essentially abandoned; if somebody wants
> to carry it forward -- and stay with it -- with a shift in focus, I
> think that is just fine.

Yes, hope that the following discussion will lead to a consensus.

Thanks,
Weijie

