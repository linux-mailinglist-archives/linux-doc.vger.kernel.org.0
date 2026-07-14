Return-Path: <linux-doc+bounces-96636-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FpYHEYeZVWqsqgAAu9opvQ
	(envelope-from <linux-doc+bounces-96636-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 04:05:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F2A750426
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 04:05:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Tqq3JmJh;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96636-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96636-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB6F53066C7F
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 02:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4116F353A89;
	Tue, 14 Jul 2026 02:03:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F3E2E8DEB
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 02:03:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994639; cv=none; b=rRyR2qZnoaiGyBg4dmvTWwKUgTboDXakTJwfgDJoyTK5frPhnqlsr01b18efLetkfSn6NXesAy6rYSxvx7LIkopY6SVRwUFUhTvfT9UWOtVXhBIcZqTd2e4N5CChOFjeT08BnIX2ttoiTr+H/S0PDbos4Ih1ELbZiy2dZNgnMKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994639; c=relaxed/simple;
	bh=ozkog/RnGn3LuFyMlOdGtrHtxq/zKl62NHTNRGGOmqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aBBgtb9YGMmHR+epEK3atEX8gDWMz1xprnHap7ojMN5O7DFXYhEvZCuQRzs5Ua2NP9nFjTNrlohnQhl3dKLh+Tk6Fe1cpKQX5wl74m3DiiImsxGsqbAoIuFgfypaJhg1Jb7efubqcJjlTLPaxunfegzfOF1Lb2DjKoVlYvrfbVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tqq3JmJh; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso3913045ad.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 19:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783994637; x=1784599437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRnYc0k9lbHcJGtREvZxIP0Yu0SJQoy1iVWHuBHgJoM=;
        b=Tqq3JmJhEVExiqMscO8y4msAIaNk5Fr9i9V/S4pPuzQPeZd/Fqrn1UJoIVdHOpp1S0
         jnbaYxMKRlcGWq92eKRle19pj09hYAAPh/s+Ytd3GSAzHrTEYwYaVG7p0xiyGYjhtS3P
         NRYLQufoAt0fwLFp3qfKMdFpQcZqczLILGeTqeREjTDrAwpQ8DZy76pfjQJ3hnZ8dO+e
         /7ACbx3h6GMOwfSKt2ynJgoQ3NDbP80wugzyHP78u2GuCZuVIPS94sAlATANgey5jFl4
         QtW3/AkMZd2U4AwrGEVwvY37RbHmmVDb8mK4JGh2j3sAYgJT6k+I0u/D7hTruEzprtMm
         9D/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783994637; x=1784599437;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRnYc0k9lbHcJGtREvZxIP0Yu0SJQoy1iVWHuBHgJoM=;
        b=Y5vE1WGhYJY8ojjsAmglJoAr90Q4RKJrLORXfi8iBrUCpVlbmy7zCAV5gRTXnSP3L0
         iEo2gfDOnfWkpOFlXllVEQdS4B14qIpbD+0APwbupws1ZckL4h1zjA48iTtmf91HbOt0
         6hFXdjuB6eyJ2l3S4fUPYdA6g1XLAva7Oql/bBai7vAOG3lKSZVE1C+JRl1eC0G6Nq5h
         /0C3kypkur5ehHhyWZQcpwnLl7wW7B4Qid9ZK8XIgNKMlB6TfX48dH6h+PD3wmJGiz/H
         k+vfzkyoSyMPUC4Y4G6q+QSyRFaXJPBrfcqE9OIxbpg88ZNbPl382zD4MaqSswWla1ms
         hQ5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqc07+/SOXZzAw4h5zYvhYkqv5clNFyl6Vo2JKfhcv4mPA+v3bXAG/IipFTcbyvXub9boAG9sL6+n0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw198QfqkTKhtzbv9Oasm7x7jix/Mo5UTcffXXVrHlOZQpMIP+A
	r074GFhBtXdkwn+qy5pj0knxeAuYMrw78WssbmaEKheGfaAadl0kyrIo
X-Gm-Gg: AfdE7cnFK6Gd+fsDjcIshVkbjU+O191pK34otnsajXh3YlhONU90uXH6KCLLYmwTAfk
	+oD/vuOEKDa8BOhKE9VcE7CEqf+kPlVQnFx7naARPrppn9vS2s26OwBJRir66aNDCwG7AC15D/i
	U6DGD0tNMqdy4045ZUakJCDTKHzgW2bRiEFJFK38VSqIsEvAC379YfMYpSJnrIDnpbC2mbu+cei
	mXQeIDXJQ5eWx6wF2xBdts3rFuRQofw0gq5J+O7B7ag/68GCmcAisXzp8n5tDUuyOG1cPXEBmrC
	8fAiV8CN5nAJWt92DOUE60YoWg8NEmmpwEyx0LWXMeFQz2JA2c6UWuYLtTJ2tWStUVngiLBQIU9
	goTc56ufpWbJO8/4rOEG/wXU0NUdf0BZAl9K787skE/TtCl53NbD2ZDhs+5cJfimbyzW88061O6
	UCOPZLAgx9YzcRBDEs5hOxWzcUmxWzbOrXX9Uc+Y0TDKov9zX9VSQTWQ==
X-Received: by 2002:a17:903:8cc:b0:2ca:106c:7122 with SMTP id d9443c01a7336-2ce9e5a4c5emr106436265ad.9.1783994637363;
        Mon, 13 Jul 2026 19:03:57 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:3a01:ce86:5400:dbd7:7cc6? ([240e:38b:e68:3a01:ce86:5400:dbd7:7cc6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdcbe2sm109626225ad.9.2026.07.13.19.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 19:03:56 -0700 (PDT)
Message-ID: <aeedf791-adf1-4726-ba6f-8ae3516bb23b@gmail.com>
Date: Tue, 14 Jul 2026 10:03:49 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What's cooking in zh_CN (Jul 2026)
To: Weijie Yuan <wy@wyuan.org>, linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Dongliang Mu <dzm91@hust.edu.cn>, Ben Guo <ben.guo@openatom.club>,
 Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>,
 Doehyun Baek <doehyunbaek@gmail.com>,
 Jiandong Qiu <qiujiandong1998@gmail.com>,
 chengyaqiang <chengyaqiang@chengyaqiang.com>
References: <alUXH8qRRjno2eZG@wyuan.org>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <alUXH8qRRjno2eZG@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96636-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,hust.edu.cn,openatom.club,garyguo.net,qq.com,gmail.com,chengyaqiang.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[seakeel@gmail.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wy@wyuan.org,m:linux-doc@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:ben.guo@openatom.club,m:gary@garyguo.net,m:zhuyan2015@qq.com,m:doehyunbaek@gmail.com,m:qiujiandong1998@gmail.com,m:chengyaqiang@chengyaqiang.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seakeel@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93F2A750426



On 2026/7/14 00:49, Weijie Yuan wrote:
> Hi all,
> 
> Since I made many noise these days on the list, which took up a lot of
> maintainers' time. This email summarizes the patches for zh_CN that are
> currently pending on the mailing list.
> 
It's a great summary.

Contribution isn't only from submit patches, but also from actively 
document build, review, status update!

Thanks for you all!

