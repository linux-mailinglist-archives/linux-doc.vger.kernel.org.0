Return-Path: <linux-doc+bounces-79472-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G3UNAX7t2n1XgEAu9opvQ
	(envelope-from <linux-doc+bounces-79472-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 13:43:49 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FC299A24
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 13:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 266F630185A7
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 12:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CA3395DB1;
	Mon, 16 Mar 2026 12:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5/rZ/oj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1615F282F02
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 12:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665024; cv=none; b=UuQt4PetjTq1ka3/kWYF1gKId09GCfqeGA7E65Jiur6aafiVeL+CQ/Syl3Brn7b1QEDbCFR9z6YI0hLKDr/DBITQIGWGJQ2ymHBiQnNh1SoHokXaYhPkMhW8ut+fgE/gMM6qzL9vJQz3d7wR/ASxm5XA6Z1pTZvkQpv/BYvRoQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665024; c=relaxed/simple;
	bh=nUQBkP3X0/pToFV2Q83fkQmrRWytaL3cs4Kbidm9cKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGJruhi/c0Li4WOOsRBLQso6v/d+CMFUZPK6PwU5A3zlE0WOGqpvVlOqRk4f3+7XCviqYIjd9yFxPoAHkMUdPMwBtYNMRal1OkNpfaejAN5iBumBg0CxA1tpdfAXljiS5EZYfY++Nn/8rYduVtoJXIK5PUN2GCdK96CgXiQKpgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5/rZ/oj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-829928e512aso2338136b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773665022; x=1774269822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CkHw6F0TVfTVq6+d27cGnGWlgQYL5yMrvBwXiQRpbsA=;
        b=I5/rZ/ojBB5P0t2efjOKKVPsSJge8yITJ9Wwu+vgR8RJGf5AZu+z+Ljzcgl1G4jKQg
         d1m6ViiM1t74TWUQtYhtSVPyzuUfLnaNltQCFh3rdgr5cKQoUfpEmo+XkPWEMkm618v0
         f1SnGDRuMjPXSkUVcKLErVqNcSXGKLzM0bfRpam3S2WT16AzcJ6YQp7sExKAdmYLxTLX
         5tLUIAXl0XzXcbKymgL1rmT6nViz88tHYk7Tq3PAdTy9m7KUIu7xz06w+QBRTDKWT+OR
         /891AMqlQM2uIGKEZyvh/inlq+VjzZjjEB0HsgK+1PKz1EsN4fPoyKRngxKOOOHxZCno
         KhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773665022; x=1774269822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CkHw6F0TVfTVq6+d27cGnGWlgQYL5yMrvBwXiQRpbsA=;
        b=ABx9KNAWs8BDN9zy9C7nID8b7gUtNhcKmZMXtQpW5EqN8RSRfaBIHltswViRuvTuTG
         Cc2BymIAY+nkN4dE19aitVKOUgJzpbsBO29nR650CJSNJUr5tovII55UOIzel/0Cfyq1
         RjfUk3qkkBhYmHUld5kW2iiE69elPZyi3lNcKejb8028tgDaIZ9COYU9JRfpYanJ43RL
         S1BB37SaWd0898YmFPDk3npxROgNqZL9HdJeOw8kDmhwQTodd44gtqXwHQOM6QfYe9KJ
         WE5c35hbEV60oow0wX03ulMXVGn1JpKVEt1EmdFWTFBkP3WO6i6LPf86zuZDqsMDiIki
         Kg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt/AQvwqgUxTow3b97a9Sfbz9Maz4bSAKLz9/x3y0mFI4nZZudCyWd5m7oySSH4Lp6idtNc1uoBdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxTmncWXgiR5uLICC7Ea6KuVshkRDuBlw9UZvzrTmgmu5AdMW8
	qByCwY+iwbDqZxR5SAiC6fC9XfhlieHhPaHus3tzFwtytDPH8qx2RWYv
X-Gm-Gg: ATEYQzx1xDSWtOUvhUG+yqBarEMsgcLkQwu+k9imeYLmbs5exoWtRNTIbBZNaKPZ4WL
	zc0wZhGEB5Tema45p7Foxn4SfNrWM0b/0DQDDxJG7KzMMTb9k3UyaC3GooUTv1lrstaPTttbctd
	9bL3wSMlAmf5Y9RSG46vurafvYoNjoCCRR+st0RmNz/+Wx5AJqLgCxzSp89hA2L1WifsrhiIg+p
	EcWXCVA2qiBVn6XH2XtByS9iytfHu7wZI5i/2+p0ILJ3s8ZLrgp1YUKGmIiB0CcqHYzKXbznu+l
	oH9f8GPUJves+uj5SOeH6IqzzC/JiFq7PdHzpOsrWNAnYSEaVlUOPT7bHyS0ZgJXXKHJvFJObZh
	Sjd9cDx4isEdO59UI+ubfvoHzlKg1JX84T1144wbfYdnWlYlwFtUcJ8OiMTOg0LIYwfmjEQYF/w
	vvGOuNqvHI5kY98Zn5gW3KL16rnWMmLCg/kbxreoXXjGzqBrUFFaXRDxr9Hv2RxIMU
X-Received: by 2002:a05:6a00:2e9b:b0:82a:1590:e1b9 with SMTP id d2e1a72fcca58-82a1988e749mr10611803b3a.35.1773665022398;
        Mon, 16 Mar 2026 05:43:42 -0700 (PDT)
Received: from ?IPV6:240e:38b:d99:bc01:3e56:a0ba:b06b:4af4? ([240e:38b:d99:bc01:3e56:a0ba:b06b:4af4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0738528fsm13785454b3a.56.2026.03.16.05.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 05:43:41 -0700 (PDT)
Message-ID: <022986cf-28cc-48a1-90f4-bbf84b94bafb@gmail.com>
Date: Mon, 16 Mar 2026 20:43:17 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: sync process/2.Process.rst with English
 version
To: Song Hongyi <szpcq123@gmail.com>, alexs@kernel.org, si.yanteng@linux.dev,
 corbet@lwn.net
Cc: dzm91@hust.edu.cn, skhan@linuxfoundation.org, w1ndys@qq.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <9cc4a719-d6ca-4f15-b862-60fb862ba7b2@hust.edu.cn>
 <20260311123107.329769-1-szpcq123@gmail.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <20260311123107.329769-1-szpcq123@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79472-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[hust.edu.cn,linuxfoundation.org,qq.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.dev,lwn.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seakeel@gmail.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 569FC299A24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Applied, Thanks!

On 2026/3/11 20:31, Song Hongyi wrote:
> The Chinese translation of the development process documentation was
> outdated. Sync it with the current English version to ensure consistency.
> 
> Key changes include:
> - Update versioning examples from 5.x to the 9.x placeholder.
> - Add footnote [1] to explain the non-semantic versioning scheme.
> - Replace the obsolete LTS kernel table with a link to kernel.org.
> - Add a cross-reference for the "interleaved replies" section.
> 
> Update the translation through commit 5ce70894f6ca
> ("Doc: correct spelling and wording mistakes")
> 
> Signed-off-by: Song Hongyi<szpcq123@gmail.com>
> ---
> 
> 
> Hi Dongliang,
> 
> Thanks for the review! I have updated the commit message with the English
> commit hash.
> 
> Song Hongyi
> 
>   .../translations/zh_CN/process/2.Process.rst  | 56 +++++++++----------
>   1 file changed, 25 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/process/2.Process.rst b/Documentation/translations/zh_CN/process/2.Process.rst
> index 31b0e2c994f6..ca00672c313e 100644
> --- a/Documentation/translations/zh_CN/process/2.Process.rst
> +++ b/Documentation/translations/zh_CN/process/2.Process.rst
> @@ -23,21 +23,18 @@
>   总览
>   ----


