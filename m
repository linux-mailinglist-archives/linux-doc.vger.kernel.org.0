Return-Path: <linux-doc+bounces-14031-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F6E8A3592
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 20:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71ADE1F219C7
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 18:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3DB14F110;
	Fri, 12 Apr 2024 18:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WXFbh+rj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECDA446BD
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 18:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712946283; cv=none; b=tEf2x4maaVCaslExeYfzciy7dofzXfCuFAjrkOfzVsNTRizmrVoIre/ysYXGUm697xP67P9elVBLCrzeGHKJuvvQY72fsRGu+lga5IZ/a0tmoA4WI+qpUEknJkozubI7QkxzsKeoPNAQEi0qc6+UGyDVQu4LP0zlPSIhnmXDuSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712946283; c=relaxed/simple;
	bh=nY7gbkgkBr+eHZR919YowyRoq31FRxlbVFMFZulxFuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pa4X57dogVHVhcAUXk/Cb4yHRRcCBb7W76y+AOVWDVL9vJGStw8c8c8qtuMAIuCgRrCf5WfpHz+XKfhx2Cc1buH4qvU15gijr1SOoXR3GGV5oadv96U0ei+ZxkLOoZTikZ+c2OPl0rSgYXrwGMPOTNjHE5HpAbw4v8QP8OQjs6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WXFbh+rj; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ed267f2936so1005431b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 11:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712946280; x=1713551080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VnBuVioN4do9yO5Fp+To5ya+VzBTYCmZkVY34L3QmB0=;
        b=WXFbh+rjZbX/JtdaihjFORYvRF0dx+G+Pqx+XqL7cIhCKY7vsfto1e20iGv8dUdM6P
         xdPJKDUGkY9C2z5/vxT6x7z6z0xWPA6+k8xclCvd5k+xsgTNz2PbGEmHFb8htMzACxaN
         BPwtNHSt4yj/Hg89E+hvoLXqh9b4UhKqOLvqIgEpb/4xHJaz1dOYmpUQZ0bn5TBv4dZP
         EHMCsceq+rt/Kf4v9jGoWstqMXLCpSaHLwZqdjiQjjcAlHq9GnRnv74coySAH8rMeIjr
         Amg2eb3YMSrlbj5Jo8xouUcd3oMt/TRkvUCCNupcT6VQDiDti0gQMYVd1co83qwD8AvY
         vmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712946280; x=1713551080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnBuVioN4do9yO5Fp+To5ya+VzBTYCmZkVY34L3QmB0=;
        b=tU8tHvIHCNlx5hpwumcFLS8pZ8K+LePBt5MflCalJkX9d6OAqMQyb7H0AW5Q34fJQv
         AVqjW+GFVwAlx4hfHYIvUvbtOZkM2z5J3lHXsKVVmo2EzmtnBbt72gCLX5sJI4C3VOO4
         iuOm7PnWsKY5XQPK2STjh4Q6d5l5zcDntMGW1HFLpFOkI7iMIbe2zfnsd4YDiozKbD+s
         oAIqcSvYcWvmyYoXMGKkf9wcbCX3Z2mZTTo9nLUsv3POj6b/9eCs5L6+6+5oXimEyZsS
         Efk6Pjdo1kypA2P40SwkI4t+CJsbFXpCIKSqiHn3o2hz/Ov/aYVKjJfhZGIXf0sFJDPa
         YLGw==
X-Forwarded-Encrypted: i=1; AJvYcCWu15PGed6aSRQw0bdYA4NFCaMb9e1Q9c+kS7f6mVDXV/fh7Uf+ZnOlJdMOB4gfhX91VzfMF73eFb6XCNc4Qyh3O7F7ATb5zVi3
X-Gm-Message-State: AOJu0Yx1/z3x50BCeVahKg57baqYomna32PTq/WDg2FRhRayzbxU9ahR
	9P8cLjQva946j1ZJdioWJBWL4cyG3gfMZo0q9s9ZnYOhICT02lOTZR/X96dpuwA=
X-Google-Smtp-Source: AGHT+IGBSZ+NKU4CickCNnsQ+/kbxESLkfaeQqukqebjAC4cnyf8qidufBP0hWj5qMBvb+MfDt1C/A==
X-Received: by 2002:a05:6a00:3913:b0:6ea:8e89:7faf with SMTP id fh19-20020a056a00391300b006ea8e897fafmr4224014pfb.28.1712946280297;
        Fri, 12 Apr 2024 11:24:40 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id q4-20020a656244000000b005dc4fc80b21sm2633420pgv.70.2024.04.12.11.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:24:39 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:24:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 12/19] riscv: Create xtheadvector file
Message-ID: <Zhl8Y+GzTB/ip7rT@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-12-4af9815ec746@rivosinc.com>
 <20240412-thirty-sacrament-db052c7fe6fe@wendy>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-thirty-sacrament-db052c7fe6fe@wendy>

On Fri, Apr 12, 2024 at 12:30:32PM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:18PM -0700, Charlie Jenkins wrote:
> > These definitions didn't fit anywhere nicely, so create a new file to
> > house various xtheadvector instruction encodings.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/xtheadvector.h | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/xtheadvector.h b/arch/riscv/include/asm/xtheadvector.h
> > new file mode 100644
> > index 000000000000..348263ea164c
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/xtheadvector.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +/*
> > + * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
> > + * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
> > + * vsetvli	t4, x0, e8, m8, d1
> > + */
> > +#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
> > +#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
> > +
> > +/*
> > + * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
> > + * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
> > + * the call resulting in a different encoding and then using a value for
> > + * the "mop" field that is not part of vector-0.7.1
> > + * So encode specific variants for vstate_save and _restore.
> 
> This wording seems oddly familiar to me, did Heiko not write this?

Yeah, I wasn't sure how to attribute him. He wrote almost all of the
lines in this file, but I put it together into this file. What is the
standard way of doing that?

- Charlie

> 
> > + */
> > +#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
> > +#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
> > +#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
> > +#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
> > +#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
> > +#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
> > +#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
> > +#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
> > 
> > -- 
> > 2.44.0
> > 



