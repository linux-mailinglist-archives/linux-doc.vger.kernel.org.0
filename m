Return-Path: <linux-doc+bounces-14025-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6898A348B
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 19:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0547B22856
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 17:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE6914D2BE;
	Fri, 12 Apr 2024 17:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tYpMb8qB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5B4148FF8
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 17:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712942008; cv=none; b=eGQo34jLboU8s8dAY8T7rgShZKlDeIkYlfAJvVMIOWLQLKeXTwRS3qxJsP1703WkPDPmmFJg5Lpm6h+1iB7piZd24qx3rVDtjIKPgMeiOBo1Dnf+UwvLBwh+HWQklnAU3e+FmC3JHjjFG+8lCdOg6nnVrlZZMBzLdyh7sklAzHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712942008; c=relaxed/simple;
	bh=BOw65jefwZAEXrOKSe45kDD1W0vdEDtUimtMT6vNJrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2vKVjxjjWtdP1sn7NustqPZO6AYMItj+mEfwGS08aGxTkjfLsbdZbM2ImE4FVWpHX9sndkj+KVYa9MySz2Ok7nH7jlmkdP/W7Topidewian9/EWbeuhfp2zgS69LWAXfUf5ac6/RCo2oAKUU8vWSe4Yny67YaWFL+4W2xaJ6jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tYpMb8qB; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2a5215314a4so768307a91.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712942005; x=1713546805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Soc0+QXn5W8zbaSk+coOpUVEhCceV3S1TAiuN1SZpPU=;
        b=tYpMb8qBVok4tLcFx96La7WiJdNpXqqy20EUzS3YVi/NyVgxOpj8O4cOr5wIcc7e4M
         cVCqcGg1o7CH5XI7ZMCFlaDBEkuZsKwMcEaQCAOIPbBBQ6AacuVOZACWl3VeJ4LtMnOR
         QmSRuM64j+uwbON13W1VXMM50OCQhvs+dPGPppRCM/wR+rdbVSPv6LEaNvv0Sv5qk4tb
         uG4H1dtgJhf+Stx72hLtiP7cFO/WyYoNpTF/g3D856TcMk04UmsQjLETjVWeng1ashdx
         FSQQ15ncTLxh2Powx/M047b3+816bST/q1NZNdYJoFRLrKsI6SBGOJb4AcfXE7bNZG4o
         w9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712942005; x=1713546805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Soc0+QXn5W8zbaSk+coOpUVEhCceV3S1TAiuN1SZpPU=;
        b=ayM76H9c1XBkJRgFlp7flHhlFym6x8A1d9rpLlTMEAEdQnw2ubTzMY0mLjalhE654j
         v4tvYEkS3EUtvhACVGochCY9C7+IGyyTGVVKYscQB9FqED4939o0j11DFu2UkXl6lRg8
         tHPQN8Gj9CdKJ9rgRj1gExuSseataU8vVOUX2zxyFCnRWf9w+ayzoEYuMMQkzh2C1mOM
         ePMgnrx7m2nknJcK3x7bUhYj1hZgCBcmC6WwKPshyL4XP8A8daCfizvngkBTCHRGHHzv
         cEA8Qqh5i6hU1wip8M5uH9o6lm9+akwcMK/8xmshT6pSmpZdM8PcUexHSf3TKCaONb8y
         +hiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnPb7LjpZbi8z0i/NV9Boe241/jcsQUqD7Q/oSxzDqrk8d61HATdojzLLhbvSTfOlRDSmPJb4f+/t+QWvIxSzat3avqdEE6btI
X-Gm-Message-State: AOJu0YwyutxTkEVw6qChmQG8qi19wRNYqDgMX+dx050FbdFnqDAipHU2
	MpROn2xkKoItcpY9DiCufWx6iaq+VV9x5hHbGj6ZA7Q//SVjt4ia5+czQ9LshOw=
X-Google-Smtp-Source: AGHT+IF776zoVnfiTTi5WIsaQ3v4fo6KtFc0W2tiXFHOJ67WtrOcZCtTV47KUhKhuAyowf9bIsmn8g==
X-Received: by 2002:a17:90b:1001:b0:2a2:775:9830 with SMTP id gm1-20020a17090b100100b002a207759830mr3316998pjb.11.1712942005487;
        Fri, 12 Apr 2024 10:13:25 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:121b:da6b:94f1:304])
        by smtp.gmail.com with ESMTPSA id ge21-20020a17090b0e1500b002a6e67e197dsm1458645pjb.45.2024.04.12.10.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 10:13:24 -0700 (PDT)
Date: Fri, 12 Apr 2024 10:13:22 -0700
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
Subject: Re: [PATCH 03/19] dt-bindings: riscv: Add xtheadvector ISA extension
 description
Message-ID: <Zhlrsl7CKcl6cdSC@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-3-4af9815ec746@rivosinc.com>
 <20240412-ream-dwarf-8cdc3d0f279c@wendy>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-ream-dwarf-8cdc3d0f279c@wendy>

On Fri, Apr 12, 2024 at 11:27:23AM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:09PM -0700, Charlie Jenkins wrote:
> > The xtheadvector ISA extension is described on the T-Head extension spec
> > Github page [1].
> > 
> > [1] https://github.com/T-head-Semi/thead-extension-spec/blob/master/xtheadvector.adoc
> 
> Link: <foo> [1]
> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/extensions.yaml | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > index 468c646247aa..3fd9dcf70662 100644
> > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > @@ -477,6 +477,10 @@ properties:
> >              latency, as ratified in commit 56ed795 ("Update
> >              riscv-crypto-spec-vector.adoc") of riscv-crypto.
> >  
> > +        # vendor extensions, each extension sorted alphanumerically under the
> > +        # vendor they belong to. Vendors are sorted alphanumerically as well.
> > +
> > +        # Andes
> >          - const: xandespmu
> >            description:
> >              The Andes Technology performance monitor extension for counter overflow
> > @@ -484,5 +488,10 @@ properties:
> >              Registers in the AX45MP datasheet.
> >              https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> >  
> > +        # T-HEAD
> > +        - const: xtheadvector
> > +          description:
> > +            The T-HEAD specific 0.7.1 vector implementation.
> 
> This needs the link and a SHA or some other reference to the version
> of the document.

Okay will add, thank you.

- Charlie

> 
> Thanks,
> Conor.
> 
> > +
> >  additionalProperties: true
> >  ...
> > 
> > -- 
> > 2.44.0
> > 



