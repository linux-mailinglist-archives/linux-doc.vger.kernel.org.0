Return-Path: <linux-doc+bounces-96764-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W+HtAw5DVmqo2QAAu9opvQ
	(envelope-from <linux-doc+bounces-96764-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 16:09:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E94A77558BD
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 16:09:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=qssu4yNH;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96764-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96764-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5022324A0EB
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 14:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24FF261B70;
	Tue, 14 Jul 2026 14:03:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71D047CC96
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 14:03:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037837; cv=none; b=ovdHOp4q4a0PkM+A6GLL3nb+MHhYQXNWUQIEb02z1kBY5Lg7b75oFBGnowW9G16wwLpX3JFQK3M1ZmgOvoPlSi3s3QcG4N/n/mkmZ+eYwwlqL7VAWPufTcPBlsnMMB/wrCnLz6cqun7BDXW3a84l964nvGh7xNXs5lRHUBbxkn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037837; c=relaxed/simple;
	bh=xRkmqAVPagu98tjLOHZzIx49Z1VYpgjxKWOBwoic1c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmrndkcjanITefSXXkqyuPhC+DvBUt7nIQXsEpXVV97VEdA7LkwzzKpQUyBm+69yiF+hGhmkWYn/hYZ/BtHWegNXU9miBF9YZCRa68JMvui2Qj1hrCq/SYJWHIAchwzkMuaJQKk6D9PfLzUAAhLd670EnluS+nmwPs3aJ5vhfEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=qssu4yNH; arc=none smtp.client-ip=91.218.175.178
Date: Tue, 14 Jul 2026 22:03:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784037832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EPRJfMeheug2DAfdtztrYEDUrTyLGuw4ObYNq5VPSK4=;
	b=qssu4yNHFyHS4cDOapHrms8U2LhVrhqzi4DRpPrgmwyi8unRTk7GVP4IvYam5YjNXpg5xO
	8gVeWGmsQxeBpeLxUJD4f/T6p/PCvXOx6o+7zZ5GgygNF93EXme4fd+h3xn1MZUZ78jX1w
	J0YouE8epK5ZgBTwL7FBoStdD/6EiQMOP3jnkEPMFT38a8+l5nnuiI55HQIunTMLccFIkp
	QQlGLdPsHlHBbq37J39hgs1mnXTC2TQyraRhIT6hLMjh83TlKuv6dRooEA+yTtyUwjDgV7
	j7YGKQ5STiuIm0W2p9fSAeW3Vb9mEgzxeimve40D5WeKOruVXcOa8/KGkxwYMA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <seakeel@gmail.com>, Dongliang Mu <mudongliangabcd@gmail.com>,
	linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Ben Guo <ben.guo@openatom.club>,
	Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>,
	Doehyun Baek <doehyunbaek@gmail.com>,
	Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: Re: What's cooking in zh_CN (Jul 2026)
Message-ID: <alZBvMsD9gP_rbrd@wyuan.org>
References: <alUXH8qRRjno2eZG@wyuan.org>
 <CAD-N9QVXqYxtsn7YuUtCDWrwwk5+iFAkT2jcs26zbDUfwhAwsQ@mail.gmail.com>
 <alYGtkVxW_0N-VqE@wyuan.org>
 <cc922c1b-49a5-4c3a-855c-af8eb6539f62@hust.edu.cn>
 <b664685e-6785-44ae-8005-443032508096@gmail.com>
 <alYomSIiGeUtQI1I@wyuan.org>
 <53ffbf05-7b2e-4ffa-945d-2a415e843cff@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53ffbf05-7b2e-4ffa-945d-2a415e843cff@hust.edu.cn>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wyuan.org,quarantine];
	R_DKIM_ALLOW(-0.20)[wyuan.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,linux.dev,openatom.club,garyguo.net,qq.com];
	TAGGED_FROM(0.00)[bounces-96764-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dzm91@hust.edu.cn,m:seakeel@gmail.com,m:mudongliangabcd@gmail.com,m:linux-doc@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:ben.guo@openatom.club,m:gary@garyguo.net,m:zhuyan2015@qq.com,m:doehyunbaek@gmail.com,m:qiujiandong1998@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qq.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E94A77558BD

On Tue, Jul 14, 2026 at 09:14:38PM +0800, Dongliang Mu wrote:
> > Dongliang, is the dashboard you want exactly like the one I sent in this
> > email, which is read-only? Or perhaps wish there are other functions as
> > well. For example, you can mark the patch series you have reviewed.
> 
> Actually I just need a list of patches which I need to review, which I
> reviewed before and be resubmitted, and which is applied.

OK, let me think about it for a night.

In the afternoon, I came up with a rather crude method, which is...

Simply directly upload the plain text of "What's cooking" to a website
with Git. But of course, it wasn't updated immediately. It required
manual update. Do you think automatic synchronization is important?
I guess it is expected that the implementation automatic synchronization
will not be too easy, if we want it perfect.

It's not too much trouble for me to update manually now, but I expect to
try using shell scripts to improve efficiency next.

> > I can't find what IMA is btw.
> 
> https://ima.qq.com/
> 
> It is closed-source software from Tencent. This software cannot solve our
> problem.
> 
> I just put all the related linux-doc patches into the knowledge base, and
> ask in NLP about the activities in the linux-doc mailing list

Got it. I'll take a look though.

