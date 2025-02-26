Return-Path: <linux-doc+bounces-39475-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0E8A45585
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 07:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA18D3A35DB
	for <lists+linux-doc@lfdr.de>; Wed, 26 Feb 2025 06:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37081925A6;
	Wed, 26 Feb 2025 06:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UDfvlGaR"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82A929D0E
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 06:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740550970; cv=none; b=AtrwSTkdpuY4vnnvK53jvcomACe2pBpU6oRIZvdUCtE7BljedAmPQmfPn+9RjYCU12t3kIaqCwH0ubkVMqqGIecV09grfNv/w2BMG+KriWjvLM4Eo0wBahBJCdnOyXJ5o61v35bXAm/k/Dou//vJnXh19jFbMjOr4JN1rYkoI3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740550970; c=relaxed/simple;
	bh=gaGT5q2hJkeCFwVBIUxi+ItVgLmJ9uiRm2cydxHO080=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EabIPzvbP57jp2hf9mZMJPvmKsN6g7LCBvqFT1/j9+6dlFK2nBWP48hCamGciDxzBn9NiZTPEqpId7Mr7zP/docRtFvVWpTV+EN5+uv2Y+/O+YLLsHtDhTvwFM6FS12mI/jvph8noZvtWXI7UzDq4zwsEvrVre4uJroaqvn+HMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UDfvlGaR; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <a060cc7e-3d99-4483-937b-3a20476eb6b6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740550965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p84KZbYiIU6m9SlSsr+aRK2OA82hVN0ETZwtDueX4s8=;
	b=UDfvlGaRHhHPkYtzzkJJsBohOAOqzj/RWd0TDW9TX9i4bnBDcW5cnu0No6nP1PvOQwuMIc
	2Vf693IH3A7zq2ZyYSpRH7I37QZB9lSTvtu4u4JWAcG5yh/KMKWfBQiIEcqvVuG4yjl1DI
	+T6Uvxd4PGrc3rUzSDZhrlN2lm0a8sE=
Date: Wed, 26 Feb 2025 14:22:37 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH linux next] Docs/zh_CN: Translate msg_zerocopy.rst to
 Simplified Chinese
To: yaxin_wang <yaxin_wang_uestc@163.com>, corbet@lwn.net
Cc: alexs@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, xu.xin16@zte.com.cn, yang.yang29@zte.com.cn,
 wang.yaxin@zte.com.cn, fan.yu9@zte.com.cn, he.peilin@zte.com.cn,
 tu.qiang35@zte.com.cn, qiu.yutan@zte.com.cn, zhang.yunkai@zte.com.cn,
 ye.xingchen@zte.com.cn, jiang.kun2@zte.com.cn
References: <20250226014942.2586561-1-yaxin_wang_uestc@163.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250226014942.2586561-1-yaxin_wang_uestc@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2/26/25 9:49 AM, yaxin_wang 写道:
>> <jiang.kun2@zte.com.cn> writes:
>>
>>> From: Wang Yaxin <wang.yaxin@zte.com.cn>
>>>
>>> translate the "msg_zerocopy.rst" into Simplified Chinese
>>>
>>> Update to commit bac2cac12c26("docs: net: description of
>>> MSG_ZEROCOPY for AF_VSOCK")
>>>
>>> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
>>> Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
>>> Reviewed-by: xu xin <xu.xin16@zte.com.cn>
>>> Reviewed-by: He Peilin <he.peilin@zte.com.cn>
>> So how did these reviews happen?  I have certainly not seen them on the
>> public lists...
>>
>> Thanks,
>>
>> jon
> xu xin and he peilin are my colleagues. They helped me with the internal
> review of the document and did not participate in the public lists review.

Unfortunately, this cannot be archived in the lore, so it is not suitable

as a basis for community review. how about:

:翻译:

    王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>

:校译:

    - xxx <xxx@xxx.x>

    - xxx <xxx@xxx.x


This can better highlight their contributions.


BTW, If your colleagues want to appear in the signature

section of the patch, subsequent patches can be reviewed

on the mailing list. Everyone on the mailing list has the

right to observe the review process.


Thanks,

Yanteng



