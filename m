Return-Path: <linux-doc+bounces-15007-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAFC8B0DB6
	for <lists+linux-doc@lfdr.de>; Wed, 24 Apr 2024 17:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB49B1F217D8
	for <lists+linux-doc@lfdr.de>; Wed, 24 Apr 2024 15:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E84115F3F1;
	Wed, 24 Apr 2024 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zLfthbTS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E081E15EFD5
	for <linux-doc@vger.kernel.org>; Wed, 24 Apr 2024 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713971626; cv=none; b=nm60siayRCaYVADmHjVqf7E1c2AGgf5bupaAcuv8wXoyrbeLQumQLQv1p4H9GvVA47rkRX5ClOnXxGs8Aw5j1LSCNqfK5/tEUT79zYgaMVsHkTxIzqjNQRiDtjIBbkDCRIFqhGbnGUn2kqiODmXlWT1LAdrpcgPAH0KuygYPiD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713971626; c=relaxed/simple;
	bh=tEDlSX60cFF3XIZCRG8/CfaawTF3zEUuH5YM6XnT0N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2Q0lsC33ZsAS6L5RT4HRPrS6w7dqmlicY/9pVlPHwzgA14WjiNBP6BKSw3WQ4+STE/R40/LlKfKJuoVE+1jsFI7mI0TrVoCelPAAE3ahJgB25ocQaKBX58VW80VEJUZAHRNGPF/5gIp8Ujrn9ykdzR4s40u8K+Op7nrgEG20BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zLfthbTS; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so6759111276.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Apr 2024 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713971623; x=1714576423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAuwXMJJnpPJzeS/QdiiNtiBKl3H6rCtZl+q9pQNJBs=;
        b=zLfthbTS7c1drv/pKmPJo6pEB4SEyr12UYCnlEzLK+7jUqg1QT4VpMMfSEf8zJ+tRf
         ZJ1r6n2Bta7gk8tb9mmnUyc4lVovzkaKtCAu06rcPteUDdrGILU30EJuxWsH8ae6k527
         y0C8e97FsDxuXqFY4QOx+97woh/xkfJrPT2U+HnVI5p5WWNsnZ3A8mLCAItpgBjzE6wc
         KTpg+iiMMtytJAkTZSQ+zPH9etwMJrXAUQGrZuYi/5NnxNL88tvvfPy7Htk8TIl7h5Y/
         pzOLiTPfAABY3C4L4nAKI5u1R3FiuUNhQs5x0VKtsICRj9iEXa+n40LS+okznaJfGnEk
         U0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713971623; x=1714576423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAuwXMJJnpPJzeS/QdiiNtiBKl3H6rCtZl+q9pQNJBs=;
        b=LdeFWoyjjnb7GazGLwF7L6mGZZTeT899Jj45BJF5HHJH1HOJp7fwRAXY6mWv7OpD05
         U2TTToYMPeyfZIFh1qSdLMqmmhbhFcSYDRDT4fTi1L3XU65vV9MTBBoJjWwxu6eYW1ud
         +yGyPxVUo41wY0epwMh3bn862k6naps9cpi1ZAUSwR9Cy/I/eq9tuo1Z8jCua3JKtpso
         qj+tLOytS8vw9ccnScq1K0h+XmHYM0c0rOn5vYSjVZH2SLLY/qAQKlxdZOT7ghlC/VRO
         bWBQqB3Qu5mhwu6lOJoJwpW1Fkk6mhxoHz6KIO9DIrOrM1/mNK/ZK/+zJoKAYUwinGoZ
         hP8A==
X-Forwarded-Encrypted: i=1; AJvYcCVZarzU1jyfHpcR78i2f/eJv1Nc7Fqry7WVNjbj0fnfZrUOl1hHRHaqSn82NdN+Ht/fIiswRW/gsYZzETvq4lAL0478yx/CWPzb
X-Gm-Message-State: AOJu0Yz63vZPECQz6J8lWer30Qu11Z4PqgpoAvChu0XAYkiwvIQXuDFU
	LQzl91/clOwE0Q+0CRKbw45+dEulswRCI8DVFcOpG41RkSEpTs26aGiNmK+6fsU=
X-Google-Smtp-Source: AGHT+IHhTz3fBZ7peK0ohgK/fsX2BIM1DNpAIBuTraurnQaZqdLiFfMgwIqo7gYns2h/SqUcyMxIMQ==
X-Received: by 2002:a05:6902:238a:b0:de5:51d0:9a8d with SMTP id dp10-20020a056902238a00b00de551d09a8dmr3433052ybb.55.1713971622828;
        Wed, 24 Apr 2024 08:13:42 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id s13-20020a056902120d00b00dc73705ec59sm3141332ybu.0.2024.04.24.08.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 08:13:42 -0700 (PDT)
Date: Wed, 24 Apr 2024 11:13:40 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 06/17] riscv: Fix extension subset checking
Message-ID: <ZikhpEgEoMX/rObu@ghost>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-6-67cff4271d1d@rivosinc.com>
 <6c624361-a968-498b-a9fb-ea2aaec70ce8@ghiti.fr>
 <20240424-wildly-goofy-c81aac6f8cd7@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424-wildly-goofy-c81aac6f8cd7@spud>

On Wed, Apr 24, 2024 at 03:51:54PM +0100, Conor Dooley wrote:
> On Wed, Apr 24, 2024 at 04:22:02PM +0200, Alexandre Ghiti wrote:
> > Hi Charlie,
> > 
> > On 21/04/2024 03:04, Charlie Jenkins wrote:
> > > This loop is supposed to check if ext->subset_ext_ids[j] is valid, rather
> > > than if ext->subset_ext_ids[i] is valid, before setting the extension
> > > id ext->subset_ext_ids[j] in isainfo->isa.
> > > 
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
> > > ---
> > >   arch/riscv/kernel/cpufeature.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index 48874aac4871..b537731cadef 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -609,7 +609,7 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> > >   			if (ext->subset_ext_size) {
> > >   				for (int j = 0; j < ext->subset_ext_size; j++) {
> > > -					if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
> > > +					if (riscv_isa_extension_check(ext->subset_ext_ids[j]))
> > >   						set_bit(ext->subset_ext_ids[j], isainfo->isa);
> > >   				}
> > >   			}
> > > 
> > 
> > I think this should go into -fixes, let's check with Palmer if he wants to
> > take this patch only or if you should send the patch on its own.
> 
> I think splitting out this and patch 1 into a new series targeting fixes
> would probably make things clearer?

Okay I can do that. I will give it a bit more time before I send this
series split into two to allow time for the rest of the patches to
gather comments so I avoid sending too many duplicate patches.

- Charlie


