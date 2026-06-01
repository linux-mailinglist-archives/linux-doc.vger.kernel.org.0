Return-Path: <linux-doc+bounces-90245-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBJQFOVSHWp/YwkAu9opvQ
	(envelope-from <linux-doc+bounces-90245-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 11:37:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E01EB61C913
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 11:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6369F3037F74
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 09:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF4F3939A2;
	Mon,  1 Jun 2026 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BI1xqxQG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9495E392C3C
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306470; cv=none; b=af2ONTO1/piskqKQMlgaUJ9vY4W+BlFXrNBbQuVbLiyFJx+PYIeUELV/2aCy4fsJfQR+bwFoc+HyNPKiQMlRQGl/N2nv/OLxXq7qd2PaPZ++Cg3xTb7ml8J1zQKb7Z26Zym8Rs5N3ZNQIzKmZqCIqNlNwz8rLqP32/aLVnaPq3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306470; c=relaxed/simple;
	bh=HoKxu7sdvXYOQg4JuegHpjnjGnSj/skENgH900Vm1GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meSyVE3yKYmKuYCUIFjkkgtnoD1gfy3SiEoOyAvAOhXmxGj2tudv+Ma1tPIocGLIS5JTSB/8FX6qn32nY7LpwqG7W8MkTNpkA/Vi3Gg78rofmKgID1MS5vKNjNBF3dpGajodIrIQ1PIfUHiLKM5Z2GjWnvfLY+Th4MqzeTj6cok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BI1xqxQG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so75155905e9.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780306465; x=1780911265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HoKxu7sdvXYOQg4JuegHpjnjGnSj/skENgH900Vm1GA=;
        b=BI1xqxQG2rCVE4+QKaTAHNJtl6o16XxNDM2+JAeKHEwHbuM/4JZA9MurfHqU2IF99L
         EUlet3gKOxqSo55XJmBfAOlgWIFvtpbTRvODDLmGT+dD33wsGQWZo0U8Ma6/VCAyOe14
         KdJAL7QsXAZv4Gcj8DvgXgEQOIUpc5uBpnzeQo+UTdSIEnoJ27Uid4b6lrPr6jikpfsn
         pl2L8RK8y5AoqdvCGwdJZG4/5qdbVHBLjs3qxIkZs0Z6fjGvh9FROgLIyEr+LMwk2+3C
         4eoKEDnqe+uHTIxWbRkg43OBHwkJhI729SE91m9xTIl5Pm16MHxwtxpuf9l/l8COhYFg
         Pkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780306465; x=1780911265;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoKxu7sdvXYOQg4JuegHpjnjGnSj/skENgH900Vm1GA=;
        b=sj51pg/bFlMpJalHjp47xXoV66+9fzahMJGj9Zixh9RGXFzo6RfN3hWBgO1ykj6s/L
         7f9BZ1iXGI3+TT6qhsJZP14za8wayBedoGlaGvGFdi+dgnlRNqUBKLx2w02bgvFq3xIm
         B1ik34PftV4DAwp/vLCFS3Z9VJg3vndHJ2y/DVvapQLx9steT39wJAiogy8LQWOCCIWg
         9JLkh++d0rN67fXf8ppDVJbUMWKnLr0WUlusJn1w0H6hjEANwf5E2paEqfMwV9TqluZ4
         574buTedCTAsveDrsyLPWvgRNULxaVoaBHKNDmviYOiQbK1qQMz759ANW6rJ0sfQkU/i
         uyvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nPDsHr9jpJQB/iZgXvnAOkJ5UBgmde5aEywWsVCvK4Bp1XKuUDMSNM/I8/sU29oTXhwPaLvoXRk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7VY+yPPPNASf0Kgi7D7+GMVm4bO/sSGxYQNYfKQ4hytFYapAS
	13MQS5I7Jia3Ir56cSgGn3Lb+qvYRIhEjNIxiMzli5JG69pGWRKY9abR
X-Gm-Gg: Acq92OFK2OxbzYTdlgLW/AWt10gyW+F1EkhEpwSzzr9F9dqsNuSeBRUOU27T1vkAB0T
	XXR0jIJnfrmH0ZsrycFXyEzuGZZa6jWxqUp9x8Sd8Q9Hpq8I0jTIYuw6b/LrlrKQwO0ahpUcBUN
	yM+NnM80+U1XPgXlq9GGverCEPRZd1AJtRaGsZoL/RSo6CZLXSJz/DNNv9qKurGFK0lGPeygmiZ
	68SRo4EPAtg5kn4CLrOlHTcqVDWPyLfeiakCdwTO9iJ9T4ZMyzpIT9FnXva9+UaNe8yv84Jkdhp
	TXsXCIzH83aS5u6WkJhoK6Q/i0FGOCH98LcxK5bNFo9My5ie5Ka95o/Rtk0eLgYs+Q7l4bD/oHV
	TAfKc1tqPlmmXy7HRKcb3245c0BLqetLyL4UhCdBlAfjST8cKscioJHshHuNhdr0bISpOfoig6D
	7si6ZvcsIaqTXNXHLBYGlrtha5CoQTV9o+//y9mtxV2uxs436fwOo=
X-Received: by 2002:a05:600c:8a0a:10b0:490:48b7:c1ff with SMTP id 5b1f17b1804b1-490a2941d89mr136512435e9.17.1780306464763;
        Mon, 01 Jun 2026 02:34:24 -0700 (PDT)
Received: from ?IPV6:2001:67c:1562:8007::aac:4898? ([2001:67c:1562:8007::aac:4898])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c053029sm72992385e9.0.2026.06.01.02.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 02:34:24 -0700 (PDT)
Message-ID: <c4ff641a-266b-4115-8beb-993cbb2f09ec@gmail.com>
Date: Mon, 1 Jun 2026 17:34:10 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs/zh_CN: usb: refine translated wording and
 formatting
To: Kefan Bai <baikefan@leap-io-kernel.com>, linux-usb@vger.kernel.org,
 si.yanteng@linux.dev, gregkh@linuxfoundation.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 doubled@leap-io-kernel.com, alexs@kernel.org
References: <20260601033945.555210-1-baikefan@leap-io-kernel.com>
 <20260601082652.650303-1-baikefan@leap-io-kernel.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260601082652.650303-1-baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-90245-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seakeel@gmail.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E01EB61C913
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

LGTM.

Thanks!

On 2026/6/1 16:26, Kefan Bai wrote:
> Refine the zh_CN USB translations for clarity and consistency.
>
> Improve wording, wrapping, and formatting across the translated
> USB documents.
>
> Link:https://lore.kernel.org/r/2026053149-flaky-shallow-2460@gregkh
> Suggested-by: Alex Shi<seakeel@gmail.com>
> Signed-off-by: Kefan Bai<baikefan@leap-io-kernel.com>
> ---
> v4:


