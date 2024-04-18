Return-Path: <linux-doc+bounces-14481-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E22A8A8EFA
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 00:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 190EA2817A7
	for <lists+linux-doc@lfdr.de>; Wed, 17 Apr 2024 22:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4408172F;
	Wed, 17 Apr 2024 22:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ypiMJC8h"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2917122F19
	for <linux-doc@vger.kernel.org>; Wed, 17 Apr 2024 22:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713394291; cv=none; b=lL+XU1BIWc85JeLbWQHPLkIiEjCSVsUUfGfR4NRnMHq7pDle8r4mQkU8JcwjiQ8Ln4NVnxF4Ag3YeeoGcu0m0iAuzeIiDWpYuZj4nWCnIkLZScjG/nE1vtr+uxXqz4O9oJ7soveZoUnht4ZlL5+l3muOWsuwryidgQBGFV6Lkl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713394291; c=relaxed/simple;
	bh=ABLnPb+FzE7ddsHXVQyfOs5AvG3SKdeaNiBYdaJWL7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAEin0A8oCaGVEqiXIu4kSxzg0/fQaTyqbtg8X/CG3Sjp+sbVZEHDuOxpth/spptuU3bcv6xDBPu5o5Zu9ANWCEkgB85ZqfjP1rFMnq6P3JVnyTT4xaX5AnVQKqBmA52zmgGgaM8gMQd+wewrDvznt2dyGjWhGk9qBZIaqSOuxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ypiMJC8h; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e857e571f3so2494125ad.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Apr 2024 15:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713394288; x=1713999088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTSo6mWPNg3MYfgUA4f7wbCrE3rgzEA/5uO9sngH9Ec=;
        b=ypiMJC8htz0SzV77OnH1hGDY07FCkm1Cn/l8moaxQghn1omkNBLjqd3M8WFbsgX7Fd
         luCccF6roizrWvBweEw0T2xvDggtFz3bJrKFgjeVgPC6UTMxNRWLAuPw/KJll1x+X+C1
         T7ToNcG1nIvST2X45TtQE7v+H82C6JEGRkkTMXkXakwiHBP/NnL0ql7mkS+zzPYU/+VS
         X5Fez+X+kkUAEPBE236UjvylCZWD9i+eQIwRXcjCrFGZd7ihl/SvubSuLWIIhPgIi48+
         lkYMVXNCqpdhoc7ufwIZxqvBy9zpftGZZplyNY1GIL3XyVEPPsv6W5n0h1MJJODWQboV
         erWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713394288; x=1713999088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTSo6mWPNg3MYfgUA4f7wbCrE3rgzEA/5uO9sngH9Ec=;
        b=A+z9ai4rc3adfW3cHW/s/fzNYrF7E7h47MEwyY5wkxCH2jPUSkcpKQ8Ovzmyyc/xWL
         o+tBQFDBXwxZrj2j/DPrw2wUwtW6SQItuiBWGUl6dDKTCSJHPsrcp89maVKYvrhSl7iv
         gToi0K/ezwZztCSIO4OGUk0/m8mtDJdVM8+wnHdlMUwzm2uvXkWoQVdW7/FAudMuFo/2
         +auKQdycYCFVDpZer4+apsko5xRE8K0ldLIVHaRIB+9YH9ovEbVqDHQQ1bkn5lI13zho
         7yeehlE+zRtnV+0Fp7PoX4kH6C3lAnLg4aAP4qZX1cKoU5B4yKH3NfdAdO0yoMD4FYZW
         q19Q==
X-Forwarded-Encrypted: i=1; AJvYcCWygYQYvPvjdzxD0mdXYlE/ZoydhGOANC2iB3ooJLp9iXFdQ4AVFAA9nMiawimNdKX25q0LFwCX5DsgzGJX3S0ZzJc6HeHdSDTT
X-Gm-Message-State: AOJu0Yw6kKXW/QHQcDmHkIUvb6R8QpxCIxKGqMaLhGnyRxiRrZ69vN0H
	4Rt0gxqDUx027dxfz74aWiBGKubG97hGwHETpYOLFQR6wnqpxo4vPJjqSUBOSIw=
X-Google-Smtp-Source: AGHT+IHrFjHxUYakHuwCu0KxAXJxMjlVzPR4wDunk8LV/EImWNwQf6hbQbYi/IvWQK0xsqjlBoez7Q==
X-Received: by 2002:a17:902:76c9:b0:1e5:3d8a:75fd with SMTP id j9-20020a17090276c900b001e53d8a75fdmr859944plt.69.1713394288489;
        Wed, 17 Apr 2024 15:51:28 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001e45572a253sm172327plb.14.2024.04.17.15.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 15:51:27 -0700 (PDT)
Date: Wed, 17 Apr 2024 15:51:24 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v2 02/17] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Message-ID: <ZiBSbETx++uIIknH@ghost>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
 <20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com>
 <20240416-underwire-bright-b2ab0fa991ec@spud>
 <Zh7i2pir0j6tXfPD@ghost>
 <20240416-budget-cause-c4002a9cc05b@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416-budget-cause-c4002a9cc05b@spud>

On Tue, Apr 16, 2024 at 10:10:39PM +0100, Conor Dooley wrote:
> On Tue, Apr 16, 2024 at 01:43:06PM -0700, Charlie Jenkins wrote:
> > On Tue, Apr 16, 2024 at 04:16:30PM +0100, Conor Dooley wrote:
> > > On Mon, Apr 15, 2024 at 09:11:59PM -0700, Charlie Jenkins wrote:
> > > > The xtheadvector ISA extension is described on the T-Head extension spec
> > > > Github page [1] at commit 95358cb2cca9.
> > > > 
> > > > Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d3
> > > > 35e03d3134b14133f/xtheadvector.adoc [1]
> > > 
> > > This should not be wrapped btw.
> > > Otherwise,
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > I don't believe it is wrapped? It appears wrapped in your response but
> > it appears on lore correctly:
> > 
> > https://lore.kernel.org/lkml/20240415-dev-charlie-support_thead_vector_6_9-v2-2-c7d68c603268@rivosinc.com/
> 
> IDK man, looks wrapped on lore too. The other copy of the same link
> isn't wrapped & I've never had mutt wrap stuff like this before.

Oops, I was looking at the second one and not the one in the commit message...

Thanks.

- Charlie



