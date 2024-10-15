Return-Path: <linux-doc+bounces-27504-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A77799DC45
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 04:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68551282C35
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 02:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DF9184F;
	Tue, 15 Oct 2024 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RySrbUZE"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E94279C8
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 02:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728959421; cv=none; b=CvpD3LJ23N9L9IWCjc7lrcj6QRfotvyW+8Vzsz6lqUyyomNeiM9WQGv116Y6Yvv48QfRORnAHQEPqC3qkoeqUk7wRPdWnVQcXZ8r5dZ9UuwbqNQcDhhHqA3GX75I/wfaEqKeWuV49ME90CtPGX20A0+0ElVaQ6j8VzUo8A808Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728959421; c=relaxed/simple;
	bh=2sxZOK4UHRWx8tg1DEY0UMfzL5hHYaCPT4wQ7R22VjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muDL94Ou7CICf5HjJFXTNrhPOo3s0SUxxwjC7nDYfNJ4gX9Y6EGmShclb4rybvS7E+VnBhEUpgXlrYxIrp5mYGFNlLwK8V+33IKNkt9xyGVy7WW+iDfqO/6jsVl78gZxHaMeDsmsajSxBQEU8otdZH2oYpNeACcl9julc92kcF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RySrbUZE; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <47e92158-4fdb-4fd7-808c-b6735d7ee787@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728959417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unwgkNzP3UT467HzdUb952mpfMEMHs6MjC417zS7fas=;
	b=RySrbUZE/lXwwJUWkhUBTrwuG0KgwEnj/AtMBzMBeCJJkXoTk8+AtQWj5k06c8Kx9bK3xB
	WCDp6f26NHpU139ck2710QHijTvsI+NnnBH8RQBc58Vs34XkyDjDpbG1r0QKiaB8xpEqpz
	SWtuknJwub2mR9rUHF7pRDGwpnpKxPE=
Date: Tue, 15 Oct 2024 10:30:08 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 3/3] Docs/zh_CN: Fix the pfn calculation error in
 page_tables.rst
To: Pengyu Zhang <zpenya1314@gmail.com>, alexs@kernel.org,
 siyanteng@loongson.cn, corbet@lwn.net, seakeel@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 yaxin_wang_uestc@163.com, zenghui.yu@linux.dev
References: <20241014155526.17065-1-zpenya1314@gmail.com>
 <20241014155526.17065-4-zpenya1314@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20241014155526.17065-4-zpenya1314@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/10/14 23:55, Pengyu Zhang 写道:
> Synchronize the changes of origin document to fix the pfn value.
>
> Signed-off-by: Pengyu Zhang <zpenya1314@gmail.com>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   Documentation/translations/zh_CN/mm/page_tables.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/mm/page_tables.rst b/Documentation/translations/zh_CN/mm/page_tables.rst
> index 544381c348b1..b0700a5a8bf1 100644
> --- a/Documentation/translations/zh_CN/mm/page_tables.rst
> +++ b/Documentation/translations/zh_CN/mm/page_tables.rst
> @@ -32,7 +32,7 @@ Linux 将页表定义为一个分级结构，目前有五级。对于支持的
>   在页粒度为 4KB 且地址范围为32位的情况下，pfn 0 对应地址0x00000000，pfn 1 对应
>   地址0x00001000，pfn 2 对应地址 0x00002000，以此类推，直到 pfn 0xfffff 对应
>   0xfffff000。如果页粒度为 16KB，则 pfn 分别对应地址 0x00004000、0x00008000
> -... 0xffffc000，pfn 的范围从 0 到 0x3fffff。
> +... 0xffffc000，pfn 的范围从 0 到 0x3ffff。
>   
>   如你所见，对于 4KB 页面粒度，页基址使用地址的 12-31 位，这就是为什么在这种情况下
>   `PAGE_SHIFT` 被定义为 12，并且 `PAGE_SIZE` 通常由页偏移定义，为 `(1 << PAGE_SHIFT)`。


