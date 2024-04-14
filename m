Return-Path: <linux-doc+bounces-14030-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C57168A358D
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 20:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82006284DCD
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 18:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6040E14F103;
	Fri, 12 Apr 2024 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0XvQ7PAO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E99514EC49
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712946174; cv=none; b=kon/Py8duTEbhOJQ4lt3ndJ4mXr1vBaIyzLXoINR04HBPlQ8qRelWLkM8IYn5Ao5RKaiN0sF0GH1s1BLBZairBLz4XCblob9RE/BIj/4uKklb754gVn5Gh/wx5rHkZDEAvuXtVR5GlUwvZ6IiH9zF1m6dPFX5U0LjTUnToXc5Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712946174; c=relaxed/simple;
	bh=nxs6ymKTj6HI1SwIdNFV/IpFSXZC5BKSvMerZjmyt/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6tTUPmMI/aeFXLgqrd6IT5JDidOVKaC0gPVhQBFw0mFgLd2dgXaACtmxMMbe8m8b78msui+8n2CVlM0S6vKWH0rL3G8MF76L1P8cjdvkELGah5r4P963jlvW/6uOjPZQ8rr8j2b3NkaqdP1QUvmrKMq7b6DQLoy6kwdNz+TXIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0XvQ7PAO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e3f17c6491so11080105ad.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 11:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712946172; x=1713550972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1e60CwK0PVttJs1oeSOiibpRUbN18cUEABEgzA6wIs=;
        b=0XvQ7PAOiGJEMrEOJbaDpdMLi5aFxGuUqVUmwqaAAaNmpHNhpI/mutnBUopimUJRrb
         3pT20o9tXQv8ahxxxJDPz3SM7xfGT/IK6Glpn0D6RvIYfKr5DT3PLules27rmpdQyXmf
         Z4jehc3raTyya8N83BDnKVtGuqM1fuej5iwN1sAUaV8BvJgTbp0gi9bMoDoJKdpjvqhH
         C1ZHTKoEoz11rhX+KesDfQFUyE2d1wLsQDfxhnAXEtInfi40EPC/UY/4wt5xGY1XEFaL
         Zi83UMx1lcu8TW51R4u2bZy8MbCB6ondUEFxMLEmhk2TdDs3gmhFsAC3xVYKkbo7kRVd
         HRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712946172; x=1713550972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1e60CwK0PVttJs1oeSOiibpRUbN18cUEABEgzA6wIs=;
        b=hUB2nw/ABDIP2emsnrwtUisALyQCFyU7p6MK9l6q9Wp5MItFWxbsQduW72RuFSz5vT
         utNs3huaijjyQ6tj6IXFu3WtJKbF543kq7yLvU0jH+rSuacg1G6UnUo+gek1MTotPygK
         C5tQ3Cu9hIGyz0Y+blupbfhGmI7wegwLUbZ349R9UkYCOWpe1WhiN1/Bw3U35f+3esOg
         3Igd8KY9BrQnMeUWq8eIZ4XuD5xhcfJSzdICjpupI+Hz7oNlHG246zECfSuiLHzrZvUj
         AwRHDsP2sH+mltby+Bl2TW0rcu0JbroSRC80z88qoPgtVw4EUUu8GYH7zV5oIH3afMbO
         HbRg==
X-Forwarded-Encrypted: i=1; AJvYcCVg4nTqevpe/hl91ryxiHxAg8/ebeu+BfeM6epYJuUD8RFQpUBtFf/3/KpiPLzDU7qyQX3xWhTssWLDRqCXTv49dnN3cbpIoUde
X-Gm-Message-State: AOJu0Ywu3M6lPtpMkkZa2lABjVEHjLsLOcdkWpoMSdTT9sVloIdFBssQ
	juTVYtlz1TJLquben0gb5Tgwr5AvJ7GbOIgUce2uSP6QkTgqHIlxSQ1dcV+1lRY=
X-Google-Smtp-Source: AGHT+IFxTX0XIuZbNR6qdEOLtuqZ+KqQsFRqq1yUy3tf+EcRY4ZnjF6vouMF9rorhX6yEu6I5X4zfw==
X-Received: by 2002:a17:903:32c7:b0:1e4:3b58:7720 with SMTP id i7-20020a17090332c700b001e43b587720mr4370912plr.2.1712946172563;
        Fri, 12 Apr 2024 11:22:52 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902684c00b001e3d2314f3csm3352924pln.141.2024.04.12.11.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:22:52 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:22:44 -0700
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
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 10/19] RISC-V: define the elements of the VCSR vector CSR
Message-ID: <Zhl79HOrWWGaM4lK@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-10-4af9815ec746@rivosinc.com>
 <20240412-viper-bullish-d57d19805a0c@wendy>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-viper-bullish-d57d19805a0c@wendy>

On Fri, Apr 12, 2024 at 12:27:50PM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:16PM -0700, Charlie Jenkins wrote:
> > From: Heiko Stuebner <heiko@sntech.de>
> > 
> > The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].
> > 
> > Define constants for those to access the elements in a readable way.
> > 
> > Acked-by: Guo Ren <guoren@kernel.org>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> You need to sign off on this as the submitter Charlie.

I wasn't sure, thank you!

- Charlie



