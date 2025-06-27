Return-Path: <linux-doc+bounces-50898-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90351AEAC66
	for <lists+linux-doc@lfdr.de>; Fri, 27 Jun 2025 03:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC70F1BC8434
	for <lists+linux-doc@lfdr.de>; Fri, 27 Jun 2025 01:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA9542AB0;
	Fri, 27 Jun 2025 01:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v46bSIZp"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706A22F1FE1
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 01:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750989000; cv=none; b=AAg7Goe2E7Op4Cirf6/h+RRXbJLPx7MRHZVB4ZR7trPsdrmRWUttjdwTxI0YW401nvJKtZjHOZDgX1x2Ci7VGgA1xK44vt698zfTAY6alwH4EmyM7lnMeQBLvlEZ2wFmpJ3M4iu/DGXtuP2ANtrNdVDHNtGlESnKal7vJpNFRw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750989000; c=relaxed/simple;
	bh=3nPHcBr9VPxqIpcA5OSSsKd7izPqeuu7C8zkzNyw5UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lq6WeZdNGQOEsaF0cfD/dDFhFqktaZLye4FNOT3h36wgXwFXaKfAo1ns0cgduKZGaKL+lbG4JpP5FToePzy3DCLkrNLVWZ4SsbIKT+7n7Y5zf4SdirxglwBpnCam07EWW02pCkHlIjutXRZ2oLq0j0KiMyTQK8ZQpLOtBaMFhb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v46bSIZp; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <cf9c5301-653c-47cb-96c5-7de6eb669090@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750988986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c7R0jZJ+khVxxiVMQBXEsj1yZh29i/rPO3nka5fu5RU=;
	b=v46bSIZpNT4SJQo/SQ3QWC0jnr1EdLG/eOsKxb6HEepdkAlhC0dsUKCOEunSJt2cJExpRQ
	wKrSSeeSkKmMEash898IHL7VwmGSPz9mQMb60Vz3/rmlmO9vHRyTPOvZHAVrqGwYoBABWX
	TujgQGZ6SyuZM5DdhfFArin2PDGUiwg=
Date: Fri, 27 Jun 2025 09:49:29 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3 linux next v2] Docs/zh_CN: Translate xfrm_proc.rst to
 Simplified Chinese
To: jiang.kun2@zte.com.cn, alexs@kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: xu.xin16@zte.com.cn, yang.yang29@zte.com.cn, wang.yaxin@zte.com.cn,
 fan.yu9@zte.com.cn, he.peilin@zte.com.cn, tu.qiang35@zte.com.cn,
 qiu.yutan@zte.com.cn, zhang.yunkai@zte.com.cn, ye.xingchen@zte.com.cn
References: <20250626185408990ARtWWLD64lqhDx30GJlZz@zte.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250626185408990ARtWWLD64lqhDx30GJlZz@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 6/26/25 6:54 PM, jiang.kun2@zte.com.cn 写道:
> From: Wang Yaxin <wang.yaxin@zte.com.cn>
>
> translate the "xfrm_proc.rst" into Simplified Chinese.
>
> Update to commit 304b44f0d5a4("xfrm: Add dir validation to
>  "in" data path lookup")

Update the translation through commit 304b44...


See linux-next/Documentation/translations/zh_CN/how-to.rst


On the premise:


Reviewed-by: Yanteng Si <siyanteng@cqsoftware.com.cn>


Thanks,

Yanteng

>
> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
> Signed-off-by: Jiang Kun <jiang.kun2@zte.com.cn>
> ---
> v1->v2:
> 1. resend this PATCH
>
>  .../translations/zh_CN/networking/index.rst  |   2 +-
>  .../zh_CN/networking/xfrm_proc.rst           | 126 ++++++++++++++++++
>  2 files changed, 127 insertions(+), 1 deletion(-)
>  create mode 100644 
> Documentation/translations/zh_CN/networking/xfrm_proc.rst
>
> diff --git a/Documentation/translations/zh_CN/networking/index.rst 
> b/Documentation/translations/zh_CN/networking/index.rst
> index 4dd75ec27dec..4cf09b60b3f0 100644
> --- a/Documentation/translations/zh_CN/networking/index.rst
> +++ b/Documentation/translations/zh_CN/networking/index.rst
> @@ -23,6 +23,7 @@
>     msg_zerocopy
>     napi.rst
>     netif-msg
> +   xfrm_proc
>  Todolist:
> @@ -146,7 +147,6 @@ Todolist:
>  *   x25
>  *   x25-iface
>  *   xfrm_device
> -*   xfrm_proc
>  *   xfrm_sync
>  *   xfrm_sysctl
>  *   xdp-rx-metadata
> diff --git a/Documentation/translations/zh_CN/networking/xfrm_proc.rst 
> b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
> new file mode 100644
> index 000000000000..a2ae86c44707
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
> @@ -0,0 +1,126 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/networking/xfrm_proc.rst
> +
> +:翻译:
> +
> +   王亚鑫 Wang Yaxin <wang.yaxin@zte.com.cn>
> +
> +=================================
> +XFRM proc - /proc/net/xfrm_* 文件
> +=================================
> +
> +作者：Masahide NAKAMURA <nakam@linux-ipv6.org>
> +
> +
> +转换统计信息
> +------------
> +
> +`xfrm_proc` 提供一组统计计数器，显示转换过程中丢弃的数据包及其原因。
> +这些计数器属于Linux私有MIB的一部分，可通过 `/proc/net/xfrm_stat`
> +查看。
> +
> +入站错误
> +~~~~~~~~
> +
> +XfrmInError:
> +未匹配其他类别的所有错误
> +
> +XfrmInBufferError:
> +缓冲区不足
> +
> +XfrmInHdrError:
> +头部错误
> +
> +XfrmInNoStates:
> +未找到状态
> +（入站SPI、地址或SA的IPsec协议不匹配）
> +
> +XfrmInStateProtoError:
> +转换协议相关的错误
> +（如SA密钥错误）
> +
> +XfrmInStateModeError:
> +转换模式相关的错误
> +
> +XfrmInStateSeqError:
> +    序列号错误
> +序列号超出窗口范围
> +
> +XfrmInStateExpired:
> +状态已过期
> +
> +XfrmInStateMismatch:
> +状态选项不匹配
> +（如UDP封装类型不匹配）
> +
> +XfrmInStateInvalid:
> +无效状态
> +
> +XfrmInTmplMismatch:
> +状态模板不匹配
> +（如入站SA正确但SP规则错误）
> +
> +XfrmInNoPols:
> +未找到状态的对应策略
> +（如入站SA正确但无SP规则）
> +
> +XfrmInPolBlock:
> +丢弃的策略
> +
> +XfrmInPolError:
> +错误的策略
> +
> +XfrmAcquireError:
> +状态未完全获取即被使用
> +
> +XfrmFwdHdrError:
> +转发路由禁止
> +
> +XfrmInStateDirError:
> +状态方向不匹配
> +（输入路径查找到输出状态，预期是输入状态或者无方向）
> +
> +出站错误
> +~~~~~~~~
> +XfrmOutError:
> +未匹配其他类别的所有错误
> +
> +XfrmOutBundleGenError:
> +捆绑包生成错误
> +
> +XfrmOutBundleCheckError:
> +捆绑包校验错误
> +
> +XfrmOutNoStates:
> +未找到状态
> +
> +XfrmOutStateProtoError:
> +转换协议特定错误
> +
> +XfrmOutStateModeError:
> +转换模式特定错误
> +
> +XfrmOutStateSeqError:
> +序列号错误
> +（序列号溢出）
> +
> +XfrmOutStateExpired:
> +状态已过期
> +
> +XfrmOutPolBlock:
> +丢弃策略
> +
> +XfrmOutPolDead:
> +失效策略
> +
> +XfrmOutPolError:
> +错误策略
> +
> +XfrmOutStateInvalid:
> +无效状态（可能已过期）
> +
> +XfrmOutStateDirError:
> +状态方向不匹配（输出路径查找到输入状态，预期为输出状态或无方向）
> -- 
> 2.25.1
>
>
>
>
>

