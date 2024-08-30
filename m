Return-Path: <linux-doc+bounces-24220-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 257A0965ED1
	for <lists+linux-doc@lfdr.de>; Fri, 30 Aug 2024 12:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 570521C24449
	for <lists+linux-doc@lfdr.de>; Fri, 30 Aug 2024 10:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E632117E000;
	Fri, 30 Aug 2024 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aBFJJW+r"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0513A17CA1A
	for <linux-doc@vger.kernel.org>; Fri, 30 Aug 2024 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012913; cv=none; b=tIrY86Y902tU2VAOG3ip15hfbQpKOVNf63mXRZK28RdBK+wljIHP23zrDlz0X/mCHtagaVi+zK8yYlEn9mLvY0k2tq7aS+9UQBiIqqyQRvZujFIPOlo37RvPD29wca4Ga6MC60n0iRDdoYFXM5tnCydUdFp94dBH0/gF/aJLXyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012913; c=relaxed/simple;
	bh=ZR+3QqzT/pKEtLj8xun3aa5haR+iOhO+Azte1KQgwqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+dw/kLYyh2wRBtgq0eOzy+NuD4om3p/Ss44y0N1qRyzvjbnL4ZOE0lMoHWvEapyXCwlRZ9UwC5fr+siMyw7lQ++YFgLdbBxOIQSv3J4CNSrhO4GKhktnGYwfMySjDlUT1dqD0wLUYJ6NZw0CtpuaWYPgyakbQYq0Fr1vGIGDs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aBFJJW+r; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <5f4990d1-1734-41f6-b54f-5e44c370410e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725012909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZR+3QqzT/pKEtLj8xun3aa5haR+iOhO+Azte1KQgwqM=;
	b=aBFJJW+rGylYQv56Yqwe/cCk8clZLd/IQ77nLAo26VOGn0PidhGsCe7YZ24aAZzztQYlzx
	KqractwJnuI/JIyrX5Wa5wlR7YrknMjP9Su/sovSNUJ2h0qNzI4uPQMFKIf99d5iaBhsAH
	ZWcyZGiKHcaRHbw+iochG2819DjnlJI=
Date: Fri, 30 Aug 2024 18:15:00 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: add the translation of kbuild/gcc-plugins.rst
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240828074305.314666-1-dzm91@hust.edu.cn>
 <04184aa1-475e-4e1f-9e05-21f59a0787d3@linux.dev>
 <2e6e368f-0f2a-4724-892e-06cfe3fba97e@linux.dev>
 <CAD-N9QUBwM-Y1pwEiu5sLGaVVxL_taj-EBYnjUuc4k2hyJ2xbw@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: YanTeng Si <si.yanteng@linux.dev>
In-Reply-To: <CAD-N9QUBwM-Y1pwEiu5sLGaVVxL_taj-EBYnjUuc4k2hyJ2xbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/8/30 16:17, Dongliang Mu 写道:
>>>> +一旦它们的实用性得到验证，目标就是将这些功能添加到 GCC（和
>>>> Clang）的上游，然后在
>>>> +所有支持的 GCC 版本都支持这些功能后，再将它们从内核中移除。
>> 目标是 进上游后 把 功能 移除。
>> Can we re-polish it here?
> 一旦它们的实用性得到验证，这些功能将被添加到 GCC（和 Clang）的上游。
> 随后，在所有支持的 GCC 版本都支持这些功能后，它们会被从内核中移除。
> How about this?
Great!

Thanks,
Yanteng

