Return-Path: <linux-doc+bounces-29894-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 076949BC2D5
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 02:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77BBFB21B8E
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 01:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5351262A3;
	Tue,  5 Nov 2024 01:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YGOfZcnL"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF30182C5
	for <linux-doc@vger.kernel.org>; Tue,  5 Nov 2024 01:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730771695; cv=none; b=BCHSyV9wa302AryaHEipM7zUwSUcPdfRh4to5a2kouy40NhWmigUT9m53QId1RbD+BJLagOb9QM3Tl8Uv9gZn7QgoG6kIVHrvJeFyCu4+yJjcaRdtX2HADxaYKAPw+MrwuxXBcp2MHljoRpzDxYeTIFH1UFbEn7r9QwXcVxMmsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730771695; c=relaxed/simple;
	bh=lnJDtrTL1MsNyLMAYR2ZhVsqJk1fB7gvtch5yzbAIqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOHSPtMrtOaGX+vm2JQtslk5T20KO6EO431oibR3d3T604kWj4fTbfyI8QGPI9cXvvIJZStMrL8TE2yz5dnXN7pw8h+iq7laPyDLTWGwYB4lzSc7m42rSoVsUDhr96+PjroejwcUYgyhqohtADIl6Vj/OOMglAg9ER31J9n2OfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YGOfZcnL; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <641acef2-70f4-4172-9fa9-da0f5203a78e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730771691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X8du5UDbJgBaBFsyasBilSMR7ufZ6HPXVdbTI8bmy3I=;
	b=YGOfZcnLRMUrsmTt8X0u0xbAQ8VPhMyfmphdl4jfHEn3/i1lHFww3CMuu/WGe2gdVBwJvF
	cipbF3O+u7/obR7gc6O+JweHH/JPmaRXpCuG4ESiSnyX4ssBnQP1fA5MM3/kmOE6r94vmS
	r7a7qsmInEK1NsBE6af3D1L1L7OHNSs=
Date: Tue, 5 Nov 2024 09:54:36 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH linux-next v8 RESEND] Docs/zh_CN: Translate
 physical_memory.rst to Simplified Chinese
To: Jonathan Corbet <corbet@lwn.net>, xu.xin16@zte.com.cn, alexs@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mudongliangabcd@gmail.com, seakeel@gmail.com
Cc: wang.yaxin@zte.com.cn, fan.yu9@zte.com.cn, he.peilin@zte.com.cn,
 tu.qiang35@zte.com.cn, qiu.yutan@zte.com.cn, zhang.yunkai@zte.com.cn
References: <20241028135321916ZWK032bHhlbncjvmzDkZs@zte.com.cn>
 <87ikt294v6.fsf@trenco.lwn.net>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <87ikt294v6.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/11/5 03:27, Jonathan Corbet 写道:
> OK, I have applied this patch.  A couple of comments for future reference:
>
> <xu.xin16@zte.com.cn> writes:
>
>> Update to commit 7332f9e45d2e("docs/mm: Physical Memory: Fix grammar")
> ...and this I don't understand at all; why do you need to reference that
> patch here?
We use it to mark the progress of the translation against
the original document. If we don't put this tag on at the
very beginning, when the translation falls behind the original
document for a while, we'll have to go through the whole
original document log from the very top downwards, which
is an enormous amount of work. On the other hand, the
checktransupdate.py also works based on this tag.

Yeah, this tag might seem a bit ambiguous. I think maybe
we could improve it? For example:

Trans_mark commit 7332f9e45d2e ("docs/mm: Physical Memory: Fix grammar")

Thanks,
Yanteng
>
> Thanks,
>
> jon


