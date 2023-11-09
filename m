Return-Path: <linux-doc+bounces-2045-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BB57E6702
	for <lists+linux-doc@lfdr.de>; Thu,  9 Nov 2023 10:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F13D91C20873
	for <lists+linux-doc@lfdr.de>; Thu,  9 Nov 2023 09:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBD4134A2;
	Thu,  9 Nov 2023 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cR3scnhc"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3538D12E73
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 09:45:58 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC942715
	for <linux-doc@vger.kernel.org>; Thu,  9 Nov 2023 01:45:57 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6b5e6301a19so713572b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Nov 2023 01:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699523157; x=1700127957; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbSiGKrBhM2/wHXRoKptmfeSde2mpjPrJRJ8xggR25Y=;
        b=cR3scnhcl4yHgQ7xFD7Kqwpmzp7LL3j7TeGgKlyhYvMWFgNfxArIpu0Hyfipn11rQk
         ddwpZGrwqtIGebyLVNSNHrUrWqNYYYpSrF99k7o7ptrpO7ZAO4jTM4RfBrQQC+WI5kb2
         AmVKJz0rhd6dvEagIp+eWk5dDKQAQT3fWobIv2AuUWCzeYnNFl8RcmdlZAn/pfolXSYt
         oPsknKpwvExD7z0WKOVHHDyUK1o+IISCzgYgTh0wXvrBzreJjn30C7ET4pyUrwjshItq
         eBgjRiJSkOXA3DYfLIwJ6SKLetTvHCqBYgkwdGe0ai39WmCgiyPXacst6Y6XLB+jGb/t
         HJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699523157; x=1700127957;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbSiGKrBhM2/wHXRoKptmfeSde2mpjPrJRJ8xggR25Y=;
        b=mITlYm7GCVGwaBBIsSxryuHNQs7TS7g5emYzTHtLOrZJQ06/7Wfv+kQ1yHMIlkH5ID
         Inun0u+D7kT1e0tMfyUkjWqmx1is7epIWwVTS5DpdhwAM5LvkEh9T2/MoGbqNwNkcxcP
         yJTRXAeBN5qilLSzsfHvMeZtf7gv0uVVEvXkoXbsiheRQUpLR+4sQ0YRbn78tUooY4EN
         +PntQQmjHP32KvTSL/yCeXDNb5XV7HvXMrHeISLEfu9DPDfVYnGPyz3svV7fPjlYDpnO
         KgNsoIiCKrn7UFReRU0pSpbaoRGM89aKL7mMJOzUUQGnMcw7PxNxbkRKYe5oPX9vKIvP
         TGeA==
X-Gm-Message-State: AOJu0YxQ4srPxlHm1PJ1VSEbyKHrgDsqglfluVFtYPJTnfCeWXsBkRoT
	Efii/g6zIldJ8h7MuNy4ECstlA==
X-Google-Smtp-Source: AGHT+IHcxvykfL05iCgUN8NZYoRBP07ZEj+8KS+NLRxGiL6Z6fO5lkId5FnQ6uAbYO6wWgDNI5Gdhg==
X-Received: by 2002:a05:6a20:1594:b0:17a:f0e0:ed07 with SMTP id h20-20020a056a20159400b0017af0e0ed07mr5017358pzj.15.1699523156774;
        Thu, 09 Nov 2023 01:45:56 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:aeef:31cf:49a7:c:20d4? ([2402:7500:4ce:aeef:31cf:49a7:c:20d4])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7874d000000b006c31c0dfb69sm10276439pfo.188.2023.11.09.01.45.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Nov 2023 01:45:56 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v3 06/20] riscv: add ISA extension parsing for vector
 crypto
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231109-prevalent-serrated-d40eb5f71236@wendy>
Date: Thu, 9 Nov 2023 17:45:51 +0800
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>,
 Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F2C4CCA2-0513-4988-94C4-1ECEB9F1D578@sifive.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-7-cleger@rivosinc.com>
 <5EF129A2-195B-4207-A2F6-DBA1FBB9F65D@sifive.com>
 <20231109-revolver-heat-9f4788c51bbf@wendy>
 <20231109-prevalent-serrated-d40eb5f71236@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
X-Mailer: Apple Mail (2.3445.9.7)

On Nov 9, 2023, at 15:54, Conor Dooley <conor.dooley@microchip.com> =
wrote:
> On Thu, Nov 09, 2023 at 07:44:46AM +0000, Conor Dooley wrote:
>> On Thu, Nov 09, 2023 at 10:58:41AM +0800, Jerry Shih wrote:
>>> On Nov 7, 2023, at 18:55, Cl=C3=A9ment L=C3=A9ger =
<cleger@rivosinc.com> wrote:
>>> The Zvknha and Zvknhb are exclusive. It's not the superset =
relationship.
>>>=20
>>> Please check:
>>> =
https://github.com/riscv/riscv-crypto/issues/364#issuecomment-1726782096
>>=20
>> You got a response to this on the previous version, but didn't engage
>> with it:
>> =
https://lore.kernel.org/all/c64d9ddb-edbd-4c8f-b56f-1b90d82100b7@rivosinc.=
com/#t

Reply for the thread:
=
https://lore.kernel.org/all/c64d9ddb-edbd-4c8f-b56f-1b90d82100b7@rivosinc.=
com/#t

> Yes, but for instance, what happens if the user query the zvknha (if =
it
> only needs SHA256) but zvknhb is present. If we don't declare zvknha,
> then it will fail but the support would actually be present due to
> zvknhb being there.

If we needs SHA256 only, then we should check whether we have zvknha =
`or` zvknhb.
=
https://github.com/openssl/openssl/blob/4d4657cb6ba364dfa60681948b0a30c40b=
ee31ca/crypto/sha/sha_riscv.c#L24

> Ahh, I now see what that happened. Your mailer is broken and puts the
> message-id of what you are replying to in the In-Reply-To and Reply-To
> headers. The former is correct, the latter is bogus & means you don't =
even
> get delivered the response.

I use mac builtin `mail` client. And I think I put the `in-reply-to` =
address to
the `reply to` field. Hope this one works well. Thank you for the thread =
forwarding.

-Jerry=

