Return-Path: <linux-doc+bounces-13523-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC3C89908A
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 23:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE6E21C22439
	for <lists+linux-doc@lfdr.de>; Thu,  4 Apr 2024 21:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F47B13BC38;
	Thu,  4 Apr 2024 21:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XK1jAX6K"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A827313B787
	for <linux-doc@vger.kernel.org>; Thu,  4 Apr 2024 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712266766; cv=none; b=Q/xD2ytltdnT0uw0zmNQLjerkdY6jyIqAZxDF7G7aPHk1rp24oi2Uxr4v/611AHzSXXctjDt/SJi5W5GQ75+lmJoqFPKx1eK4cBVeYiiMQsl9s0nLhdTnN6oRfMkZRNL9+qmcYgB5FEkaT8xTz46Qi+bNC+HceImO2pfa+Ly+04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712266766; c=relaxed/simple;
	bh=Zt3p9tm6ccxc55MDuLlmUGMbvykDWgHwcdcfZ9QX5/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJHAvQAJFeEdyv1IpIofvNOGV3lVvIdVe6Yco0Ge0gETEiCUrNqDV5bFo3OHebpOu/V3P+rHsXS/+xnHRC+zQHXDWrAoFqn2/3TariDw1lMSitN/Wi4JVFPgdcYCDFfr1N1c307adghNN81QjVj7SlzmMxHeWDGJ5smZlVF996g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XK1jAX6K; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e0d82d441bso13784235ad.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2024 14:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712266764; x=1712871564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fPArP3ejLo3l+aX8ToKGJxurh8OEHx4iQxc5XkqOF4g=;
        b=XK1jAX6K8VflAzuRMINM++28+YHBOii5vu8nrxPFZ3gyFsnviquih7GU0vTtK6FX+2
         1sGWaS2U8myytUsmi7UmwKxVQQGZl+vWd6wrkz2OA2mLNKomKepdIhp8jk9h0ZSQ76XV
         5MeG/9wWhrDQ1qlxAGKRtmV/SGtznnQbJsMjxbwH4YheOtY3pq02RKu82sgXTnpMCy+R
         JQ+mvfq2QOaE8zwWRXGBgTQ7wjESzbqnc888VZq/cVJTO3vtU662o00QO+lYpiQC6i/1
         6irOXT1XRWWzOSKw3WpArC5/sQTCltw++pzk8kcPHQC/9dH46cmh4fgwxbx5ng5n4VQa
         UBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712266764; x=1712871564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPArP3ejLo3l+aX8ToKGJxurh8OEHx4iQxc5XkqOF4g=;
        b=M65oRG9kkvONKKt5+j0HD9cSDYCHZmt/6Cti4hagJsH7A6Z30+Qhy9gBP0IejxCj5m
         ifrOWYQuPbJJb2Hxb3hXAUDI1Z+aIl1t3jdoQi6g2jj/0dYDo6JVV1hZ9GSXmqDBIxbG
         hwWswLJ2VI5pTT2kBe9qMO5t+lXXCYZ0QRJydjVvlD4zu1lC8NmBkbFiswzYnJfL9Mkj
         NP3rZKnnwH/k7YUAvCc5IlyaD219XRGBLrCzJwWw3+SBuymwne3fAz9wOcTpZ9wC8k6J
         /nBYm6K0dK2QjnkY1PNvIXdEJOrAjMLzngcAFWqGB4Mb+UM6FhPPe/RVlHFD1xyvjeJj
         kGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS2QsmQreI5Slf8+bB2p640eLe4PRs+yOqmO0Dq0TMcOO257Y5YcR82SOfr+MWJck/kKb5LWY1Lf37wlqV496JGH0AfM8UjlOl
X-Gm-Message-State: AOJu0Yzc/M6R3CON1Br+2PqwlPDs4kmPVqRIJB9xk47Kiox4FFWOguTs
	wwUXqnK05iGJF0AFsmV7PAAAFy3r96xuExAbQHj3Z8ZkxnicTuiKWBcYJHFfao4=
X-Google-Smtp-Source: AGHT+IFPYkwFkCWA+SA7mff7SB9WJfJBYnvlFHy9eSaPUSq9JIjSJtsLm/B02BDU1sUJv+HfqHd+4Q==
X-Received: by 2002:a17:902:f68a:b0:1e2:887a:68a7 with SMTP id l10-20020a170902f68a00b001e2887a68a7mr4103646plg.33.1712266763893;
        Thu, 04 Apr 2024 14:39:23 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id l10-20020a170903244a00b001e29833ada6sm89367pls.140.2024.04.04.14.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 14:39:23 -0700 (PDT)
Date: Thu, 4 Apr 2024 14:39:20 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: David Hildenbrand <david@redhat.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	charlie@rivosinc.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, catalin.marinas@arm.com, revest@chromium.org,
	josh@joshtriplett.org, shr@devkernel.io, deller@gmx.de,
	omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 09/29] mm: abstract shadow stack vma behind
 `vma_is_shadow_stack`
Message-ID: <Zg8eCPJvmk93vKQK@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-10-debug@rivosinc.com>
 <c438ea3a-24bc-470b-a2eb-6e7517bd4362@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c438ea3a-24bc-470b-a2eb-6e7517bd4362@redhat.com>

On Thu, Apr 04, 2024 at 09:02:17PM +0200, David Hildenbrand wrote:
>On 04.04.24 01:34, Deepak Gupta wrote:
>>  		}
>>-	} else if (!(vm_flags & VM_READ)) {
>>+	} else if (!(vm_flags & VM_READ) && !vma_is_shadow_stack(vm_flags)) {
>>+	/* reads allowed if its shadow stack vma */
>>  		if (!(gup_flags & FOLL_FORCE))
>>  			return -EFAULT;
>>  		/*
>
>Unless I am missing something, this is not a simple cleanup. It should 
>go into a separate patch with a clearly documented reason for that 
>change.

I tried that here
https://lore.kernel.org/linux-mm/CAKC1njTPBqtsAOn-CWhB+-8FaZ2KWkkz-vRZr7MZq=0yLUdjcQ@mail.gmail.com/T/
But at that time, VM_SHADOW_STACK for riscv meant only VM_WRITE. So I think
there was obvious uneasiness with that part.

Now we have VM_SHADOW_STACK pretty much same for all arches and only 64bit.
I'll try it again as a separate patch.

>
>-- 
>Cheers,
>
>David / dhildenb
>

