Return-Path: <linux-doc+bounces-95421-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ehczLMo2TWrEwgEAu9opvQ
	(envelope-from <linux-doc+bounces-95421-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 19:26:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7F671E450
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 19:26:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=Tfnc8iXd;
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95421-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-95421-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D7A7B3082195
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 17:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30AE43B6F5;
	Tue,  7 Jul 2026 17:16:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98734438FFE
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 17:16:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444563; cv=none; b=N/w1RYLczY3aLWU7rpSBeCFkaxlEZ9IBJfierNhxAnhqHlGYtSXmV5kpx79+WnQ+TcaoYsz0+TE2nq0UQcdyXHb4wZXUFP2I5bfz5Zjx58xZYT0mckzCRPBzkCyfpu+t4fDyiVEybwTcfjfJq3rvEFxZqe4shpQzgu0a4HXwuSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444563; c=relaxed/simple;
	bh=J1NJAqJd0+2yp2rJbqg03l9JTwd56gX041yd0Qlbj54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InC4JOEGufcYh1cpfuBPn08Enf4BYov3J1qMr90iubqPZOeUGMJJNF9NhshxNpZ9OFDjaVIQoB5kdnnAQeFiY65SGo5/qztfv0wJPvDisEpqIlHsItM1kTkaKjGgyjIwZskPKBvbNKoAIm3I46wVD6rWlQMqeVf874+NLpjdrt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Tfnc8iXd; arc=none smtp.client-ip=91.218.175.186
Date: Wed, 8 Jul 2026 01:15:33 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783444549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=96tfVeSKwDpe3fmshkL4hBunqhjvw1uJNIWp3vD4uR0=;
	b=Tfnc8iXd130BWRlWQ/r7R+8oQM45LG2pbNr/hRZZcz4mX8Fl7uaE+7vpEKbVM8bTGcTQub
	/59372eeKKhhKd04Lcby6mBn0bNelqDqa8KAxsHgGPZkCLEpgOBOnjpFlZpaG5n43oJei2
	L2AIej2cS26XE2wdJFa9OmFUm/Cf9QPDhz1XMZjxS5/8yGKLuiRNnpgTQK4rstCmJWlW1h
	GCVVdMQBUy0FwQC1sIG1VSvTOobMdWR0s53XagnsEBkRrmAHtppYRtoUT5r1F3D5mglKTD
	mjpipKujetHBRETJJfosuyqLKGrx52JYWEQun6FR89OU7sGyAm6oPAkPahTYMA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Yan Zhu <zhuyan2015@qq.com>
Cc: Alex Shi <seakeel@gmail.com>, dzm91@hust.edu.cn, alexs@kernel.org,
	corbet@lwn.net, frederic@kernel.org, gpiccoli@igalia.com,
	jani.nikula@intel.com, kees@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, longman@redhat.com,
	mchehab+huawei@kernel.org, si.yanteng@linux.dev,
	skhan@linuxfoundation.org, tony.luck@intel.com
Subject: Re: [PATCH v2] docs/zh_CN: update admin-guide/index.rst translation
Message-ID: <ak00NR3kdjrpqjIP@wyuan.org>
References: <4534170c-700d-43b5-ad32-6b91455b3f14@hust.edu.cn>
 <b7606f72-eb55-41a7-b685-00164050e159@gmail.com>
 <tencent_94CB9DE57F16CF5DCED1C6983002CD3BB106@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_94CB9DE57F16CF5DCED1C6983002CD3BB106@qq.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wyuan.org,quarantine];
	R_DKIM_ALLOW(-0.20)[wyuan.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-95421-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	FORGED_SENDER(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:zhuyan2015@qq.com,m:seakeel@gmail.com,m:dzm91@hust.edu.cn,m:alexs@kernel.org,m:corbet@lwn.net,m:frederic@kernel.org,m:gpiccoli@igalia.com,m:jani.nikula@intel.com,m:kees@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:longman@redhat.com,m:mchehab+huawei@kernel.org,m:si.yanteng@linux.dev,m:skhan@linuxfoundation.org,m:tony.luck@intel.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[wyuan.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,hust.edu.cn,kernel.org,lwn.net,igalia.com,intel.com,vger.kernel.org,redhat.com,linux.dev,linuxfoundation.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,wyuan.org:from_mime,wyuan.org:dkim,wyuan.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD7F671E450

On Sat, Jun 13, 2026 at 12:11:36AM +0800, Yan Zhu wrote:
> 
> Hi Alex:
> 
> On 6/8/2026 9:40 AM, Alex Shi wrote:
> > Applied, Thanks!
> 
> Can you confirm whether this patch has been merged? I couldn´t find it in
> the repo:
> https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/?h=docs-next

It seems that Alex missed this patch. I can't find it, too.

