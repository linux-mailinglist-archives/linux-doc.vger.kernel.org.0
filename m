Return-Path: <linux-doc+bounces-4308-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AAC80794E
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 21:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEC2D1F21265
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 20:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E446F62A;
	Wed,  6 Dec 2023 20:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PVn50Q4R"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ADA8D62
	for <linux-doc@vger.kernel.org>; Wed,  6 Dec 2023 12:22:52 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d08a924fcfso1372475ad.2
        for <linux-doc@vger.kernel.org>; Wed, 06 Dec 2023 12:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701894172; x=1702498972; darn=vger.kernel.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=wEKgHh9Vd3x1VnCH3fKyTqAO4yCFQDcZVScsz606mCI=;
        b=PVn50Q4RLuzMR14j+U6APgpOl2LYdffAuu+oeSRN0D/cWGpiAcHNPva2TRKwQUqIk+
         v8ORKAOfxQxnGFBxZCn7bPwqMBjCkNtHMGbcS0jEW08ItZonzA9v4FJP2rjEsCeNtWxT
         4p9WCxws66nAVAlPjIxp6hxAKJuGXia1NgwMFrasXuW3zz7yPF2sN9krvj+ruchKrVjM
         i95eq/DPs97H1ROevLCgRL99MvLLL+jl1pzVnKadI0Fn2oKggKC9aurPt3iMvwXwUpQD
         V6RNQFqiwu0bL0OPMslIdDoczVs07ppstSXEpmCSmHwqQIkxWU3ZjpXU6dvJhCvwHJIW
         W23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701894172; x=1702498972;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEKgHh9Vd3x1VnCH3fKyTqAO4yCFQDcZVScsz606mCI=;
        b=Cj6G4nTc7LVibK6xgRjYj4fQZ9QHMyWy+6foVtyUVZCWsbEx1w3pjl3m3YHC//RdOo
         Zy4B8h5gvKOPZGx4cjmGKQvUcBH0aAYejJbdBOytp2eUzNmfPgQAZeCDUGUJqehg3nli
         PbdAA6+p7xkTR9w4f+EpFN/z1FPr7frRVGUO8LxT+jIaV4mwXr6jM48sgcZsOWxkoNtT
         Kb4LZYZUHUkDjdiCc1rDaxI6WY6elIp7KfKZr4+pIQKloSY8zMce4M81vjl3iUxF8bnK
         KLWus/u0ospW2u4dvg0yBB51fEkVtW7f/jTnNAGDd7quXMVnB6jfosgVNhCwTXAGDhs2
         GBCw==
X-Gm-Message-State: AOJu0YzZd2KsSqonCFPMc/S0E6L4BAhOakafXdOgl+ey5zGFt3qVtTrx
	XnUYmbEfZ2nKJ82Lb/p+LVkHwg==
X-Google-Smtp-Source: AGHT+IG+PGi/Ruq72+ftbttXAOwy9ae3wKn38k1eINbZqpLAyVIquTjmRIENSAWXjKXoIaCS0/BIwA==
X-Received: by 2002:a17:902:d502:b0:1d0:92a0:492b with SMTP id b2-20020a170902d50200b001d092a0492bmr1505448plg.84.1701894171625;
        Wed, 06 Dec 2023 12:22:51 -0800 (PST)
Received: from localhost ([2804:14d:7e22:803e:f0e2:3ff1:8acc:a2d5])
        by smtp.gmail.com with ESMTPSA id z2-20020a170902ee0200b001d071a305ecsm217078plb.245.2023.12.06.12.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 12:22:51 -0800 (PST)
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-21-201c483bd775@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 21/39] arm64/gcs: Allocate a new GCS for threads with
 GCS enabled
In-reply-to: <20231122-arm64-gcs-v7-21-201c483bd775@kernel.org>
Date: Wed, 06 Dec 2023 17:22:49 -0300
Message-ID: <87il5bhyhy.fsf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Mark Brown <broonie@kernel.org> writes:

> When a new thread is created by a thread with GCS enabled the GCS needs
> to be specified along with the regular stack.  clone3() has been
> extended to support this case, allowing userspace to explicitly request
> the size for the GCS to be created, but plain clone() is not extensible
> and existing clone3() users will not specify a size.
>
> For compatibility with these cases and also x86 (which did not initially
> implement clone3() support for shadow stacks) if no GCS is specified we
> will allocate one thread so when a thread is created which has GCS
                    ~~~~~~

This "thread" seems extraneous in the sentence. Remove it?

> enabled allocate one for it.  We follow the extensively discussed x86
> implementation and allocate min(RLIMIT_STACK, 4G).  Since the GCS only

Isn't it min(RLIMIT_STACK/2, 2G)?

> stores the call stack and not any variables this should be more than
> sufficient for most applications.
>
> GCSs allocated via this mechanism then it will be freed when the thread
> exits.

I'm not sure I parsed this sentence correctly. Is it missing an "If" at
the beginning?

-- 
Thiago

