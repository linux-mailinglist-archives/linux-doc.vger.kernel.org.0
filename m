Return-Path: <linux-doc+bounces-13616-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 773F789BDB1
	for <lists+linux-doc@lfdr.de>; Mon,  8 Apr 2024 13:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23D9A284CA0
	for <lists+linux-doc@lfdr.de>; Mon,  8 Apr 2024 11:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B15964CCC;
	Mon,  8 Apr 2024 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QUnnJn8p"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37463626CD
	for <linux-doc@vger.kernel.org>; Mon,  8 Apr 2024 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712574239; cv=none; b=ZkHxpVXdYewYZNDtD3uc28YvaN30AwusFzkANDsS/zT7G1kKQIHbTC/CjkFkTaQee/03ZQyolwxL6UxvLTV36r204zKTWWDvIITaIKZmyEyJpBmABMVuKfZDwzXDkOqYVjT4VQobwWPWr9r/zDS88zVtY2vp0TO7+f7a8RKeerc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712574239; c=relaxed/simple;
	bh=wkKRyt/Vw/5zc5dlJy0JHXCMpR/2OfytD1MG2A8RMO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAIBQ2viy8Hh97QeTUdNdKV2+wVeUle9BRAseiLL7arM6WbwL+4UeQTX1ZecxWBmtX9xzQzijXkP0X3lK7WjV8M4DEOCAn0q3w38Ga45nwvSvaQpHw44M0OvR/gDVmthO0qX5pWRyg+ensQMzKaDQU9xJ9oTINGKOb3vfVlsWIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QUnnJn8p; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51e368c6dcso4741166b.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Apr 2024 04:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712574236; x=1713179036; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4g1Fe38jasdHywEL2euSnsmLnhOpgJ82XZytSUr/W9Q=;
        b=QUnnJn8pEBYu+zh4J/NCAw2trUTPY4j7dqg1dvLrnb7kRyq47WMMmXmsPGkDqeCqam
         5qSVvM/tQNajw1Tbw2wJ3UXlD30gyrnfkchtL3WmvUS9z1oAWL48DGwoIW0GG284ZFzF
         2nn6O9pXtb2isRu1dwwWA7md9vFurJiOfbQHT87T/K4yFdO/WSPp/Ma7LFomKR0piXNa
         YMKyTmZhMaD7vxSqW3eBqJzaYu6AeglocNS+UxJ+NxfsNJzcPdGTCDBkN8/JlFbZtkif
         Err7zcMtdQTnJCj8fmn1PT+otC5l8H2OoxV5lto8v3CQLmNvp/0KbpCw0eil8FHz6w/N
         m1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712574236; x=1713179036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4g1Fe38jasdHywEL2euSnsmLnhOpgJ82XZytSUr/W9Q=;
        b=Q1x5YuHnKM8B1cT4e1qWKpJs2ciwq6V4UWnjGjkDPOYwIKRHMyhMQWpWoMkoZkcSjM
         D2WytLsLEOaxApmmazfLqQFH6efRCeR3HJgpegYoj0MMLHAb9CPLTqoKG8+Iq4rUlX+4
         VAA5h0aVrGV6/0G37+amPTaXyRLjMy1cK6V6DWXhpdgy65X34pD8RGz0cxraUgaDN4Nk
         P2JjB3+8X8mRL+dSZzxeyHmYG8uzo9aNwFAGBo7vCuHRWHqrPbzSTIYEgj8ITqg32qVd
         ZkR+o0EfuBikxa4TUDkL7oLfjfUEbF2nDCq5aGleu4xMY7lerAK540B2nuH+CY8UnCz9
         Bp8A==
X-Forwarded-Encrypted: i=1; AJvYcCUroGm7Ov6Gy8d8iVvikpRPhNV3vKEILiqL+HpjJxkHHNr50a0/qhqrWP7ncJn8vFtp/Z+W1TjjOM24Ll5rSjMHkVTRPz/svD50
X-Gm-Message-State: AOJu0YyoxYRH3n/Mad9gGclLBvPv/eF9f0UOAR9c5tF25Q5JZOjaFl44
	qiv6YxeRvxp6PVCy8Z3tO4jy9BvDmw8BbM5yssCVO+a+Vv4uW1wxa0ldL+sD9XY=
X-Google-Smtp-Source: AGHT+IGnIHRj0+4dG4NgzsNXCqgJTww4f9iaHdQi6M7w7Zma3E/8aHUoufLLnKT3jNOOK2m1ikAHoA==
X-Received: by 2002:a17:906:31d4:b0:a46:da28:992e with SMTP id f20-20020a17090631d400b00a46da28992emr5801257ejf.71.1712574236283;
        Mon, 08 Apr 2024 04:03:56 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b15-20020a170906d10f00b00a4df4243473sm4279042ejz.4.2024.04.08.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 04:03:55 -0700 (PDT)
Date: Mon, 8 Apr 2024 13:03:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/5] Add parsing for Zimop ISA extension
Message-ID: <20240408-6c93f3f50b55234f3825ca33@orel>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
 <20240405-091c6c174f023d74b434059d@orel>
 <CAKC1njQ3qQ8mTMoYkhhoGQfRSVtp2Tfd2LjDhAmut7UcW9-bGw@mail.gmail.com>
 <ddc5555a-3ae8-42e5-a08a-ca5ceaf0bf28@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddc5555a-3ae8-42e5-a08a-ca5ceaf0bf28@rivosinc.com>

On Mon, Apr 08, 2024 at 10:01:12AM +0200, Clément Léger wrote:
> 
> 
> On 05/04/2024 19:33, Deepak Gupta wrote:
> > On Fri, Apr 5, 2024 at 8:26 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >>
> >> On Thu, Apr 04, 2024 at 12:32:46PM +0200, Clément Léger wrote:
> >>> The Zimop ISA extension was ratified recently. This series adds support
> >>> for parsing it from riscv,isa, hwprobe export and kvm support for
> >>> Guest/VM.
> >>
> >> I'm not sure we need this. Zimop by itself isn't useful, so I don't know
> >> if we need to advertise it at all. When an extension comes along that
> >> redefines some MOPs, then we'll advertise that extension, but the fact
> >> Zimop is used for that extension is really just an implementation detail.
> > 
> > Only situation I see this can be useful is this:--
> > 
> > An implementer, implemented Zimops in CPU solely for the purpose that they can
> > run mainline distro & packages on their hardware and don't want to leverage any
> > feature which are built on top of Zimop.
> 
> Yes, the rationale was that some binaries using extensions that overload
> MOPs could still be run. With Zimop exposed, the loader could determine
> if the binary can be executed without potentially crashing. We could
> also let the program run anyway but the execution could potentially
> crash unexpectedly, which IMHO is not really good for the user
> experience nor for debugging. I already think that the segfaults which
> happens when executing binaries that need some missing extension are not
> so easy to debug, so better add more guards.

OK. It's only one more extension out of dozens, so I won't complain more,
but I was thinking that binaries that use particular extensions would
check for those particular extensions (step 2), rather than Zimop.

Thanks,
drew

> 
> > 
> > As an example zicfilp and zicfiss are dependent on zimops. glibc can
> > do following
> > 
> > 1) check elf header if binary was compiled with zicfiss and zicfilp,
> > if yes goto step 2, else goto step 6.
> > 2) check if zicfiss/zicfilp is available in hw via hwprobe, if yes
> > goto step 5. else goto step 3
> > 3) check if zimop is available via hwprobe, if yes goto step 6, else goto step 4
> 
> I think you meant step 5 rather than step 6.
> 
> Clément
> 
> > 4) This binary won't be able to run successfully on this platform,
> > issue exit syscall. <-- termination
> > 5) issue prctl to enable shadow stack and landing pad for current task
> > <-- enable feature
> > 6) let the binary run <-- let the binary run because no harm can be done

